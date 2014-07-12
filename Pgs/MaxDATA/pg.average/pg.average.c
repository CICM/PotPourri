
/* Max Library */
#include "ext.h"
#include "ext_obex.h"
#include "ext_common.h"

#define NMAX 256

typedef struct  _average
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
	double	*f_result[NMAX];

	/* Mode et type*/
	long	f_mode;
	char	f_type;

} t_average;

void *average_class;

void *average_new(t_symbol *s, int argc, t_atom *argv);
void average_free(t_average *x);
void average_assist(t_average *x, void *b, long m, long a, char *s);

void average_int(t_average *x, long n);
void average_float(t_average *x, double f);
void average_bang(t_average *x);
void average_list(t_average *x, t_symbol *s, short ac, t_atom *av);

void average_resize(t_average *x, long size);
void average_reset(t_average *x);
void average_static(t_average *x, short ac, t_atom *av);

void average_arithmetic(t_average *x, short ac, t_atom *av);
void average_geometric(t_average *x, short ac, t_atom *av);
void average_harmonic(t_average *x, short ac, t_atom *av);
void average_quadratic(t_average *x, short ac, t_atom *av);

int main()
{
	t_class *c;

	c = class_new("pg.average", (method)average_new, (method)average_free, (short)sizeof(t_average), 0L, A_GIMME, 0);
	class_addmethod(c, (method)average_int,		"int",		A_LONG,		0);
	class_addmethod(c, (method)average_float,	"float",	A_FLOAT,	0);
	class_addmethod(c, (method)average_list,	"list",		A_GIMME,	0);
	class_addmethod(c, (method)average_bang,	"bang",					0);
	class_addmethod(c, (method)average_reset,	"clear",				0);
	class_addmethod(c, (method)average_assist,	"assist",	 A_CANT,	0);
	
	class_register(CLASS_BOX, c);
	average_class = c;

	CLASS_ATTR_LONG				(c, "mode", 0, t_average, f_mode);
	CLASS_ATTR_LABEL			(c, "mode", 0, "Mode");
	CLASS_ATTR_ENUMINDEX		(c, "mode", 0, "Arithmetic \" Geometric \" Harmonic \" Quadratic");
	CLASS_ATTR_ORDER			(c, "mode", 0, "1");
	CLASS_ATTR_DEFAULT			(c, "mode", 0, "0");
	CLASS_ATTR_FILTER_CLIP		(c, "mode", 0, 3);
	CLASS_ATTR_SAVE				(c, "mode", 1);
			
	CLASS_ATTR_LONG				(c, "size", 0, t_average, f_limit);
	CLASS_ATTR_LABEL			(c, "size", 0, "Size");
	CLASS_ATTR_ORDER			(c, "size", 0, "-1");
	CLASS_ATTR_FILTER_CLIP		(c, "size", 1, NMAX);
	CLASS_ATTR_DEFAULT			(c, "size", 0, "10");
	CLASS_ATTR_SAVE				(c, "size", 1);

	post("pg.average by Pierre Guillot",0);
	post("Universite Paris 8, France",0);

	
	return 0;
}

void *average_new(t_symbol *s, int argc, t_atom *argv)
{
	t_average *x = NULL;
	
	if (x = (t_average *)object_alloc(average_class)) 
	{
		x->f_count = 0;
		x->f_limit = 10;
		x->f_mode = 0;
		x->f_in = (t_atom *)sysmem_newptr(1*sizeof(t_atom));

		x->out = listout((t_object *)x);;

		attr_args_process (x, argc, argv);
	}
	return x;
}			

void average_assist(t_average *x, void *b, long m, long a, char *s)
{
	if (m == ASSIST_INLET)
		sprintf(s,"int, float or list");
	else 
	{
		sprintf(s,"average");
	}
}

void average_int(t_average *x, long n)
{
	if ( x->f_type != 'i') x->f_count = 0;
	x->f_type = 'i';

	average_resize(x,1);
	atom_setfloat(x->f_in, (float)n);

	switch(x->f_mode)
	{
		case 0 : average_arithmetic(x, 1, x->f_in);
			break;
		case 1 : average_geometric(x, 1, x->f_in);
			break;
		case 2 : average_harmonic(x, 1, x->f_in);
			break;
		case 3 : average_quadratic(x, 1, x->f_in);
			break;
	}
	if(x->f_count < x->f_limit) x->f_count++;
	else x->f_count = x->f_limit;
}

void average_float(t_average *x, double f)
{
	if ( x->f_type != 'f') x->f_count = 0;
	x->f_type = 'f';

	average_resize(x,1);
	atom_setfloat(x->f_in, (float)f);
	switch(x->f_mode)
	{
		case 0 : average_arithmetic(x, 1, x->f_in);
			break;
		case 1 : average_geometric(x, 1, x->f_in);
			break;
		case 2 : average_harmonic(x, 1, x->f_in);
			break;
		case 3 : average_quadratic(x, 1, x->f_in);
			break;
	}
	if(x->f_count < x->f_limit) x->f_count++;
	else x->f_count = x->f_limit;
}



void average_list(t_average *x, Symbol *s, short ac, t_atom *av)
{
	if ( x->f_type != 'l') x->f_count = 0;
	x->f_type = 'l';
	
	average_resize(x,ac);
	switch(x->f_mode)
	{
		case 0 : average_arithmetic(x, ac, av);
			break;
		case 1 : average_geometric(x, ac, av);
			break;
		case 2 : average_harmonic(x, ac, av);
			break;
		case 3 : average_quadratic(x, ac, av);
			break;
	}
	if(x->f_count < x->f_limit) x->f_count++;
	else x->f_count = x->f_limit;
}

