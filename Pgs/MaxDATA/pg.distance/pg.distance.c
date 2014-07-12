
#define NMAX 25
#define TLIST 350

#include "ext.h"
#include "ext_obex.h"
#include "ext_common.h"

typedef struct  _distance 
{
	t_object c_ob;

	/* Attribute */
	int		c_order;
	int		c_mode;
	long	c_useweights;

	/* Inlets and outlets */
	long	c_proxy;
	void	*in;
	void	*out;
	void	*out2;
	void	*out3;

	/* Distances variables */
		
	int		c_checkTabL[NMAX];
	double	c_tabDistL[TLIST];
	int		c_countL;
	int		c_argc[NMAX];
	double	c_distMinL;
	double	c_resultList[NMAX];
	
	/* Lists re-size	*/
	double	*c_tabList[NMAX];
	double	c_poids[TLIST];	
	double	c_listIn[TLIST];

	/*	Variables de sorties */
	int		c_premierList;
	t_atom	*c_distance;
	t_atom	*c_listCompare[NMAX];
	
	

} t_distance;

void *distance_class;

void distance_assist(t_distance *x, void *b, long m, long a, char *s);
void distance_int(t_distance *x, long n);
void distance_float(t_distance *x, double f);
void distance_bang(t_distance *x);
void *distance_new(t_symbol *s, int argc, t_atom *argv);
void distance_free(t_distance *x);
void distance_clear(t_distance *x);
void distance_list(t_distance *x, t_symbol *s, long argc, t_atom *argv);
void distance_minkowski(t_distance *x);
void distance_order(t_distance *x, long n);
void distance_weights(t_distance *x, t_symbol *s, long argc, t_atom *argv);
t_max_err distance_mode_set(t_distance *x, t_object *attr, long argc, t_atom *argv);


int main()
{
	t_class *c;

	c = class_new("pg.distance", (method)distance_new, (method)distance_free, (short)sizeof(t_distance), 0L, A_GIMME, 0);
	class_addmethod(c, (method)distance_int,			"int",			A_LONG,		0);
	class_addmethod(c, (method)distance_float,			"float",		A_FLOAT,	0);
	class_addmethod(c, (method)distance_list,		"list",			A_GIMME,	0);
	class_addmethod(c, (method)distance_assist,			"assist",		A_CANT,		0);
	class_addmethod(c, (method)distance_clear,			"clear",					0);
	class_addmethod(c, (method)distance_bang,			"bang",					0);
	class_addmethod(c, (method)distance_weights,		"weights",		A_GIMME,	0);
	class_addmethod(c, (method)distance_order,			"order",		A_LONG,		0);
	
	class_register(CLASS_BOX, c);
	distance_class = c;
	
	CLASS_ATTR_LONG				(c, "useweights", 0, t_distance, c_useweights);
	CLASS_ATTR_STYLE_LABEL		(c, "useweights", 0, "onoff", "Use Weights");
	CLASS_ATTR_SAVE				(c, "useweights", 1);
	CLASS_ATTR_DEFAULT			(c, "useweights", 0, "0");
	CLASS_ATTR_ORDER			(c, "useweights", 0, "1");
	
	CLASS_ATTR_LONG				(c, "mode", 0, t_distance, c_mode);
	CLASS_ATTR_LABEL			(c, "mode", 0, "Mode");
	CLASS_ATTR_ENUMINDEX		(c, "mode", 0, "Manhattan \"Euclidean\" Minkowski");
	CLASS_ATTR_DEFAULT			(c, "mode", 0, "1");
	CLASS_ATTR_ACCESSORS		(c, "mode", NULL, distance_mode_set);
	CLASS_ATTR_SAVE				(c, "mode", 1);
			
	
	post("pg.distance by Pierre Guillot",0);
	post("Universite Paris 8, France",0);

	return 0;
}

void *distance_new(t_symbol *s, int argc, t_atom *argv)
{
	t_distance *x = NULL;

	if (x = (t_distance *)object_alloc(distance_class)) 
	{
		int i;
		for (i = 0; i < NMAX; i++)
		{
			x->c_tabList[i] = NULL;
			x->c_checkTabL[i] = 0;
			x->c_argc[i] = 0;
		}
		for (i = 0; i < TLIST; i++)
		{
			x->c_poids[i] = (double)1;
		}

		x->c_countL = 0;

		/* Entree et sortie	*/
		x->in = proxy_new((t_object *)x, 1, &x->c_proxy);

		x->out3 = listout((t_object *)x);
		x->out2 = listout((t_object *)x);
		x->out = intout((t_object *)x);

		attr_args_process (x, argc, argv);
	}
	
	return x;
}			


