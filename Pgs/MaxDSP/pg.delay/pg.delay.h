
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
     
#define XTRASAMPS	4
#define RATIO 0.16666666666666666667

typedef struct delay
{
    int			f_lenght;
	double		f_lenghtMs;
	int			f_phase;
	double		f_sr;
    double		*f_vector;
} t_delay;

void delay_setup(t_delay *c, double msec, double sr);
void delay_resize(t_delay *c, double sr);
void delay_write(t_delay *c, double sample);
double delay_read_ms_quadra(t_delay *c, double delay);
double delay_read_ms_linear(t_delay *c, double delay);
double delay_read_sample(t_delay *c, int delay);
void delay_free(t_delay *c);

