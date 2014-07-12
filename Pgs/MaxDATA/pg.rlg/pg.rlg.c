
#include "ext.h"
#include "ext_obex.h"
#include "ext_common.h"
#include <time.h>

#define NMAX 256

typedef struct  _rlg 
{
	t_object f_ob;

	long	f_proxy;
	void	*out;
	void	*in1;
	void	*in2;

	t_atom		*f_result;
	float		*f_resultFloat;
	short		f_listSize;
	short		f_newSize;

	float		f_min[NMAX];
	float		f_max[NMAX];	
	int			f_mode;

} t_rlg;

t_symbol *ps_bang;

void *rlg_class;

void *rlg_new(t_symbol *s, int argc, t_atom *argv);
void rlg_free(t_rlg *x);
void rlg_assist(t_rlg *x, void *b, long m, long a, char *s);
void rlg_bang(t_rlg *x);
void rlg_resize(t_rlg *x);
void rlg_int(t_rlg *x, long n);
void rlg_float(t_rlg *x, double f);
void rlg_list(t_rlg *x, t_symbol *s, long argc, t_atom *argv);


int main()
{
	t_class *c;

	c = class_new("pg.rlg", (method)rlg_new, (method)rlg_free, (short)sizeof(t_rlg), 0L, A_GIMME, 0);
	
	class_addmethod(c, (method)rlg_bang,		"bang",						0);
	class_addmethod(c, (method)rlg_assist,		"assist",		A_CANT,		0);
	class_addmethod(c, (method)rlg_int,			"int",			A_LONG,		0);
	class_addmethod(c, (method)rlg_float,		"float",		A_FLOAT,	0);
	class_addmethod(c, (method)rlg_list,		"list",			A_GIMME,	0);
	class_register(CLASS_BOX, c);
	rlg_class = c;

	CLASS_ATTR_LONG				(c, "size", 0, t_rlg, f_newSize);
	CLASS_ATTR_DEFAULT			(c, "size", 0, "10");
	CLASS_ATTR_LABEL			(c, "size", 0, "List Size");
	CLASS_ATTR_FILTER_CLIP		(c, "size", 1, NMAX);
	CLASS_ATTR_SAVE				(c, "size", 1);
	CLASS_ATTR_ORDER			(c, "size", 0, "1");
	
	CLASS_ATTR_LONG				(c, "mode", 0, t_rlg, f_mode);
	CLASS_ATTR_LABEL			(c, "mode", 0, "Mode");
	CLASS_ATTR_ENUMINDEX		(c, "mode", 0, "Integer \"Float" );
	CLASS_ATTR_SAVE				(c, "mode", 1);
	CLASS_ATTR_DEFAULT			(c, "max", 0, "1");
	
	post("pg.rlg by Pierre Guillot",0);
	post("Universite Paris 8, France",0);

	return 0;
}

void *rlg_new(t_symbol *s, int argc, t_atom *argv)
{
	t_rlg *x = NULL;
	int i;
	if (x = (t_rlg *)object_alloc(rlg_class))
	{

	x->f_resultFloat = NULL;
	x->f_result = (t_atom *)sysmem_newptr(x->f_listSize*sizeof(t_atom));
	for(i = 0; i < NMAX; i++) x->f_min[i] = 0;
	for(i = 0; i < NMAX; i++) x->f_max[i] = 10;
	srand(time(NULL));

	x->in1 = proxy_new((t_object *)x, 2, &x->f_proxy);
	x->in2 = proxy_new((t_object *)x, 1, &x->f_proxy);
	x->out = listout(x);
	attr_args_process (x, argc, argv);
	}
	
	return x;
}			

void rlg_assist(t_rlg *x, void *b, long m, long a, char *s)
{
	if (m == ASSIST_INLET)
		switch (a) 
		{	
			case 0:
				sprintf(s,"Bang ");
				break;
			case 1:
				sprintf(s,"(int, float, list) Minimum");
				break;
			case 2:
				sprintf(s,"(int, float, list) Maximum");
				break;
		}
		
	else sprintf(s,"Random (list)");
}

