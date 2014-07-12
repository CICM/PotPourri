
#include "ext.h"
#include "ext_obex.h"
#include "ext_common.h"
#include "ext_globalsymbol.h"

#define LISTSIZE 1024
typedef struct  _scale
{
	t_object f_ob;

	void	*out;
	void	*out2;
	long	f_inlet;
	void	*f_proxy;
	
	float	f_minIn;
	float	f_maxIn;
	float	f_diffIn;
	float	f_minOut;
	float	f_maxOut;
	float	f_diffOut;
	t_atom	f_list[LISTSIZE];

	int		f_mode;
	int		f_limit;
	int		f_autoScale;
	int		f_autoBound;
	int		f_count;

} t_scale;

t_symbol *ps_bang;

void *scale_class;

void scale_int(t_scale *x, long n);
void scale_float(t_scale *x, double f);

void *scale_new(t_symbol *s, int argc, t_atom *argv);
void scale_free(t_scale *x);
void scale_assist(t_scale *x, void *b, long m, long a, char *s);
void scale_list(t_scale *x, t_symbol *s, short ac, t_atom *av);
void scale_print(t_scale *x);
float scale_perform(t_scale *x, float f);
// Fonction definissant la bande de frequence a analysee //
t_max_err autoscale_set(t_scale *x, t_object *attr, long argc, t_atom *argv);

int main()
{
	t_class *c;

	c = class_new("pg.scale", (method)scale_new, (method)scale_free, (short)sizeof(t_scale), 0L, A_GIMME, 0);
	class_addmethod(c, (method)scale_int,		"int",		A_LONG,		0);
	class_addmethod(c, (method)scale_float,		"float",	A_FLOAT,	0);
	class_addmethod(c, (method)scale_assist,	"assist",	A_CANT,		0);
	class_addmethod(c, (method)scale_print,		"print",				0);
	class_addmethod(c, (method)scale_list,		"list",		A_GIMME,	0);

	class_register(CLASS_BOX, c);
	scale_class = c;
	/*
	CLASS_ATTR_LONG				(c, "mode", 0, t_scale, f_mode);
	CLASS_ATTR_LABEL			(c, "mode", 0, "Scale mode");
	CLASS_ATTR_ENUMINDEX		(c, "mode", 0, "Linear \"Logarithmic \" Exponential");
	CLASS_ATTR_DEFAULT			(c, "mode", 0, "0");
	CLASS_ATTR_SAVE				(c, "mode", 1);
	*/
	CLASS_ATTR_LONG				(c, "autoscale", 0, t_scale, f_autoScale);
	CLASS_ATTR_LABEL			(c, "autoscale", 0, "Auto scale");
	CLASS_ATTR_ENUMINDEX		(c, "autoscale", 0, "Off \"On");
	CLASS_ATTR_ACCESSORS		(c, "autoscale", NULL, autoscale_set);
	CLASS_ATTR_SAVE				(c, "autoscale", 1);
	
	CLASS_ATTR_LONG				(c, "limit", 0, t_scale, f_limit);
	CLASS_ATTR_LABEL			(c, "limit", 0, "Boundary mode");
	CLASS_ATTR_ENUMINDEX		(c, "limit", 0, "Off \"On");
	CLASS_ATTR_SAVE				(c, "limit", 1);

	post("pg.scale by Pierre Guillot",0);
	post("Universite Paris 8, France",0);

	
	return 0;
}

void *scale_new(t_symbol *s, int argc, t_atom *argv)
{
	t_scale *x = (t_scale *)object_alloc(scale_class);

	x->f_minIn = 0.f;
	x->f_maxIn = 1.f;
	x->f_minOut = 0.f;
	x->f_maxOut = 127.f;

	x->f_autoScale = 0;
	x->f_limit = 1;

	if(argc >= 1)
	{
		if( argv[0].a_type == A_LONG ) x->f_minIn = (float)argv[0].a_w.w_long;
		else if ( argv[0].a_type == A_FLOAT )  x->f_minIn = (float)argv[0].a_w.w_float;
	}
	if(argc >= 2)
	{
		if( argv[1].a_type == A_LONG ) x->f_maxIn = (float)argv[1].a_w.w_long;
		else if ( argv[1].a_type == A_FLOAT )  x->f_maxIn = (float)argv[1].a_w.w_float;
	}
	if(argc >= 3)
	{
		if( argv[2].a_type == A_LONG ) x->f_minOut = (float)argv[2].a_w.w_long;
		else if ( argv[2].a_type == A_FLOAT )  x->f_minOut = (float)argv[2].a_w.w_float;
	}
	if(argc >= 4)
	{
		if( argv[3].a_type == A_LONG ) x->f_maxOut = (float)argv[3].a_w.w_long;
		else if ( argv[3].a_type == A_FLOAT )  x->f_maxOut = (float)argv[3].a_w.w_float;
	}

	x->f_diffIn = x->f_maxIn - x->f_minIn;
	x->f_diffOut = x->f_maxOut - x->f_minOut;

	x->f_proxy = proxy_new((t_object *)x, 4, &x->f_inlet);
	x->f_proxy = proxy_new((t_object *)x, 3, &x->f_inlet);
	x->f_proxy = proxy_new((t_object *)x, 2, &x->f_inlet);
	x->f_proxy = proxy_new((t_object *)x, 1, &x->f_inlet);

	x->out2 = listout((t_object *)x);
	x->out = outlet_new((t_object *)x, NULL);

	return x;
}			