void average_static(t_average *x, short ac, t_atom *av)
{
	int i, b;
	t_atom *ap;

	for (i = 0, ap = av; i < ac; i++, ap++) 
	{
		if (atom_gettype(ap)==A_LONG)
		{
			for (b = x->f_limit-1; b > 0; b--)
			{
				x->f_result[b][i] = x->f_result[b-1][i];
			}
			x->f_result[0][i] = (double)atom_getlong(ap);
		}
		else if (atom_gettype(ap)==A_FLOAT)
		{
			for (b = x->f_limit-1; b > 0; b--)
			{
				x->f_result[b][i] = x->f_result[b-1][i];
			}
			x->f_result[0][i] = atom_getfloat(ap);			
		}
	}
}

void average_arithmetic(t_average *x, short ac, t_atom *av)
{
	int i, b;
	double moyenne = 0.f;

	average_static(x, ac, av);
	for (i = 0; i < ac; i++) 
	{
		if (x->f_count < x->f_limit)
		{
			for (b = 0; b < x->f_count+1; b++) 
			{
				moyenne += x->f_result[b][i];
			}
			moyenne /= x->f_count+1;
		}
		else if (x->f_count >= x->f_limit)
		{
			for (b = 0; b < x->f_limit; b++)
			{
				moyenne += x->f_result[b][i];
			}
			moyenne /= x->f_limit;
		}
		atom_setfloat(x->f_resultList+i, moyenne);
	}
	outlet_list(x->out,0L,ac,x->f_resultList);
}

void average_geometric(t_average *x, short ac, t_atom *av)
{
	int i, b;
	double moyenne = 1.f;

	average_static(x, ac, av);
	for (i = 0; i < ac; i++) 
	{
		if (x->f_count < x->f_limit)
		{
			for (b = 0; b < x->f_count+1; b++)
			{
				moyenne *= pow(x->f_result[b][i], ((double)1.f/(double)(x->f_count+1)));
			}
		}
		else if (x->f_count >= x->f_limit)
		{
			for (b = 0; b < x->f_limit; b++)
			{
				moyenne *= pow(x->f_result[b][i], ((double)1.f/(double)(x->f_limit)));
			}
		}
		atom_setfloat(x->f_resultList+i, moyenne);
	}
	outlet_list(x->out,0L,ac,x->f_resultList);
}

void average_harmonic(t_average *x, short ac, t_atom *av)
{
	int i, b;
	double moyenne =  0.f;

	average_static(x, ac, av);
	for (i = 0; i < ac; i++) 
	{
		if (x->f_count < x->f_limit)
		{
			for (b = 0; b < x->f_count+1; b++)
			{
				moyenne += (1.f/x->f_result[b][i]);
			}
			moyenne = (double)(x->f_count+1)/moyenne;
		}
		else if (x->f_count >= x->f_limit)
		{
			for (b = 0; b < x->f_limit; b++)
			{
				moyenne += (1.f/x->f_result[b][i]);
			}
			moyenne = (double)x->f_limit/moyenne;
		}
		atom_setfloat(x->f_resultList+i, moyenne);
	}

	outlet_list(x->out,0L,ac,x->f_resultList);
}

void average_quadratic(t_average *x, short ac, t_atom *av)
{
	int i, b;
	double moyenne =  0.f;

	average_static(x, ac, av);
	for (i = 0; i < ac; i++) 
	{
		if (x->f_count < x->f_limit)
		{
			for (b = 0; b < x->f_count+1; b++)
			{
				moyenne += x->f_result[b][i]*x->f_result[b][i];
			}
			moyenne /= (double)(x->f_count+1);
			moyenne = pow(moyenne,(double)0.5f);
		}
		else if (x->f_count >= x->f_limit)
		{
			for (b = 0; b < x->f_limit; b++) 
			{
				moyenne += x->f_result[b][i]*x->f_result[b][i];
			}
			moyenne /= (double)x->f_limit;
			moyenne = pow(moyenne, (double)0.5f);
		}
		atom_setfloat(x->f_resultList+i, moyenne);
	}

	outlet_list(x->out,0L,ac,x->f_resultList);
}

void average_bang(t_average *x)
{
	if(x->f_count != 0) outlet_list(x->out,0L,x->f_listSize,x->f_resultList);
}

void average_reset(t_average *x)
{
	x->f_count = 0;
}

void average_free(t_average *x)
{
	if (x->f_result) sysmem_freeptr(x->f_result);
	if (x->f_resultList) sysmem_freeptr(x->f_resultList);
	if (x->f_in) sysmem_freeptr(x->f_in);
}

void average_resize(t_average *x, long size)
{
	int i;
	if (size != x->f_listSize) 
	{
		if (x->f_resultList)
		{
			for(i = 0; i < NMAX; i++)
			{
				sysmem_freeptr(x->f_result[i]);
			}
			sysmem_freeptr(x->f_resultList);
		}
		if (size)
		{
			for(i = 0; i < NMAX; i++)
			{
				x->f_result[i] = (double *)sysmem_newptr(size*sizeof(double));
			}
			x->f_resultList = (t_atom *)sysmem_newptr(size*sizeof(t_atom));
		}
		else
		{
			for(i = 0; i < NMAX; i++)
			{
				x->f_result[i] = NULL;
			}
			x->f_resultList = NULL;
		}
		x->f_listSize = size;
		x->f_count = 0;
	}
}
