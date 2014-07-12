
/*
 *
 * Copyright (C) 2012 Julien Colafrancesco & Pierre Guillot, Universite Paris 8
 * 
 * This library is free software; you can redistribute it and/or modify it 
 * under the terms of the GNU Library General Public License as published 
 * by the Free Software Foundation; either version 2 of the License.
 * 
 * This library is distributed in the hope that it will be useful, but WITHOUT 
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or 
 * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Library General Public 
 * License for more details.
 *
 * You should have received a copy of the GNU Library General Public License 
 * along with this library; if not, write to the Free Software Foundation, 
 * Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 *
 */

extern "C" 
{
#include "ext.h"
#include "ext_obex.h"
#include "z_dsp.h"
}

#include <wfs.h>

// Object structure
typedef struct _Huygens 
{
	t_pxobject		f_ob;
	
	long			f_n;
	double			f_sr;
	
	wfs				*f_wfsLinear;
	
	double			f_positionX;
	double			f_positionY;
	
	long			f_inputNumber;
	long			f_outputNumber;
	
	long			f_mode;
	float			f_speakersDelta;
	float			f_speakersDistance;
	long			f_interpolation;
	
	short			f_count[2];
} 
t_Huygens;

/* Prototypes of the functions */
void *Huygens_new(t_symbol *s, long argc, t_atom *argv);
void Huygens_free(t_Huygens *x);
void Huygens_assist(t_Huygens *x, void *b, long m, long a, char *s);
void Huygens_float(t_Huygens *x, double f);
void Huygens_int(t_Huygens *x, long n);
t_max_err delta_set(t_Huygens *x, t_object *attr, long argc, t_atom *argv);
t_max_err distance_set(t_Huygens *x, t_object *attr, long argc, t_atom *argv);
void Huygens_interpolation(t_Huygens *x, long n);

void Huygens_dsp(t_Huygens *x, t_signal **sp, short *count);
t_int *Huygens_perform(t_int *w);

void Huygens_dsp64(t_Huygens *x, t_object *dsp64, short *count, double samplerate, long maxvectorsize, long flags);
void Huygens_perform64(t_Huygens *x, t_object *dsp64, double **ins, long numins, double **outs, long numouts, long sampleframes, long flags, void *userparam);

/* Global class pointer variable */
void *Huygens_class;


int main(void)
{	
	t_class *c;
	
	c = class_new("wfs.linear~", (method)Huygens_new, (method)Huygens_free, (long)sizeof(t_Huygens), 0L, A_GIMME, 0);
	
	class_addmethod(c, (method)Huygens_dsp,			"dsp",			A_CANT, 0);
	class_addmethod(c, (method)Huygens_dsp64,		"dsp64",		A_CANT, 0);
	class_addmethod(c, (method)Huygens_assist,		"assist",		A_CANT, 0);
	class_addmethod(c, (method)Huygens_float,		"float",		A_FLOAT, 0);
	class_addmethod(c, (method)Huygens_float,		"int",			A_LONG, 0);
	
	CLASS_ATTR_FLOAT			(c, "distance", 0, t_Huygens, f_speakersDistance);
	CLASS_ATTR_LABEL			(c, "distance", 0, "Distance between speakers array and listener");
	CLASS_ATTR_ACCESSORS		(c, "distance", NULL, distance_set);
	CLASS_ATTR_SAVE				(c, "distance", 1);
	CLASS_ATTR_FILTER_MIN		(c, "distance", 0.);
	CLASS_ATTR_ORDER			(c, "distance", 0, "1");
	
	CLASS_ATTR_FLOAT			(c, "delta", 0, t_Huygens, f_speakersDelta);
	CLASS_ATTR_LABEL			(c, "delta", 0, "Distance between speakers");
	CLASS_ATTR_ACCESSORS		(c, "delta", NULL, delta_set);
	CLASS_ATTR_SAVE				(c, "delta", 1);
	CLASS_ATTR_FILTER_MIN		(c, "delta", 0.);
	CLASS_ATTR_ORDER			(c, "delta", 0, "2");
	
	CLASS_ATTR_LONG				(c, "interpolation", 0, t_Huygens, f_interpolation);
	CLASS_ATTR_LABEL			(c, "interpolation", 0, "Delay interpolation");
	CLASS_ATTR_ENUMINDEX		(c, "interpolation", 0, "Linear \" \"Quadratic \" \"Lagrange");
	CLASS_ATTR_SAVE				(c, "interpolation", 1);
	CLASS_ATTR_FILTER_CLIP		(c, "interpolation", 0, 2);
	CLASS_ATTR_ORDER			(c, "interpolation", 0, "3");
	
	class_dspinit(c);				
	class_register(CLASS_BOX, c);	
	Huygens_class = c;
	
	post("huygens~ by Julien Colafrancesco & Pierre Guillot");
	post("Copyright (C) 2012, CICM / Universite Paris 8");
	
	return 0;
}