void rlg_int(t_rlg *x, long n)
{
	int i;
	switch (proxy_getinlet((t_object *)x)) 
	{
		case 1:
		{
			for(i = 0; i < NMAX; i++) x->f_min[i] = (float)n;	
		}
		break;
		case 2:
		{
			for(i = 0; i < NMAX; i++) x->f_max[i] = (float)n;
		}
		break;
		default:
		{
			post("wrong inlet for int");
		}
	}
}

void rlg_float(t_rlg *x, double f)
{
	int i;
	switch (proxy_getinlet((t_object *)x)) 
	{
		case 1:
		{
			for(i = 0; i < NMAX; i++) x->f_min[i] = f;
		}
		break;
		case 2:
		{
			for(i = 0; i < NMAX; i++) x->f_max[i] = f;
		}
		break;
		default:
		{
			post("wrong inlet for float");
		}
	}
}

void rlg_list(t_rlg *x, t_symbol *s, long argc, t_atom *argv)
{
	long i;
	t_atom *ap;
	t_atom newlist[NMAX];

	ap = argv;
	for (i = 0; i < x->f_listSize; i++)
	{
		newlist[i] = argv[(int)( (i*argc) / x->f_listSize)];
		//post("salut : %ld c est %f", (int)( (i*argc) / x->f_listSize), atom_getfloat(ap+i));
	}
	
	ap = newlist;
	switch (proxy_getinlet((t_object *)x)) 
	{
		case 1:
		{
			for (i = 0 ; i < x->f_listSize; i++, ap++) 
			{
				switch (atom_gettype(ap))
				{
				case A_LONG:
					x->f_min[i] = (float)atom_getlong(ap);
				break;
				case A_FLOAT:
					x->f_min[i] = atom_getfloat(ap);
				break;
				default:
					post("Invalid atom type : (%ld)", atom_gettype(argv));
				break;
				}
			}
		}
		break;
		case 2:
		{
			for (i = 0; i < x->f_listSize; i++, ap++)
			{
				switch (atom_gettype(ap))
				{
				case A_LONG:
					x->f_max[i] = (float)atom_getlong(ap);
				break;
				case A_FLOAT:
					x->f_max[i] = atom_getfloat(ap);
				break;
				default:
					post("Invalid atom type : (%ld)", atom_gettype(argv));
				break;
				}
			}
		}
		break;
		default:
		{
			post("wrong inlet for list");
		}
	}
}
void rlg_bang(t_rlg *x)
{
	int i;
	float j;

	if (x->f_newSize != x->f_listSize) rlg_resize(x);
	
	for(i = 0; i < x->f_listSize; i++)
	{
		if(x->f_max[i] <  x->f_min[i])
		{
			j = x->f_max[i];
			x->f_max[i] = x->f_min[i];
			x->f_min[i] = j;
		}
		j = rand();
		x->f_resultFloat[i] = ((j/(double)RAND_MAX) * (x->f_max[i] - x->f_min[i]) +  x->f_min[i]);
	}
	for(i = 0; i < x->f_listSize; i++)
	{
		if(x->f_mode == 0 ) atom_setlong(x->f_result+i, (int)x->f_resultFloat[i]);
		else atom_setfloat(x->f_result+i, x->f_resultFloat[i]);
	}
	outlet_list(x->f_ob.o_outlet,0L,x->f_listSize,x->f_result);
}



void rlg_free(t_rlg *x)
{
	if (x->f_resultFloat) sysmem_freeptr(x->f_resultFloat);
	if (x->f_result) sysmem_freeptr(x->f_result);
}

void rlg_resize(t_rlg *x)
{ 
		sysmem_freeptr(x->f_resultFloat);
		sysmem_freeptr(x->f_result);
		
		x->f_resultFloat = (float *)sysmem_newptr( x->f_newSize*sizeof(float));
		x->f_result = (t_atom *)sysmem_newptr(x->f_newSize*sizeof(t_atom));

		x->f_listSize = x->f_newSize;
}