void distance_int(t_distance *x, long n)
{
	distance_float(x, (double)n);
}

void distance_float(t_distance *x, double f)
{
	int i;
	for (i = 0; i < TLIST; i++)
	{
		x->c_listIn[i] = (double)f;
	}
	distance_minkowski(x);
}


void distance_list(t_distance *x, t_symbol *s, long argc, t_atom *argv)
{
	long i;
	t_atom *ap;
	t_atom newlist[TLIST];

	switch (proxy_getinlet((t_object *)x)) 
	{
		case 1:
		{
			if ( atom_gettype(argv) == A_LONG || atom_getlong(argv) <= NMAX)
			{
				sysmem_freeptr(x->c_listCompare[atom_getlong(argv)-1]);
				x->c_listCompare[atom_getlong(argv)-1] = (t_atom *)sysmem_newptr((argc-1)*sizeof(t_atom));

				for (i = 0, ap = argv; i < (argc-1); i++) x->c_listCompare[atom_getlong(argv)-1][i] = ap[i+1];
				
				for (i = 0, ap = argv; i < TLIST; i++) newlist[i] = ap[(int)( (i*(argc-1)) / TLIST)+1];
		
				sysmem_freeptr(x->c_tabList[atom_getlong(argv)-1]);
				x->c_tabList[atom_getlong(argv)-1] = (double *)sysmem_newptr(TLIST*sizeof(double));
				x->c_argc[atom_getlong(argv)-1] = argc;

				for (i = 0, ap = newlist; i < TLIST; i++, ap++) 
				{
					switch (atom_gettype(ap))
					{
					case A_LONG:
						x->c_tabList[atom_getlong(argv)-1][i] = (double)atom_getlong(ap);
						x->c_checkTabL[atom_getlong(argv)-1] = 1;
						if(atom_getlong(argv)> x->c_countL) x->c_countL = atom_getlong(argv);
						sysmem_freeptr(x->c_distance);
						x->c_distance = (t_atom *)sysmem_newptr(x->c_countL*sizeof(t_atom));
					break;
					case A_FLOAT:
						x->c_tabList[atom_getlong(argv)-1][i] = (double)atom_getfloat(ap);
						x->c_checkTabL[atom_getlong(argv)-1] = 1;
						if(atom_getlong(argv) > x->c_countL) x->c_countL = atom_getlong(argv);
						sysmem_freeptr(x->c_distance);
						x->c_distance = (t_atom *)sysmem_newptr(x->c_countL*sizeof(t_atom));
					break;
					case A_SYM:
						post("Invalid atom type : %s", atom_getsym(newlist)->s_name);
					break;
					default:
						post("Invalid atom type : (%ld)", atom_gettype(newlist));
					break;
					}
				}
			}
			else post("Invalid key type or key is too high");
		}
		break;
		case 0:

			for (i = 0, ap = argv; i < TLIST; i++) newlist[i] = ap[(int)( (i*(argc)) / TLIST)];

			for (i = 0, ap = newlist; i < TLIST; i++, ap++) 
			{
				switch (atom_gettype(ap))
				{
				case A_LONG: x->c_listIn[i] = (double)atom_getlong(ap);
				break;
				case A_FLOAT:x->c_listIn[i] = (double)atom_getfloat(ap);
				break;
				case A_SYM: post("Invalid atom type : %s", atom_getsym(newlist)->s_name);
				break;
				default: post("Invalid atom type : (%ld)", atom_gettype(newlist));
				break;
				}
			}
			distance_minkowski(x);
		break;	
	}	
}


