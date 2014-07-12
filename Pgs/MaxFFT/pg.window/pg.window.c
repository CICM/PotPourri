
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

#include "pg.window.h"

void window_square(t_window *x)
{
	int i, size;

	size = x->f_size;
	for(i = 0; i < size; i++)
	{
		x->f_envelope[i] = 1.;
	}
}

void window_hamming(t_window *x)
{
	int i, size;
	double j;
	size = x->f_size;
	j = size - 1;
  
	for(i = 0; i < size; i++)
	{
		x->f_envelope[i] = 0.54 - (0.46 * cos(2.0 * PI *(double)i / j));
	}
}

void window_hanning(t_window *x)
{
	int i, size;
	double j;
	size = x->f_size;
	j = size - 1;
  
	for(i = 0; i < size; i++)
	{
		x->f_envelope[i] = 0.5 * (1.0 - cos(2.0 * PI * (double)i /j));
	}
}

void window_blackman(t_window *x)
{
	int i, size;
	double j;
	size = x->f_size;
	j = size - 1;

	for(i = 0; i < size; i++)
    {
		x->f_envelope[i] = 0.42 - (0.5 * cos(2.0 * PI * (double)i / j)) + (0.08 * cos(4.0 * PI * (double)i / j));
    }
}

void window_cosinus(t_window *x)
{
	int i, size;
	double j;
	size = x->f_size;
	j = size - 1;

	for(i = 0; i < size; i++)
    {
		x->f_envelope[i] = sin((PI * i) / j);
    }
}

void window_lanczos(t_window *x)
{
	int i, j, size;
	double alpha;
	size = x->f_size;
	j = size - 1;

	for(i = 0; i < size; i++)
    {
		alpha = PI * (((2. * (double)i) / j) - 1.);
		x->f_envelope[i] = sin(alpha)/alpha;
    }
}


void window_kaiser(t_window *x)
{
	int i, size;
	double sumvalue, alpha;
	size = x->f_size;
    sumvalue = 0.;
	alpha = 3.;
    for (i = 0; i < size / 2; i++) 
	{
        sumvalue += window_besselI0(PI * alpha * sqrt(1. - pow(4. * (double)i / (double)size - 1., 2.)));
        x->f_envelope[i] = sumvalue;
    }
    
    sumvalue += window_besselI0(PI * alpha * sqrt(1. - pow(4. * ((double)size /2. ) / (double)size - 1., 2.)));

    for (i = 0; i < size / 2; i++) 
	{
        x->f_envelope[i] = sqrt( x->f_envelope[i] / sumvalue);
        x->f_envelope[size - 1 - i] =  x->f_envelope[i];
    }
}

void window_triangular(t_window *x)
{
	int i, size;
	double j, k;
	size = x->f_size;
	j = size - 1;
	for(i = 0; i < size; i++)
    {
		k = (double)i -(j / 2.);
		x->f_envelope[i] = (2. / j) * ((j / 2.) - k);
    }
}

void window_gaussian(t_window *x)
{
	int i, size;
	double j, k, alpha;
	size = x->f_size;
	j = size - 1;
	alpha = 0.5;
	for(i = 0; i < size; i++)
    {
		k = (i - j / 2.)/(alpha * j / 2.) * (i - j / 2.)/(alpha * j / 2.) * -0.5;
		x->f_envelope[i] = exp(k);
    }
}

void window_bartlett_hann(t_window *x)
{
	int i, size;
	double j, a1, a2, a3, abso;
	size = x->f_size;
	j = size - 1;
	a1 = 0.62;
	a2 = 0.48;
	a3 = 0.38;
	for(i = 0; i < size; i++)
    {
		abso = ((double)i / (double)j) - 0.5;
		if(abso < 0.) abso = -abso;
		x->f_envelope[i] = a1 - a2 * abso - a3 * cos((2.0 * PI *(double)i) / j);
    }
}

void window_nuttall(t_window *x)
{
	int i, size;
	double j, a1, a2, a3, a4;
	size = x->f_size;
	j = size - 1;
	a1 = 0.255768;
	a2 = 0.487395;
	a3 = 0.144232;
	a4 = 0.012604;
	for(i = 0; i < size; i++)
    {
		x->f_envelope[i] = (a1 - a2 * (cos( (2.0 * PI * (double)i) / j)) + a3 * (cos( (4.0 * PI * (double)i) / j)) - a4 * (cos( (6.0 * PI * (double)i) / j)) + 0.032 * (cos( (8.0 * PI * (double)i) / j)));
    }
}

void window_blackman_harris(t_window *x)
{
	int i, size;
	double j, a1, a2, a3, a4;
	size = x->f_size;
	j = size - 1;
	a1 = 0.35875;
	a2 = 0.48829;
	a3 = 0.14128;
	a4 = 0.01168;
	for(i = 0; i < size; i++)
    {
		x->f_envelope[i] = (a1 - a2 * (cos( (2.0 * PI * (double)i) / j)) + a3 * (cos( (4.0 * PI * (double)i) / j)) - a4 * (cos( (6.0 * PI * (double)i) / j)) + 0.032 * (cos( (8.0 * PI * (double)i) / j)));
    }
}