void *Huygens_new(t_symbol *s, long argc, t_atom *argv)
{
	t_Huygens *x = NULL;
	
	int i;
	if (x = (t_Huygens *)object_alloc((t_class*)Huygens_class)) 
	{
		
		x->f_inputNumber = 3;
		x->f_outputNumber = 16;
		x->f_mode = 0;
		x->f_speakersDelta = 0.189;
		x->f_speakersDistance = 0.5;
		x->f_interpolation = 2;
		x->f_positionX = 0.;
		x->f_positionY = 0.25;
		
		if(atom_gettype(argv) == A_LONG) 
			x->f_outputNumber = atom_getlong(argv);
		if(x->f_outputNumber <= 0) 
			x->f_outputNumber = 16;
		if(atom_gettype(argv+1) == A_FLOAT)
			x->f_speakersDelta = atom_getfloat(argv+1);
		if(x->f_speakersDelta <= 0.) 
			x->f_speakersDelta = 0.0001;
		if(atom_gettype(argv+2) == A_FLOAT)
			x->f_speakersDistance = atom_getfloat(argv+2);
		if(x->f_speakersDistance <= 0.) 
			x->f_speakersDistance = 0.001;
		if(atom_gettype(argv+3) ==  A_LONG)
			x->f_interpolation = atom_getlong(argv+3);
		if(x->f_interpolation < 0 || x->f_interpolation > 2) 
			x->f_interpolation = 0;
		
		x->f_wfsLinear = new wfs(x->f_outputNumber, x->f_speakersDelta, -1.10);
		x->f_wfsLinear->setReferenceDistance(x->f_speakersDistance);
		x->f_wfsLinear->setSpeakersDelta(x->f_speakersDelta);
		x->f_wfsLinear->setSamplingRate(x->f_sr);
		
		/* Inlet initialization */
		dsp_setup((t_pxobject *)x, x->f_inputNumber);	
		/* Outlet initialization */
		for (i = 0; i < x->f_outputNumber; i++) 
			outlet_new(x, "signal");
		
		attr_args_process(x, argc, argv);
	}
	return (x);
}

void Huygens_dsp(t_Huygens *x, t_signal **sp, short *count)
{
	int i;
	int pointer_count;
	t_int **sigvec;
	
	x->f_n	= (int)sp[0]->s_n;
	x->f_sr	= (int)sp[0]->s_sr;
	
	pointer_count = x->f_outputNumber + 5;
	
	sigvec  = (t_int **)calloc(pointer_count, sizeof(t_int *));
	for(i = 0; i < pointer_count; i++)
		sigvec[i] = (t_int *)calloc(1, sizeof(t_int));
	
	sigvec[0] = (t_int *)x;
	sigvec[1] = (t_int *)sp[0]->s_n;
	for(i = 2; i < pointer_count; i++)
		sigvec[i] = (t_int *)sp[i - 2]->s_vec;
	
	x->f_count[0] = count[1];
	x->f_count[1] = count[2];
	
	x->f_wfsLinear->setSamplingRate(x->f_sr);
	dsp_addv(Huygens_perform, pointer_count, (void **)sigvec);
	free(sigvec);
}

