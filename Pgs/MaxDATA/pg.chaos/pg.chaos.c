#include "pg.chaos.h"
#include "pg.ikeda.h"
#include "pg.mira.h"
#include "pg.jong.h"
#include "pg.lorenz.h"
#include "pg.clifford.h"
#include "pg.duffing.h"

void chaos_bang(t_chaos *x);
void chaos_list(t_chaos *x, t_symbol *s, short ac, t_atom *av);
void chaos_set(t_chaos *x, t_symbol *s, short ac, t_atom *av);
void chaos_print(t_chaos *x);
void chaos_record(t_chaos *x);
void *chaos_new(t_symbol *s, int argc, t_atom *argv);
void chaos_free(t_chaos *x);
void chaos_reset(t_chaos *x);
void chaos_assist(t_chaos *x, void *b, long m, long a, char *s);

t_max_err mode_set(t_chaos *x, t_object *attr, long argc, t_atom *argv);

int main()
{
	t_class *c;

	c = class_new("pg.chaos", (method)chaos_new, (method)chaos_free, (short)sizeof(t_chaos), 0L, A_GIMME, 0);

	class_addmethod(c, (method)chaos_bang,		"bang",					0);
	class_addmethod(c, (method)chaos_list,		"list",		A_GIMME,	0);
	class_addmethod(c, (method)chaos_assist,	"assist",	A_CANT,		0);
	class_addmethod(c, (method)chaos_reset,		"reset",				0);
	class_addmethod(c, (method)chaos_set,		"set",		A_GIMME,	0);
	class_addmethod(c, (method)chaos_print,		"print",				0);
	class_addmethod(c, (method)chaos_record,	"record",				0);

	class_register(CLASS_BOX, c);
	chaos_class = c;

	CLASS_ATTR_LONG				(c, "mode", 0, t_chaos, f_mode);
	CLASS_ATTR_LABEL			(c, "mode", 0, "Mode");
	CLASS_ATTR_ENUMINDEX		(c, "mode", 0, "Ikeda \" \"Mira \" \"Jong \" \"Lorenz \" \"Clifford \" \"Duffing");
	CLASS_ATTR_ACCESSORS		(c, "mode", NULL, mode_set);
	CLASS_ATTR_DEFAULT			(c, "mode", 0, "1");
	CLASS_ATTR_SAVE				(c, "mode", 1);

	post("pg.chaos by Pierre Guillot",0);
	post("Universite Paris 8, France",0);

	
	return 0;
}

void *chaos_new(t_symbol *s, int argc, t_atom *argv)
{
	t_chaos *x = NULL;

	int i;
	t_atom *argu;

	if (x = (t_chaos *)object_alloc(chaos_class)) 
	{
		x->f_count = 0;
		//post("%ld", argc);
		if(argc > 0)
		{
			argu = (t_atom *)getbytes((argc + 1) * sizeof(t_atom));
			SETSYM(argu, gensym("@mode"));
			SETSYM(argu+1, argv->a_w.w_sym);
			for(i = 1; i < argc; i++)
			{
				if ( atom_gettype(argv+i)== A_FLOAT)
				{
					//post("%ld, %f", i, atom_getfloat(argv+i));
					SETFLOAT(argu+i+1, atom_getfloat(argv+i));
				}
				else if ( atom_gettype(argv+i)== A_LONG)
				{
					//post("%ld, %ld", i, atom_getlong(argv+i));
					SETFLOAT(argu+i+1, (float)atom_getlong(argv+i));
				}
			}
			attr_args_process(x, argc+1, argu);
		}
		else
		{
			argu = (t_atom *)getbytes(2 * sizeof(t_atom));
			SETSYM(argu, gensym("@mode"));
			SETSYM(argu+1, gensym("Ikeda"));
			attr_args_process(x, 2, argu);
			//ikeda_init(x, gensym("init"), 0, NULL);
		}
		
		
		freebytes(argu, ((argc + 1) * sizeof(t_atom)));
		
		x->out4 = listout((t_object *)x);
		x->out3 = floatout((t_object *)x);
		x->out2 = floatout((t_object *)x);
		x->out = floatout((t_object *)x);
	}
	
	return x;
}			

void chaos_reset(t_chaos *x)
{
	switch(x->f_mode)
	{
	case 0:
		ikeda_reset(x);
		break;
	case 1:
		mira_reset(x);
		break;
	case 2:
		jong_reset(x);
		break;
	case 3:
		lorenz_reset(x);
		break;
	case 4:
		clifford_reset(x);
		break;
	case 5:
		duffing_reset(x);
		break;
	}
}