void window_blackman_nuttall(t_window *x)
{
	int i, size;
	double j, a1, a2, a3, a4;
	size = x->f_size;
	j = size - 1;
	a1 = 0.3635819;
	a2 = 0.4891775;
	a3 = 0.1365995;
	a4 = 0.0106441;
	for(i = 0; i < size; i++)
    {
		x->f_envelope[i] = (a1 - a2 * (cos( (2.0 * PI * (double)i) / j)) + a3 * (cos( (4.0 * PI * (double)i) / j)) - a4 * (cos( (6.0 * PI * (double)i) / j)) + 0.032 * (cos( (8.0 * PI * (double)i) / j)));
    }
}
void window_flat_top(t_window *x)
{
	int i, size;
	double j, a1, a2, a3, a4;
	size = x->f_size;
	j = size - 1;
	a1 = 1.;
	a2 = 1.93;
	a3 = 1.29;
	a4 = 0.388;
	for(i = 0; i < size; i++)
    {
		x->f_envelope[i] = (a1 - a2 * (cos( (2.0 * PI * (double)i) / j)) + a3 * (cos( (4.0 * PI * (double)i) / j)) - a4 * (cos( (6.0 * PI * (double)i) / j)) + 0.032 * (cos( (8.0 * PI * (double)i) / j))) * 0.2;
    }
}

void window_poisson(t_window *x)
{
	int i, size;
	double j, alpha, beta;
	size = x->f_size;
	j = size - 1;
	alpha = 1./ (((double)size / 2.)/(60./8.69));
	for(i = 0; i < size; i++)
    {
		beta = -1. * ((double)i - (j / 2.));
		if (beta >= 0) beta = -beta;
		beta *= alpha;
		x->f_envelope[i] = exp(beta);
    }
}

void window_tukey(t_window *x)
{
	int i, size;
	double j, alpha;
	size = x->f_size;
	j = size - 1;
	alpha = 0.5;
	for(i = 0; i < size; i++)
    {
		if(i <= ((alpha * j) / 2.))
			x->f_envelope[i] = 0.5 * ( 1. + cos(PI * ( ((2 *(double)i) / (alpha * j)) - 1.)));
		else if(i > ((alpha * j) / 2.) && i <= (j * (1. - ( alpha / 2.))))
			x->f_envelope[i] = 1.;
		else 
			x->f_envelope[i] = 0.5 * ( 1. + cos(PI * ( ((2 *(double)i) / (alpha * j)) + 1. - (2. / alpha))));
    }
}


void window_setup(t_window *x, long size, long mode)
{
	if(x->f_size != size || x->f_mode != mode)
	{
		if(x->f_size != size)
		{
			if(x->f_envelope) 
				freebytes(x->f_envelope, x->f_size * sizeof(double));

			x->f_size = size;
			x->f_envelope = (double *)getbytes(x->f_size * sizeof(double));
		}
		if(x->f_mode != mode)
		{
			x->f_mode = mode;
		}
		window_Selector(x);
	}
}


void window_free(t_window *x)
{
	if(x->f_envelope != NULL) freebytes(x->f_envelope, sizeof(double)* x->f_size);
}

t_max_err window_mode_set(t_window *x, t_object *attr, long argc, t_atom *argv)
{
	int mode;
	mode = 16;
	if ( atom_gettype(argv) == A_LONG) mode = atom_getlong(argv);
	if(mode != x->f_mode)
	{
		x->f_mode = mode;
		window_Selector(x);
	}
	
	return 0;
}

void window_Selector(t_window *x)
{
	if(x->f_envelope)
	{
		switch(x->f_mode)
		{
			case 0:
				window_square(x);
				break;
			case 1:
				window_hanning(x);
				break;
			case 2:
				window_hamming(x);
				break;
			case 3:
				window_tukey(x);
				break;
			case 4:
				window_cosinus(x);
				break;
			case 5:
				window_lanczos(x);
				break;
			case 6:
				window_triangular(x);
				break;
			case 7:
				window_gaussian(x);
				break;
			case 8:
				window_bartlett_hann(x);
				break;
			case 9:
				window_blackman(x);
				break;
			case 10:
				window_kaiser(x);
				break;
			case 11:
				window_nuttall(x);
				break;
			case 12:
				window_blackman_harris(x);
				break;
			case 13:
				window_blackman_nuttall(x);
				break;
			case 14:
				window_flat_top(x);
				break;
			case 15:
				window_poisson(x);
				break;
		}
	}
}

double window_besselI0(double x)
{
    double denominator;
    double numerator;
    double z;
    
    if (x == 0.0) 
	{
        return 1.;
    } 
	else 
	{
        z = x * x;
        numerator = (z* (z* (z* (z* (z* (z* (z* (z* (z* (z* (z* (z* (z* 
            (z* 0.210580722890567e-22  + 0.380715242345326e-19 ) +
            0.479440257548300e-16) + 0.435125971262668e-13 ) +
            0.300931127112960e-10) + 0.160224679395361e-7  ) +
            0.654858370096785e-5)  + 0.202591084143397e-2  ) +
            0.463076284721000e0)   + 0.754337328948189e2   ) +
            0.830792541809429e4)   + 0.571661130563785e6   ) +
            0.216415572361227e8)   + 0.356644482244025e9   ) +
            0.144048298227235e10);
        
        denominator = (z*(z*(z-0.307646912682801e4)+
            0.347626332405882e7)-0.144048298227235e10);
    }
    
    return -numerator/denominator;
}