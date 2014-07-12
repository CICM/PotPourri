
/*
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
* guillotpierre6@gmail.com
*/

#include "pg.delay.h"

void delay_setup(t_delay *c, double msec, double sr)
{
	c->f_sr = sr * 0.001;
	c->f_lenghtMs = msec;
    c->f_lenght =  c->f_lenghtMs * (double)sys_getsr() * 0.001;
	c->f_lenght += 64;
	if (c->f_lenght < 1)  c->f_lenght = 1;
    c->f_vector = (double *)getbytes(( c->f_lenght + XTRASAMPS) * sizeof(double));
    c->f_phase = XTRASAMPS;
}

void delay_resize(t_delay *c, double sr)
{
	if(c->f_sr != sr * 0.001)
	{
		freebytes((double *)c->f_vector, (c->f_lenght + XTRASAMPS) * sizeof(double));
		c->f_sr = sr * 0.001;
		c->f_lenght =  c->f_lenghtMs * c->f_sr;
		c->f_lenght += 64;
		if (c->f_lenght < 1)
			c->f_lenght = 1;
		c->f_vector = (double *)getbytes((c->f_lenght + XTRASAMPS) * sizeof(double));
		c->f_phase = XTRASAMPS;
	}
}

void delay_write(t_delay *c, double sample)
{

	c->f_vector[c->f_phase] = sample;
	c->f_phase++;
	if (c->f_phase == c->f_lenght + XTRASAMPS)
	{
		c->f_vector[0] = c->f_vector[c->f_phase -4];
		c->f_vector[1] = c->f_vector[c->f_phase -3];
		c->f_vector[2] = c->f_vector[c->f_phase -2];
		c->f_vector[3] = c->f_vector[c->f_phase -1];
		c->f_phase = 4;
	}
}

double delay_read_ms_quadra(t_delay *c, double delay)
{
	int delaySample;
	double aa, bb, cc, dd, cminusb, frac, out;

	delay *= c->f_sr;
	if(delay > (double)(c->f_lenght - 1))
		delay = (double)(c->f_lenght - 1);
	if(delay < 0.)
		delay = 0.;
	
	delaySample = delay;
	frac = delay - (double)delaySample;
	delaySample = (double)c->f_phase - (delaySample);
	if(delaySample < XTRASAMPS) delaySample += c->f_lenght;

	dd = c->f_vector[delaySample-3];
	cc = c->f_vector[delaySample-2];
	bb = c->f_vector[delaySample-1];
	aa = c->f_vector[delaySample];
	cminusb = cc - bb;
	out = bb + frac * (cminusb - RATIO * (1. - frac) * ((dd - aa - 3. * cminusb) * frac + (dd + 2. * aa - 3. * bb)));

	return out;
}

double delay_read_ms_linear(t_delay *c, double delay)
{
	int delaySample;
	double one, two, ratio, out;

	delay *= c->f_sr;
	if(delay > (double)(c->f_lenght - 1))
		delay = (double)(c->f_lenght - 1);
	if(delay < 0.)
		delay = 0.;
	
	delaySample = delay;
	ratio = delay - (double)delaySample;
	delaySample = (double)c->f_phase - (delaySample);
	if(delaySample < XTRASAMPS) delaySample += c->f_lenght;

	two = c->f_vector[delaySample-1];
	one = c->f_vector[delaySample];
	out = two * ratio + one * (1. - ratio);

	return out;
}

double delay_read_sample(t_delay *c, int delay)
{
	double out;
	if(delay > (c->f_lenght - 1))
		delay = (c->f_lenght - 1);
	delay = (double)c->f_phase - delay;
	if(delay < XTRASAMPS)
		delay += c->f_lenght;

	out = c->f_vector[delay];
	
	return out;
}

void delay_free(t_delay *c)
{
    freebytes(c->f_vector, (c->f_lenght + XTRASAMPS) * sizeof(double));
}



