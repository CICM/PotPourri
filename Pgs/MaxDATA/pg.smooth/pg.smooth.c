
#include "ext.h"
#include "ext_obex.h"
#include "ext_common.h"

typedef struct  _smooth
{
	t_object f_ob;

	void	*out;
	void	*out2;
	short	f_listSize;
	long	f_count;
	int		f_limit;

	/* Resultats */

	t_atom	*f_resultList;
	t_atom	*f_in;
	double	*f_result;

	/* Mode et type*/
	long	f_mode;
	char	f_type;

} t_smooth;

t_symbol *ps_bang;

void *smooth_class;

void smooth_assist(t_smooth *x, void *b, long m, long a, char *s);
void smooth_int(t_smooth *x, long n);
void smooth_float(t_smooth *x, double f);
void smooth_bang(t_smooth *x);
void smooth_list(t_smooth *x, t_symbol *s, short ac, t_atom *av);
void *smooth_new(t_symbol *s, int argc, t_atom *argv);
void smooth_free(t_smooth *x);
void smooth_resize(t_smooth *x, long size);
void smooth_reset(t_smooth *x);
void smooth_perform(t_smooth *x, short ac, t_atom *av);
void smooth_limit(t_smooth *x, long n);

int main()
{
	t_class *c;

	c = class_new("pg.smooth", (method)smooth_new, (method)smooth_free, (short)sizeof(t_smooth), 0L, A_GIMME, 0);
	class_addmethod(c, (method)smooth_int,		"int",		A_LONG,		0);
	class_addmethod(c, (method)smooth_float,	"float",	A_FLOAT,	0);
	class_addmethod(c, (method)smooth_list,		"list",		A_GIMME,	0);
	class_addmethod(c, (method)smooth_bang,		"bang",					0);
	class_addmethod(c, (method)smooth_reset,	"clear",				0);
	class_addmethod(c, (method)smooth_assist,	"assist",	 A_CANT,	0);
	
	class_register(CLASS_BOX, c);
	smooth_class = c;
			
	CLASS_ATTR_LONG				(c, "size", 0, t_smooth, f_limit);
	CLASS_ATTR_LABEL			(c, "size", 0, "Size");
	CLASS_ATTR_ORDER			(c, "size", 0, "-1");
	CLASS_ATTR_FILTER_MIN		(c, "size", 1);
	CLASS_ATTR_DEFAULT			(c, "size", 0, "10");
	CLASS_ATTR_SAVE				(c, "size", 1);

	post("pg.smooth by Pierre Guillot",0);
	post("Universite Paris 8, France",0);

	return 0;
}

void *smooth_new(t_symbol *s, int argc, t_atom *argv)
{
	t_smooth *x = NULL;
	
	if (x = (t_smooth *)object_alloc(smooth_class)) 
	{
		
		x->f_count = 0;
		x->f_limit = 10;
	
		x->f_in = (t_atom *)sysmem_newptr(1*sizeof(t_atom));

		x->out = listout((t_object *)x);;

		attr_args_process (x, argc, argv);
	}
	return x;
}			

void smooth_assist(t_smooth *x, void *b, long m, long a, char *s)
{
	if (m == ASSIST_INLET)
		sprintf(s,"Input (int, float or list)");
	else 
	{
		sprintf(s,"Smooth values (int, float or list)");
	}
}

void smooth_int(t_smooth *x, long n)
{
	if ( x->f_type != 'i') x->f_count = 0;
	x->f_type = 'i';

	smooth_resize(x,1);
	atom_setfloat(x->f_in, (float)n);

	smooth_perform(x, 1, x->f_in);

}

void smooth_float(t_smooth *x, double f)
{
	if ( x->f_type != 'f') x->f_count = 0;
	x->f_type = 'f';

	smooth_resize(x,1);
	atom_setfloat(x->f_in, (float)f);

	smooth_perform(x, 1, x->f_in);

}



void smooth_list(t_smooth *x, Symbol *s, short ac, t_atom *av)
{
	if ( x->f_type != 'l') x->f_count = 0;
	x->f_type = 'l';
	
	smooth_resize(x,ac);

	smooth_perform(x, ac, av);

}

void smooth_perform(t_smooth *x, short ac, t_atom *av)
{
	int i;


	for (i = 0; i < ac; i++, av++) 
	{
		if (atom_gettype(av)==A_LONG)
		{
			if (x->f_count == 0) x->f_result[i] = (float)atom_getlong(av);
			else
			x->f_result[i] = x->f_result[i] + ((float)atom_getlong(av)- x->f_result[i])*(2.f/(x->f_limit+1));;
			atom_setfloat(x->f_resultList+i, x->f_result[i]);
		}
		else if (atom_gettype(av)==A_FLOAT)
		{
			if (x->f_count == 0) x->f_result[i] = atom_getfloat(av);
			else
			x->f_result[i] = x->f_result[i] + (atom_getfloat(av)- x->f_result[i])*(2.f/(x->f_limit+1));
			atom_setfloat(x->f_resultList+i, x->f_result[i]);
		}
	}

	outlet_list(x->out,0L,ac,x->f_resultList);
	x->f_count++;
}

void smooth_bang(t_smooth *x)
{
	if(x->f_count != 0) outlet_list(x->f_ob.o_outlet,0L,x->f_listSize,x->f_resultList);
}

void smooth_reset(t_smooth *x)
{
	x->f_count = 0;
}

void smooth_free(t_smooth *x)
{
	if (x->f_result) sysmem_freeptr(x->f_result);
	if (x->f_resultList) sysmem_freeptr(x->f_resultList);
	if (x->f_in) sysmem_freeptr(x->f_in);
}


void smooth_resize(t_smooth *x, long size)
{
	if (size != x->f_listSize) 
	{
		if (x->f_resultList)
		{

			sysmem_freeptr(x->f_result);
			sysmem_freeptr(x->f_resultList);
		}
		if (size)
		{
			
			x->f_result = (double *)sysmem_newptr(size*sizeof(double));
			x->f_resultList = (t_atom *)sysmem_newptr(size*sizeof(t_atom));
		}
		else
		{

			x->f_result = NULL;
			x->f_resultList = NULL;
		}
		x->f_listSize = size;
		x->f_count = 0;
	}
}

void smooth_limit(t_smooth *x, long n)
{
	if (n <= 0) n = 1;
	x->f_limit = n;
}