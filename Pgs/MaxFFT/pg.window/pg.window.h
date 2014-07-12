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

#include "ext.h"
#include "ext_obex.h"
#include "z_dsp.h"

typedef struct _window
{
	double		*f_envelope;
	long		f_size;
	long		f_mode;
}t_window;

void window_setup(t_window *x, long size, long mode);
void window_free(t_window *x);
t_max_err window_mode_set(t_window *x, t_object *attr, long argc, t_atom *argv);
void window_Selector(t_window *x);

void window_square(t_window *x);
void window_hamming(t_window *x);
void window_hanning(t_window *x);
void window_blackman(t_window *x);
void window_tukey(t_window *x);
void window_cosinus(t_window *x);
void window_lanczos(t_window *x);
void window_triangular(t_window *x);
void window_gaussian(t_window *x);
void window_kaiser(t_window *x);
void window_bartlett_hann(t_window *x);
void window_nuttall(t_window *x);
void window_blackman_harris(t_window *x);
void window_blackman_nuttall(t_window *x);
void window_flat_top(t_window *x);
void window_poisson(t_window *x);

double window_besselI0(double x);
