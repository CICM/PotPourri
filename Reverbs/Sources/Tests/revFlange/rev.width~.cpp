
/*
 *
 * Copyright (C) 2012 Pierre Guillot, Universite Paris 8
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

#include "StereoWidth.h"

extern "C" 
{
	#include "ext.h"
	#include "ext_obex.h"
	#include "z_dsp.h"
	#include "buffer.h"
	#include "ext_globalsymbol.h"
}


typedef struct _stereoWidth
{
	t_pxobject		f_ob;	
	StereoWidth		*f_stereoWidth;
}
t_stereoWidth ;

void *stereoWidth_new(t_symbol *s, long argc, t_atom *argv);
void stereoWidth_free(t_stereoWidth *x);
void stereoWidth_assist(t_stereoWidth *x, void *b, long m, long a, char *s);

void stereoWidth_float(t_stereoWidth *x, double f);
void stereoWidth_int(t_stereoWidth *x, long n);

void stereoWidth_dsp(t_stereoWidth *x, t_signal **sp, short *count);
t_int *stereoWidth_perform(t_int *w);

void stereoWidth_dsp64(t_stereoWidth *x, t_object *dsp64, short *count, double samplerate, long maxvectorsize, long flags);
void stereoWidth_perform64(t_stereoWidth *x, t_object *dsp64, double **ins, long numins, double **outs, long numouts, long sampleframes, long flags, void *userparam);

void *stereoWidth_class;

int main(void)
{	
	t_class *c;
	
	c = class_new("rev.width~", (method)stereoWidth_new, (method)stereoWidth_free, (long)sizeof(t_stereoWidth ), 0L, A_GIMME, 0);
	
	class_addmethod(c, (method)stereoWidth_dsp,			"dsp",			A_CANT, 0);
	class_addmethod(c, (method)stereoWidth_dsp64,		"dsp64",		A_CANT, 0);
	class_addmethod(c, (method)stereoWidth_assist,		"assist",		A_CANT, 0);
	class_addmethod(c, (method)stereoWidth_float,		"float",		A_FLOAT,0);
	class_addmethod(c, (method)stereoWidth_int,			"int",			A_LONG, 0);
	
	class_dspinit(c);				
	class_register(CLASS_BOX, c);	
	stereoWidth_class = c;
	
	post("rev.library by Pierre Guillot");
	post("Copyright (C) 2012, CICM / Universite Paris 8");
	
	return 0;
}

void *stereoWidth_new(t_symbol *s, long argc, t_atom *argv)
{
	t_stereoWidth *x = NULL;
	if (x = (t_stereoWidth *)object_alloc((t_class*)stereoWidth_class)) 
	{	
		x->f_stereoWidth = new StereoWidth();
		
		dsp_setup((t_pxobject *)x, 3);	
		outlet_new(x, "signal");
		outlet_new(x, "signal");
		attr_args_process(x, argc, argv);
	}
	return (x);
}

void stereoWidth_float(t_stereoWidth *x, double f)
{
	x->f_stereoWidth->setWidth(f);
}

void stereoWidth_int(t_stereoWidth *x, long n)
{
	x->f_stereoWidth->setWidth(n);
}

void stereoWidth_dsp(t_stereoWidth *x, t_signal **sp, short *count)
{
	x->f_stereoWidth->setVectorSize(sp[0]->s_n);
	long numberOfinlets = 0;
	for(int i = 0; i < 3; i++)
	{
		if (count[i])
			numberOfinlets++;
	}
	
	int i;
	int pointer_count;
	t_int **sigvec;
	
	pointer_count = 7;
		
	sigvec  = (t_int **)calloc(pointer_count, sizeof(t_int *));
	for(i = 0; i < pointer_count; i++)
		sigvec[i] = (t_int *)calloc(1, sizeof(t_int));
		
	sigvec[0] = (t_int *)x;
	sigvec[1] = (t_int *)numberOfinlets;
	for(i = 2; i < pointer_count; i++)
		sigvec[i] = (t_int *)sp[i - 2]->s_vec;
	
	dsp_addv(stereoWidth_perform, pointer_count, (void **)sigvec);
	free(sigvec);
}

t_int *stereoWidth_perform(t_int *w)
{
	t_stereoWidth*	x			= (t_stereoWidth *)(w[1]);
	long		numins			= (long)(w[2]);
	float**		ins				= (float **)(w+3);
	float**		outs			= (float **)(w+6);
	
	
	if(numins == 3)
		x->f_stereoWidth->process(ins, outs, ins[2]);
	else
		x->f_stereoWidth->process(ins, outs);

	return (w + 8);
}

void stereoWidth_dsp64(t_stereoWidth *x, t_object *dsp64, short *count, double samplerate, long maxvectorsize, long flags)
{
	x->f_stereoWidth->setVectorSize(maxvectorsize);
	object_method(dsp64, gensym("dsp_add64"), x, stereoWidth_perform64, 0, NULL);
}

void stereoWidth_perform64(t_stereoWidth *x, t_object *dsp64, double **ins, long numins, double **outs, long numouts, long sampleframes, long flags, void *userparam)
{

	if(numins == 3)
		x->f_stereoWidth->process(ins, outs, ins[2]);
	else
		x->f_stereoWidth->process(ins, outs);

}

void stereoWidth_assist(t_stereoWidth *x, void *b, long m, long a, char *s)
{
	if (a == 0) 
		sprintf(s,"(Signal) Left channel");
	else if(a == 1)
		sprintf(s,"(Signal) Right channel"); 			
	else
		sprintf(s,"(Signal, int or float) Width value");
}

void stereoWidth_free(t_stereoWidth *x)
{
	dsp_free((t_pxobject *)x);
	delete x->f_stereoWidth;
}
