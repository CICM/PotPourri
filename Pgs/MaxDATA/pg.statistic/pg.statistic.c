
#include "ext.h"
#include "ext_obex.h"
#include "ext_common.h"

typedef struct  _statistique 
{
	t_object f_ob;

	void	*out;
	short	f_listSize;
	t_atom	f_stat[8];

} t_statistique;

t_symbol *ps_bang;

void *statistique_class;

void *statistique_new(t_symbol *s, int argc, t_atom *argv);
void statistique_assist(t_statistique *x, void *b, long m, long a, char *s);

void statistique_list(t_statistique *x, t_symbol *s, short ac, t_atom *av);
void statistique_bang(t_statistique *x);


int main()
{
	t_class *c;

	c = class_new("pg.statistic", (method)statistique_new, (method)NULL, (short)sizeof(t_statistique), 0L, A_GIMME, 0);
	class_addmethod(c, (method)statistique_list,		"list",		A_GIMME,	0);
	class_addmethod(c, (method)statistique_bang,		"bang",					0);
	class_addmethod(c, (method)statistique_assist,		"assist",	 A_CANT,	0);
	
	class_register(CLASS_BOX, c);
	statistique_class = c;

	post("pg.statistic by Pierre Guillot",0);
	post("Universite Paris 8, France",0);
	
	return 0;
}

void *statistique_new(t_symbol *s, int argc, t_atom *argv)
{
	t_statistique *x = object_alloc(statistique_class);

	x->f_listSize = 0;

	x->out = listout(x);
	
	return x;
}			

void statistique_assist(t_statistique *x, void *b, long m, long a, char *s)
{
	if (m == ASSIST_INLET)
		sprintf(s," Input (list)");
	else sprintf(s,"Statistics (list)");
}

void statistique_list(t_statistique *x, Symbol *s, short ac, Atom *av)
{
	int i;
	float f;
	
	x->f_stat[0].a_w.w_float = 2000.f;
	x->f_stat[1].a_w.w_float =  -2000.f;
	x->f_stat[2].a_w.w_float = 0.f;
	x->f_stat[3].a_w.w_float = 0.f;
	x->f_stat[6].a_w.w_float = 0.f;
	x->f_stat[7].a_w.w_float = 0.f;
	// Toute les formules sont sur wikipedia!!! //
	/// comparaison avec des grande valeur + rapide que de trier une liste en ordre croissant //
	for (i = 0; i < ac; i++) 
	{
		/* Minimum */
		x->f_stat[0].a_w.w_float = MIN(x->f_stat[0].a_w.w_float, av[i].a_w.w_float);
		
		/* Maximum */
		x->f_stat[1].a_w.w_float = MAX(x->f_stat[1].a_w.w_float, av[i].a_w.w_float);
		
		/* Moyenne */
		x->f_stat[2].a_w.w_float += av[i].a_w.w_float;
	}
	x->f_stat[2].a_w.w_float /= (float)ac;
	
		/* Variance */
	for (i = 0; i < ac; i++) 
	{
		x->f_stat[3].a_w.w_float += (av[i].a_w.w_float - x->f_stat[2].a_w.w_float) * (av[i].a_w.w_float - x->f_stat[2].a_w.w_float);
	}
	x->f_stat[3].a_w.w_float /= (float)(ac - 1);
	if (x->f_stat[3].a_w.w_float == 0) x->f_stat[3].a_w.w_float = 0.000001f;
	
		/* Deviation standard */
	x->f_stat[4].a_w.w_float = pow(x->f_stat[3].a_w.w_float, 0.5f);
	
		/* Deviation de la moyenne */
	x->f_stat[5].a_w.w_float =  x->f_stat[4].a_w.w_float/pow((float)ac, 0.5f);
	
		/* Asymetrie ou skewness */
	for (i = 0; i < ac; i++) 
	{
		x->f_stat[6].a_w.w_float += pow(((av[i].a_w.w_float - x->f_stat[2].a_w.w_float) / x->f_stat[3].a_w.w_float), 3.f);
	}
	x->f_stat[6].a_w.w_float *=  (float)ac;
	x->f_stat[6].a_w.w_float /=  ((float)(ac - 1) * (float)(ac - 2));
	 
		 /* Kurtosis */
	f = ( x->f_stat[3].a_w.w_float * x->f_stat[3].a_w.w_float);
	for (i = 0; i < ac; i++) 
	{
		x->f_stat[7].a_w.w_float += (pow((av[i].a_w.w_float - x->f_stat[2].a_w.w_float), 4) / f) -
		 - (3.f * (float)((ac - 1) * (ac - 1))/(float)((ac - 2) * (ac - 2)));
	}	
	x->f_stat[7].a_w.w_float *= (float)((ac + 1) * ac);
	x->f_stat[7].a_w.w_float /= (float)((ac - 1) * (ac - 2) * (ac - 3));
		 
	/* Remplit la liste avec les valeurs */
	for (i = 0; i < 8; i++) 
	{
		SETFLOAT(x->f_stat+i, x->f_stat[i].a_w.w_float);
	}
	outlet_list(x->f_ob.o_outlet,0L, 8,x->f_stat);
}

void statistique_bang(t_statistique *x)
{
	outlet_list(x->f_ob.o_outlet,0L, 8,x->f_stat);
}