void scale_int(t_scale *x, long n)
{
	float input;
	switch (proxy_getinlet((t_object *)x)) 
	{
		case 0:
			input = scale_perform(x,(float)n);
			outlet_float(x->out, input);
		break;
		case 1:
				x->f_minIn = (float)n;
				x->f_diffIn = x->f_maxIn - x->f_minIn;
				//if(x->f_diffIn < 0) x->f_diffIn = -x->f_diffIn;
		break;
		case 2:
				x->f_maxIn = (float)n;
				x->f_diffIn = x->f_maxIn - x->f_minIn;
				//if(x->f_diffIn < 0) x->f_diffIn = -x->f_diffIn;
		break;
		case 3:
				x->f_minOut = (float)n;
				x->f_diffOut = x->f_maxOut - x->f_minOut;
		break;
		case 4:
				x->f_maxOut = (float)n;
				x->f_diffOut = x->f_maxOut - x->f_minOut;
		break;
	}
}

void scale_float(t_scale *x, double f)
{
	float input;
	switch (proxy_getinlet((t_object *)x)) 
	{
		case 0:
			input = scale_perform(x,f);
			outlet_float(x->out, input);
		break;
		case 1:
				x->f_minIn = f;
				x->f_diffIn = x->f_maxIn - x->f_minIn;
				//if(x->f_diffIn < 0) x->f_diffIn = -x->f_diffIn;
		break;
		case 2:
				x->f_maxIn = f;
				x->f_diffIn = x->f_maxIn - x->f_minIn;
				//if(x->f_diffIn < 0) x->f_diffIn = -x->f_diffIn;
		break;
		case 3:
				x->f_minOut = f;
				x->f_diffOut = x->f_maxOut - x->f_minOut;
		break;
		case 4:
				x->f_maxOut = f;
				x->f_diffOut = x->f_maxOut - x->f_minOut;
		break;
	}
}


void scale_list(t_scale *x, t_symbol *s, short ac, t_atom *av)
{
	float input;
	float f;
	int i;
	if(ac > LISTSIZE)
	{
		ac = LISTSIZE;
		post("pg.scale : Sorry, the list is too big for me");
		post("pg.scale : my maximum list size is %ld", LISTSIZE);
	}
	for (i = 0; i < ac; i++, av++) 
	{
		if (atom_gettype(av)==A_LONG)
		{
			f = (float)atom_getlong(av);
			//post("long");
		}
		else if (atom_gettype(av)==A_FLOAT)
		{
			f = (float)atom_getfloat(av);
			//post("float");
		}
	
		input = scale_perform(x, f);
		SETFLOAT(x->f_list+i, input);
	}
	outlet_list(x->out, 0L, ac, x->f_list);
}

float scale_perform(t_scale *x, float f)
{
	float input;
	if(x->f_autoScale == 1)
	{
		if (f > x->f_maxIn || x->f_count == 0) x->f_maxIn = f;
		if (f < x->f_minIn || x->f_count == 0) x->f_minIn = f;
		x->f_diffIn = x->f_maxIn - x->f_minIn;
		//if(x->f_diffIn < 0) x->f_diffIn = -x->f_diffIn;
		x->f_count = 1;
	} 
	if(x->f_limit == 1)
	{
		if (f > x->f_maxIn) input = x->f_maxOut;
		else if(f < x->f_minIn) input = x->f_minOut;
		else
		{
			if(x->f_mode == 0)input = ((f - x->f_minIn)/ x->f_diffIn  ) * x->f_diffOut + x->f_minOut;
			else if(x->f_mode == 1) input = log(((f - x->f_minIn)/ x->f_diffIn  )*exp(1.)) * x->f_diffOut + x->f_minOut;
			else  input = ((f - x->f_minIn)/ x->f_diffIn  ) * x->f_diffOut + x->f_minOut;
		}
	}
	else
	{
		if(x->f_mode == 0)input = ((f - x->f_minIn)/ x->f_diffIn  ) * x->f_diffOut + x->f_minOut;
		else if(x->f_mode == 1) input = ((f - x->f_minIn)/ x->f_diffIn  ) * x->f_diffOut + x->f_minOut;
		else  input = ((f - x->f_minIn)/ x->f_diffIn  ) * x->f_diffOut + x->f_minOut;
	}
	return input;
}
void scale_free(t_scale *x)
{
	object_free(x->f_proxy);
}

void scale_print(t_scale *x)
{
	t_atom list[4];

	SETFLOAT(list, x->f_minIn);
	SETFLOAT(list+1, x->f_maxIn);
	SETFLOAT(list+2, x->f_minOut);
	SETFLOAT(list+3, x->f_maxOut);

	outlet_list(x->out2 , 0L, 4, list);
	
}

void scale_assist(t_scale *x, void *b, long m, long a, char *s)
{
	if (m == ASSIST_INLET)
	{
		switch (a) 
		{	
			case 0:
				sprintf(s,"Input value (int, float ot list)");
				break;
			case 1:
				sprintf(s,"Minimum input value (int or float)");
				break;
			case 2:
				sprintf(s,"Maximum input value (int or float)");
				break;
			case 3:
				sprintf(s,"Minimum output value (int or float)");
				break;
			case 4:
				sprintf(s,"Maximum output value (int or float)");
				break;
		}
	}
	else 
	{
		switch (a) 
		{	
			case 0:
				sprintf(s,"Scaled value (int, float, list)");
				break;
			case 1:
				sprintf(s,"Boundaries values (list)");
				break;
		}
		
	}
}

t_max_err autoscale_set(t_scale *x, t_object *attr, long argc, t_atom *argv)
{
	int bolean;
	bolean = 0;
	if ( atom_gettype(argv) == A_LONG) bolean = atom_getlong(argv);
	else if ( atom_gettype(argv) == A_FLOAT) bolean = (int)atom_getfloat(argv);
	//post("%ld", bolean);

	if(bolean == 1)
	{
		x->f_autoScale = 1;
		x->f_count = 0;
	}
	else x->f_autoScale = 0;
	
	return 0;
}