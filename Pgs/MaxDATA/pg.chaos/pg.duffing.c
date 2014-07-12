#include "pg.duffing.h"
#include "pg.chaos.h"

void duffing_init(t_chaos *x, t_symbol *s, short argc, t_atom *argv)
{
	int i;
	// dx / dt = y
	// dy / dt = x - x3 - a y + b cos(w t)
	//where typically, a = 0.25, b = 0.3, w = 1

	// Initialisation des valeurs de bases //
	x->f_parameter[0] = 0.f;
	x->f_parameter[1] = 0.f;
	x->f_parameter[2] = 0.25f;
	x->f_parameter[3] = 0.3f;
	x->f_parameter[4] = 1.0f;
	x->f_parameter[5] = 0.01f;
	x->f_parameter[6] = 0.f;
	// Initialisation des valeurs par l utilisateur // 
	for(i = 0; i < 7; i++)
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

void duffing_reset(t_chaos *x)
{
	int i;
	for(i = 0; i < 7; i++)
	{
		x->f_parameter[i] = x->f_parameterInit[i];
	}
}

void duffing_bang(t_chaos *x)
{
	float posiX, posiY;
	
	outlet_float(x->out, x->f_parameter[0]);
	outlet_float(x->out2, x->f_parameter[1]);
	
	posiX = x->f_parameter[0];
	posiY = x->f_parameter[1];
	
	x->f_parameter[6] += x->f_parameter[5];
	//post("%f", x->f_parameter[6]);
	// dx / dt = y
	x->f_parameter[0] = posiY;// * x->f_parameter[5];
	// dy / dt = x - x3 - a y + b cos(w t)
	x->f_parameter[1] = posiX - (posiX * posiX * posiX) - (x->f_parameter[2] * posiY) + (x->f_parameter[3] * cos(x->f_parameter[4] * x->f_parameter[6]));// *  x->f_parameter[5];

}

void duffing_list(t_chaos *x, t_symbol *s, short ac, t_atom *av)
{
	int i;
	
	if(ac > 7)
	{
		ac = 7;
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
	duffing_bang(x);
}

void duffing_set(t_chaos *x, t_symbol *s, short ac, t_atom *av)
{
	int i;
	
	if(ac > 7)
	{
		ac = 7;
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
	duffing_bang(x);
}

void duffing_print(t_chaos *x)
{
	t_atom list[8];
	int i;

	SETSYM(list, gensym("Duffing"));
	for(i = 1; i < 8; i++)
	{
		SETFLOAT(list+i, x->f_parameterInit[i-1]);
	}
	outlet_list(x->out4 , 0L, 8, list);
}

void duffing_record(t_chaos *x)
{
	int i;

	for(i = 0; i < 7; i++)
	{
		x->f_parameterInit[i] = x->f_parameter[i];
	}
}

void duffing_free(t_chaos *x)
{
	object_free(x->f_proxy);
}

void duffing_assist(t_chaos *x, void *b, long m, long a, char *s)
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
