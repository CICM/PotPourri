#include "pg.clifford.h"
#include "pg.chaos.h"

void clifford_init(t_chaos *x, t_symbol *s, short argc, t_atom *argv)
{
	int i;
	// xn+1 = sin(a yn) + c cos(a xn)
	// yn+1 = sin(b xn) + d cos(b yn)

	// Initialisation des valeurs de bases //
	x->f_parameter[0] = 0.1f;
	x->f_parameter[1] = 0.1f;
	x->f_parameter[2] = -1.4f;
	x->f_parameter[3] = 1.6f;
	x->f_parameter[4] = 1.0f;
	x->f_parameter[5] = 0.7f;

	// Initialisation des valeurs par l utilisateur // 
	for(i = 0; i < 6; i++)
	{
		if(i < argc)
		{
			if( argv[i].a_type == A_LONG )
			{
				x->f_parameter[i] = (float)argv[i].a_w.w_long;
			}
			else if ( argv[i].a_type == A_FLOAT )
			{
				x->f_parameter[i] = argv[i].a_w.w_float;
			}
		}
		x->f_parameterInit[i] = x->f_parameter[i];
	}
}

void clifford_reset(t_chaos *x)
{
	int i;
	for(i = 0; i < 6; i++)
	{
		x->f_parameter[i] = x->f_parameterInit[i];
	}
}

void clifford_bang(t_chaos *x)
{
	float posiX, posiY;
	
	outlet_float(x->out, x->f_parameter[0]);
	outlet_float(x->out2, x->f_parameter[1]);
	
	posiX = x->f_parameter[0];
	posiY = x->f_parameter[1];
	
	// xn+1 = sin(a yn) + c cos(a xn)
	x->f_parameter[0] = sin(x->f_parameter[2] * posiY) + x->f_parameter[4] * cos(x->f_parameter[2] * posiX);
	// yn+1 = sin(b xn) + d cos(b yn)
	x->f_parameter[1] = sin(x->f_parameter[3] * posiX) + x->f_parameter[5] * cos(x->f_parameter[3] * posiY);

}

void clifford_list(t_chaos *x, t_symbol *s, short ac, t_atom *av)
{
	int i;
	
	if(ac > 6)
	{
		ac = 6;
	}
	// Initialisation des parametres //
	for (i = 0; i < ac; i++, av++) 
	{
		if (atom_gettype(av)==A_LONG)
		{
			x->f_parameter[i] = (float)atom_getlong(av);
		}
		else if (atom_gettype(av)==A_FLOAT)
		{
			x->f_parameter[i] = (float)atom_getfloat(av);
		}
	}
	clifford_bang(x);
}

void clifford_set(t_chaos *x, t_symbol *s, short ac, t_atom *av)
{
	int i;
	
	if(ac > 6)
	{
		ac = 6;
	}
	// Initialisation des parametres //
	for (i = 0; i < ac; i++, av++) 
	{
		if (atom_gettype(av)==A_LONG)
		{
			x->f_parameter[i] = (float)atom_getlong(av);
		}
		else if (atom_gettype(av)==A_FLOAT)
		{
			x->f_parameter[i] = (float)atom_getfloat(av);
		}
		x->f_parameterInit[i] = x->f_parameter[i];
	}
	clifford_bang(x);
}

void clifford_print(t_chaos *x)
{
	t_atom list[7];
	int i;

	SETSYM(list, gensym("Clifford"));
	for(i = 1; i < 7; i++)
	{
		SETFLOAT(list+i, x->f_parameterInit[i-1]);
	}
	outlet_list(x->out4 , 0L, 7, list);
}

void clifford_record(t_chaos *x)
{
	int i;

	for(i = 0; i < 6; i++)
	{
		x->f_parameterInit[i] = x->f_parameter[i];
	}
}

void clifford_free(t_chaos *x)
{
	object_free(x->f_proxy);
}

void clifford_assist(t_chaos *x, void *b, long m, long a, char *s)
{
	if (m == ASSIST_INLET)
	{
		sprintf(s,"Parameters x, y, z, a, b, c, d (list) or computation (bang)");
	}
	else 
	{
		switch (a) 
		{	
			case 0:
				sprintf(s,"Coordinates x (float)");
				break;
			case 1:
				sprintf(s,"Coordinates y (float)");
				break;
			case 2:
				sprintf(s,"Initial parameters (list)");
				break;
		}
		
	}
}