void chaos_bang(t_chaos *x)
{
	switch(x->f_mode)
	{
	case 0:
		ikeda_bang(x);
		break;
	case 1:
		mira_bang(x);
		break;
	case 2:
		jong_bang(x);
		break;
	case 3:
		lorenz_bang(x);
		break;
	case 4:
		clifford_bang(x);
		break;
	case 5:
		duffing_bang(x);
		break;
	}
}

void chaos_list(t_chaos *x, t_symbol *s, short ac, t_atom *av)
{
	switch(x->f_mode)
	{
	case 0:
		ikeda_list(x, s, ac, av);
		break;
	case 1:
		mira_list(x, s, ac, av);
		break;
	case 2:
		jong_list(x, s, ac, av);
		break;
	case 3:
		lorenz_list(x, s, ac, av);
		break;
	case 4:
		clifford_list(x, s, ac, av);
		break;
	case 5:
		duffing_list(x, s, ac, av);
		break;
	}
}

void chaos_set(t_chaos *x, t_symbol *s, short ac, t_atom *av)
{
	switch(x->f_mode)
	{
	case 0:
		ikeda_set(x, s, ac, av);
		break;
	case 1:
		mira_set(x, s, ac, av);
		break;
	case 2:
		jong_set(x, s, ac, av);
		break;
	case 3:
		lorenz_set(x, s, ac, av);
		break;
	case 4:
		clifford_set(x, s, ac, av);
		break;
	case 5:
		duffing_set(x, s, ac, av);
		break;
	}
}

void chaos_print(t_chaos *x)
{
	switch(x->f_mode)
	{
	case 0:
		ikeda_print(x);
		break;
	case 1:
		mira_print(x);
		break;
	case 2:
		jong_print(x);
		break;
	case 3:
		lorenz_print(x);
		break;
	case 4:
		clifford_print(x);
		break;
	case 5:
		duffing_print(x);
		break;
	}
}

void chaos_record(t_chaos *x)
{
	switch(x->f_mode)
	{
	case 0:
		ikeda_record(x);
		break;
	case 1:
		mira_record(x);
		break;
	case 2:
		jong_record(x);
		break;
	case 3:
		lorenz_record(x);
		break;
	case 4:
		clifford_record(x);
		break;
	case 5:
		duffing_record(x);
		break;
	}
}

void chaos_free(t_chaos *x)
{
	object_free(x->f_proxy);
}

void chaos_assist(t_chaos *x, void *b, long m, long a, char *s)
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
				sprintf(s,"Coordinates z (float)");
				break;
			case 3:
				sprintf(s,"Initial parameters (list)");
				break;
		}
		
	}
}

t_max_err mode_set(t_chaos *x, t_object *attr, long argc, t_atom *argv)
{
	int mode;
	
	if ( atom_gettype(argv) == A_LONG) mode = atom_getlong(argv);
	else if ( atom_gettype(argv) == A_FLOAT) mode = (int)atom_getfloat(argv);
	else if ( atom_gettype(argv) == A_SYM)
	{
		if ( gensym(argv->a_w.w_sym->s_name) == gensym("Ikeda")) mode = 0;
		else if ( gensym(argv->a_w.w_sym->s_name) == gensym("Mira")) mode = 1;
		else if ( gensym(argv->a_w.w_sym->s_name) == gensym("Jong")) mode = 2;
		else if ( gensym(argv->a_w.w_sym->s_name) == gensym("Lorenz")) mode = 3;
		else if ( gensym(argv->a_w.w_sym->s_name) == gensym("Clifford")) mode = 4;
		else if ( gensym(argv->a_w.w_sym->s_name) == gensym("Duffing")) mode = 5;
	}

	if (mode != x->f_mode || x->f_count == 0)
	{
		x->f_mode = mode;
		switch(x->f_mode)
		{
		case 0:
			ikeda_init(x, gensym("init"), argc-1, argv+1 );
			break;
		case 1:
			mira_init(x, gensym("init"), argc-1, argv+1 );
			break;
		case 2:
			jong_init(x, gensym("init"), argc-1, argv+1 );
			break;
		case 3:
			lorenz_init(x, gensym("init"), argc-1, argv+1 );
			break;
		case 4:
			clifford_init(x, gensym("init"), argc-1, argv+1 );
			break;
		case 5:
			duffing_init(x, gensym("init"), argc-1, argv+1 );
			break;
		}
	}
	return 0;
}
