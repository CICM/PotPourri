
#include "ext.h"
#include "ext_obex.h"
#include "ext_common.h"

#define TWOPI	6.28318530717958647692
#define FWHM	2.35482004503094938202

typedef struct  _gaussian
{
	t_object f_ob;

	void	*out;
	void	*out2;
	long	f_inlet;
	void	*f_proxy;
	
	float	f_ecart;
	float	f_esperance;

} t_gaussian;

t_symbol *ps_bang;

void *gaussian_class;

void gaussian_int(t_gaussian *x, long n);
void gaussian_float(t_gaussian *x, double f);

void *gaussian_new(t_symbol *s, int argc, t_atom *argv);
void gaussian_free(t_gaussian *x);
void gaussian_assist(t_gaussian *x, void *b, long m, long a, char *s);

int main()
{
	t_class *c;

	c = class_new("pg.gaussian", (method)gaussian_new, (method)gaussian_free, (short)sizeof(t_gaussian), 0L, A_GIMME, 0);
	class_addmethod(c, (method)gaussian_int,	"int",		A_LONG,		0);
	class_addmethod(c, (method)gaussian_float,	"float",	A_FLOAT,	0);
	class_addmethod(c, (method)gaussian_assist,	"assist",	 A_CANT,	0);
	
	class_register(CLASS_BOX, c);
	gaussian_class = c;

	post("pg.gaussian by Pierre Guillot",0);
	post("Universite Paris 8, France",0);

	
	return 0;
}

void *gaussian_new(t_symbol *s, int argc, t_atom *argv)
{
	t_gaussian *x = (t_gaussian *)object_alloc(gaussian_class);
	
	x->f_ecart = 1.f;
	if( argv[0].a_type == A_LONG )
	{
		x->f_ecart = (float)argv[1].a_w.w_long;
	}
	else if ( argv[0].a_type == A_FLOAT )
	{
		x->f_ecart = argv[0].a_w.w_float;
	}

	if (x->f_ecart <= 0.f)
	{
		x->f_ecart = 1.f;
	}

	x->f_esperance = 0.f;
	if( argv[1].a_type == A_LONG )
	{
		x->f_esperance = (float)argv[1].a_w.w_long;
	}
	else if( argv[1].a_type == A_FLOAT )
	{
		x->f_esperance = argv[1].a_w.w_float;
	}
	
	x->f_proxy = proxy_new((t_object *)x, 2, &x->f_inlet);
	x->f_proxy = proxy_new((t_object *)x, 1, &x->f_inlet);

	x->out2 = floatout((t_object *)x);
	x->out = floatout((t_object *)x);
	
	return x;
}			

void gaussian_assist(t_gaussian *x, void *b, long m, long a, char *s)
{
	if (m == ASSIST_INLET)
	{
		switch (a) 
		{	
			case 0:
				sprintf(s,"Input value (int or float)");
				break;
			case 1:
				sprintf(s,"Standard deviation (int or float)");
				break;
			case 2:
				sprintf(s,"Expectation (int or float)");
				break;
		}
	}
	else 
	{
		switch (a) 
		{	
			case 0:
				sprintf(s,"Normal distribution (float)");
				break;
			case 1:
				sprintf(s,"FWHM (float)");
				break;
		}
		
	}
}

void gaussian_int(t_gaussian *x, long n)
{
	float result;
	float fwhm;
	switch (proxy_getinlet((t_object *)x)) 
	{
		case 0:
				result = (1.f / (x->f_ecart * sqrt((float)TWOPI))) * exp( -1.f * ((((float)n - x->f_esperance ) * ((float)n - x->f_esperance )) / (2.f * ( x->f_ecart * x->f_ecart))));
				outlet_float(x->out, result);
		break;
		case 1:
				if(n > 0) x->f_ecart = (double)n;
				fwhm = FWHM*x->f_ecart;
				outlet_float(x->out2, fwhm);
		break;
		case 2:
				x->f_esperance = (double)n;
		break;
	}
}

void gaussian_float(t_gaussian *x, double f)
{
	float result;
	float fwhm;
	switch (proxy_getinlet((t_object *)x)) 
	{
		case 0:
				result = (1.f / (x->f_ecart * sqrt((float)TWOPI))) * exp( -1.f * (((f - x->f_esperance ) * (f - x->f_esperance )) / (2.f * ( x->f_ecart * x->f_ecart))));
				outlet_float(x->out, result);
		break;
		case 1:
				if(f > 0.f) x->f_ecart = (double)f;
				fwhm = FWHM*x->f_ecart;
				outlet_float(x->out2, fwhm);
		break;
		case 2:
				x->f_esperance = (double)f;
		break;
	}
}

void gaussian_free(t_gaussian *x)
{
	object_free(x->f_proxy);
}