t_int *Huygens_perform(t_int *w)
{
	int j;
	double *tmp_output;
	
	t_Huygens	*x			= (t_Huygens *)(w[1]);
	int			n			= (int)(w[2]);
	t_float		**signals	= (t_float **)w+3;
	
	for (int i = 0; i < n; i++) 
	{
		if(x->f_count[0])
			x->f_positionX = signals[1][i];
		if(x->f_count[1])
			x->f_positionY = signals[2][i];
		

		x->f_wfsLinear->setVirtualSourcePos(x->f_positionX, x->f_positionY);
		tmp_output = x->f_wfsLinear->process(signals[0][i]);
		
				
		for (j = 0; j < x->f_outputNumber; j++) 
			signals[j+3][i] = tmp_output[j];
		
	}
	
	return (w + x->f_outputNumber + 6);
}

void Huygens_dsp64(t_Huygens *x, t_object *dsp64, short *count, double samplerate, long maxvectorsize, long flags)
{
	x->f_n	= maxvectorsize;
	x->f_sr	= samplerate;
	
	x->f_count[0] = count[1];
	x->f_count[1] = count[2];
	x->f_wfsLinear->setSamplingRate(x->f_sr);
	object_method(dsp64, gensym("dsp_add64"), x, Huygens_perform64, 0, NULL);	
}

void Huygens_perform64(t_Huygens *x, t_object *dsp64, double **ins, long numins, double **outs, long numouts, long sampleframes, long flags, void *userparam)
{
	int i, j;
	double *tmp_output;
	
	for (i = 0; i < sampleframes; i++) 
	{
		if(x->f_count[0])
		   x->f_positionX = ins[1][i];
		if(x->f_count[1])
			x->f_positionY = ins[2][i];
		
		x->f_wfsLinear->setVirtualSourcePos(x->f_positionX, x->f_positionY);
		tmp_output = x->f_wfsLinear->process(ins[0][i]);
		
		for (j = 0; j < x->f_outputNumber; j++) 
			outs[j][i] = tmp_output[j];
		
	}
}


void Huygens_float(t_Huygens *x, double f)
{
	int index = proxy_getinlet((t_object *)x);
	
	if(index == 1)
	{
		x->f_positionX = (double)f;
	}
	else if(index == 2)
	{
		x->f_positionY = (double)f;
	}
}

void Huygens_int(t_Huygens *x, long n)
{
	int index = proxy_getinlet((t_object *)x);
	
	if(index == 1)
	{
		x->f_positionX = (double)n;
	}
	else if(index == 2)
	{
		x->f_positionY = (double)n;
	}
}

void Huygens_assist(t_Huygens *x, void *b, long m, long a, char *s)
{
	if (m == ASSIST_INLET) 
	{
		if(a == 0)
			sprintf(s,"(Signal) Input signal");
		else if(a == 1)
			sprintf(s,"(Int, Float or Signal) X Coordinate");
		else if(a == 2)
			sprintf(s,"(Int, Float or Signal) Y Coordinate");
	} 
	else 
	{
		sprintf(s,"(Signal) Signal for speaker %ld", a); 			
	}
}

t_max_err distance_set(t_Huygens *x, t_object *attr, long argc, t_atom *argv)
{
	if(atom_gettype(argv) == A_FLOAT)
		x->f_wfsLinear->setReferenceDistance(atom_getfloat(argv));
	else  if(atom_gettype(argv) == A_LONG)
		x->f_wfsLinear->setReferenceDistance(atom_getlong(argv));
	return 0;
}

t_max_err delta_set(t_Huygens *x, t_object *attr, long argc, t_atom *argv)
{
	if(atom_gettype(argv) == A_FLOAT)
		x->f_wfsLinear->setSpeakersDelta(atom_getfloat(argv));
	else  if(atom_gettype(argv) == A_LONG)
		x->f_wfsLinear->setSpeakersDelta(atom_getlong(argv));
	return 0;
}

void Huygens_free(t_Huygens *x)
{
	dsp_free((t_pxobject *)x);
	delete x->f_wfsLinear;
}