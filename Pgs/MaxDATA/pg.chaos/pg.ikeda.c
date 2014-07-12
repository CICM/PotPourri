#include "pg.ikeda.h"
#include "pg.chaos.h"

void ikeda_init(t_chaos *x, t_symbol *s, short argc, t_atom *argv)
{
	int i;
	// La fonction cartesienne //
	// Xk+1 = a + b * (Xk * cos(Tk) + Yk * sin(Tk)) //
	// Yk+1 = b * (Xk * sin(Tk) - Yk * cos(Tk))		//
	// Tk = c - (d / (Xk^2 + Yk^2 +1)

	// Initialisation des valeurs de bases //
	x->f_parameter[0] = 0;
	x->f_parameter[1] = 0;
	x->f_parameter[2] = 0.85f;
	x->f_parameter[3] = 0.9f;
	x->f_parameter[4] = 0.4f;
	x->f_parameter[5] = 7.7f;

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

void ikeda_reset(t_chaos *x)
{
	int i;
	for(i = 0; i < 6; i++)
	{
		x->f_parameter[i] = x->f_parameterInit[i];
	}
}

void ikeda_bang(t_chaos *x)
{
	float posiX, posiY;
	float valT;
	float cosT, sinT;

	// Sortie des précédentes valeurs //
	outlet_float(x->out, x->f_parameter[0]);
	outlet_float(x->out2, x->f_parameter[1]);

	posiX = x->f_parameter[0];
	posiY = x->f_parameter[1];
	// Tk = c - (d / (Xk^2 + Yk^2 +1) //
	valT = x->f_parameter[4] - (x->f_parameter[5] / ((posiX * posiX) + (posiY * posiY) + 1.f));
	cosT = cos(valT);
	sinT = sin(valT);

	// Xk+1 = a + b * (Xk * cos(Tk) + Yk * sin(Tk)) //
	x->f_parameter[0] = x->f_parameter[2] + x->f_parameter[3] * (posiX * cosT - posiX * sinT);
	// Yk+1 = b * (Xk * sin(Tk) - Yk * cos(Tk))		//
	x->f_parameter[1] = x->f_parameter[3] * (posiX * sinT + posiX * cosT);

}

void ikeda_list(t_chaos *x, t_symbol *s, short ac, t_atom *av)
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
	ikeda_bang(x);
}

void ikeda_set(t_chaos *x, t_symbol *s, short ac, t_atom *av)
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
	ikeda_bang(x);
}

void ikeda_print(t_chaos *x)
{
	t_atom list[7];
	int i;

	SETSYM(list, gensym("Ikeda"));
	for(i = 1; i < 7; i++)
	{
		SETFLOAT(list+i, x->f_parameterInit[i-1]);
	}
	outlet_list(x->out4 , 0L, 7, list);
}

void ikeda_record(t_chaos *x)
{
	int i;

	for(i = 0; i < 6; i++)
	{
		x->f_parameterInit[i] = x->f_parameter[i];
	}
}

void ikeda_free(t_chaos *x)
{
	object_free(x->f_proxy);
}

void ikeda_assist(t_chaos *x, void *b, long m, long a, char *s)
{
	if (m == ASSIST_INLET)
	{
		sprintf(s,"Parameters x, y, a, b, c, d (list) or computation (bang)");
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