void distance_minkowski(t_distance *x)
{
	int i, b;
	int count = 0;
	double manhattan;

	if (x->c_countL != 0)
	{
	for (i = 0; i < x->c_countL; i++)
	{
		if (x->c_checkTabL[i] != 0)
		{
			x->c_resultList[i] = 0;
			if(x->c_useweights == 1)
			{
			for (b = 0; b < TLIST; b++) 
			{	
				manhattan = x->c_listIn[b] - x->c_tabList[i][b];
				if (manhattan < 0) manhattan = -manhattan; // Pour éviter de fausser la moyenne manhattan
				x->c_resultList[i] += (pow(manhattan,(double)x->c_order)/ ((double)(TLIST)/(double)(x->c_argc[i]-1)))*x->c_poids[i];// peut etre revoir TLIST/argc
			}
			}
			else
			{
			for (b = 0; b < TLIST; b++) 
			{	
				manhattan = x->c_listIn[b] - x->c_tabList[i][b];
				if (manhattan < 0) manhattan = -manhattan; // Pour éviter de fausser la moyenne manhattan
				x->c_resultList[i] += (pow(manhattan,(double)x->c_order)/ ((double)(TLIST)/(double)(x->c_argc[i]-1)));// peut etre revoir TLIST/argc
			}
			}
			x->c_resultList[i] = pow(x->c_resultList[i],((double)1/(double)x->c_order));
			
			
			atom_setfloat(x->c_distance+i, (float)x->c_resultList[i]);
			if (count == 0 ) 
			{
				x->c_distMinL = x->c_resultList[i];
				x->c_premierList = i+1;
			}
			else
			{
				if ( x->c_resultList[i] < x->c_distMinL) 
				{
					x->c_distMinL =  x->c_resultList[i];
					x->c_premierList = i+1;
				}
			}
			count++;
		}
	}
	outlet_float(x->out, x->c_premierList);
	outlet_list(x->out2,0L,(x->c_argc[x->c_premierList-1]-1),x->c_listCompare[x->c_premierList-1]);
	outlet_list(x->out3,0L,x->c_countL,x->c_distance);
	}
	
}

void distance_weights(t_distance *x, t_symbol *s, long argc, t_atom *argv)
{
	int i;
	t_atom *ap;
	t_atom newlist[TLIST];
	float total;

	for (i = 0, ap = argv; i < TLIST; i++) 
	{
		newlist[i] = ap[(int)((float)(i*argc) / (float)TLIST)];
	}
	for (i = 0, ap = newlist; i < TLIST; i++, ap++) 
	{
		switch (atom_gettype(ap))
		{
		case A_LONG:
			{
				x->c_poids[i] = (double)atom_getlong(ap);
			}
		break;
		case A_FLOAT:
			{
				x->c_poids[i] = (double)atom_getfloat(ap);
			}
		break;
		case A_SYM:
			post("Invalid atom type : %s", atom_getsym(newlist)->s_name);
		break;
		default:
			post("Invalid atom type : (%ld)", atom_gettype(newlist));
		break;
		}
	}
	total = 0;
	for (i = 0; i < TLIST; i++) 
	{
		if(x->c_poids[i] <= 0) x->c_poids[i] = 0.00001f; // Pas de poids négatis
		total += x->c_poids[i];
	}
	for (i = 0; i < TLIST; i++) 
	{
		x->c_poids[i] /= total;
		x->c_poids[i] *= (float)TLIST;
	}
	distance_minkowski(x);
}

void distance_order(t_distance *x, long n)
{
	if	(n <= 1) n = 1;
	if (x->c_mode == 2) x->c_order = n;
	distance_minkowski(x);
}

void distance_bang(t_distance *x)
{
	distance_minkowski(x);
}

void distance_assist(t_distance *x, void *b, long m, long a, char *s)
{
	if (m == ASSIST_INLET) 
	{
		switch (a) 
		{	
			case 0:
				sprintf(s,"(int, list or float) Input");
				break;
			case 1:
				sprintf(s,"(int) Keys, (int, list or float) Values to be compared");
				break;
		}
	}
	else 
	{
		switch (a) 
		{	
			case 0:
				sprintf(s,"(int) Key of the closest values ");
				break;
			case 2:
				sprintf(s,"(list) Distances");
				break;
			case 1:
				sprintf(s,"(int, list or float) Closest values");
				break;
		}
	}
}


void distance_free(t_distance *x)
{
	int i;
	sysmem_freeptr(x->c_distance);
	for(i = 0; i < x->c_countL; i++)
	{
		if(x->c_tabList[i]) sysmem_freeptr(x->c_tabList[i]);
	}
}

void distance_clear(t_distance *x)
{
	int i;
	for (i = 0; i < NMAX; i++)
	{
		x->c_tabList[i] = NULL;
		x->c_checkTabL[i] = 0;
	}
	for(i = 0; i < TLIST; i++)
		{
			x->c_poids[i] = 1;
		}
	x->c_countL = 0;

	sysmem_freeptr(x->c_distance);
}

t_max_err distance_mode_set(t_distance *x, t_object *attr, long argc, t_atom *argv)
{
long size = atom_getlong(argv);
x->c_mode = size;
x->c_order = size+1;

return 0;
}
