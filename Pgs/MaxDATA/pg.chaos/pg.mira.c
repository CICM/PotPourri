#include "pg.chaos.h"
#include "pg.mira.h"

void mira_init(t_chaos *x, t_symbol *s, short argc, t_atom *argv)
{
	int i;

	// La fonction cartesienne	//
	// Xk+1 = b * Yk + F(X)		//
	// Yk+1 = -Xk + F(Xk+1)		//
	// F(X) = a * X + (1 - a) * ((2 * X^2)/(1 + X^2)) //
	// Pour conserver la surface b = 1 //

	// Initialisation des valeurs de bases //
	x->f_parameter[0] = 18.f;
	x->f_parameter[1] = 0.f;
	x->f_parameter[2] = 0.9f;
	
	// Initialisation des valeurs par l utilisateur //
	for(i = 0; i < 3; i++)
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
	/*
	if (x->f_parameter[2] > 1.f)
	{
		x->f_parameter[2] = 0.9f;
	}
	x->f_parameterInit[2] = x->f_parameter[1];
	*/
}	

void mira_reset(t_chaos *x)
{
	int i;
	for(i = 0; i < 3; i++)
	{
		x->f_parameter[i] = x->f_parameterInit[i];
	}
}

void mira_bang(t_chaos *x)
{
	float posiX, posiY;
	float a;
	float foncX, foncY;
	
	// Sortie des précédentes valeurs //
	outlet_float(x->out, x->f_parameter[0]);
	outlet_float(x->out2, x->f_parameter[1]);

	// Yk+1 = -Xk + F(Xk+1)		//
	// F(X) = a * X + (1 - a) * ((2 * X^2)/(1 + X^2)) //
	posiX = x->f_parameter[0];
	posiY = x->f_parameter[1];
	a = x->f_parameter[2];

	// F(X) = a * X + (1 - a) * ((2 * X^2)/(1 + X^2)) //
	foncX = (a * posiX) + (1.f - a) * ((2 * posiX * posiX) / (1 + posiX * posiX));
	// Xk+1 = Yk + F(X)		//
	x->f_parameter[0] = posiY + foncX;
	// F(X) = a * X + (1 - a) * ((2 * X^2)/(1 + X^2)) //
	foncY = (a * x->f_parameter[0]) + (1.f - a) * ((2 * x->f_parameter[0] * x->f_parameter[0]) / (1 + x->f_parameter[0] * x->f_parameter[0]));
	// Yk+1 = -Xk + F(Xk+1)		//
	x->f_parameter[1] = -posiX + foncY;

}

void mira_list(t_chaos *x, t_symbol *s, short ac, t_atom *av)
{
	int i;
	
	if(ac > 3)
	{
		ac = 3;
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
	mira_bang(x);
}

void mira_set(t_chaos *x, t_symbol *s, short ac, t_atom *av)
{
	int i;
	
	if(ac > 3)
	{
		ac = 3;
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
	mira_bang(x);
}

void mira_print(t_chaos *x)
{
	t_atom list[4];
	int i;

	SETSYM(list, gensym("Mira"));
	for(i = 1; i < 4; i++)
	{
		SETFLOAT(list+i, x->f_parameterInit[i-1]);
	}
	outlet_list(x->out4 , 0L, 4, list);
}

void mira_record(t_chaos *x)
{
	int i;

	for(i = 0; i < 3; i++)
	{
		x->f_parameterInit[i] = x->f_parameter[i];
	}
}

void mira_free(t_chaos *x)
{
	object_free(x->f_proxy);
}

void mira_assist(t_chaos *x, void *b, long m, long a, char *s)
{
	if (m == ASSIST_INLET)
	{
		sprintf(s,"Parameters x, y and a (list) or computation (bang)");
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
