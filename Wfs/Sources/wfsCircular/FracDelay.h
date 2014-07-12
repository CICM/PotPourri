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

#ifndef DEF_FRACDELAY
#define DEF_FRACDELAY

#include <stdio.h>
#include <iostream>
#include <string>
#include <math.h>

#define M_PI 3.14159265358979323846264338327950288
#define M_PI_2 1.57079632679489661923132169163975144
#define M_2PI 2.*M_PI

class FracDelay
{
	private:
	
	long		m_bufferSize;
	double*		m_buffer;
	long		m_ramp;
	int			m_mode;
	
	public:
	
	FracDelay(long aBufferSize, std::string aMode = "linear");

	void	write(double aSample);
	double	read(double aIndex);
	double	readwrite(double aSample, double aIndex);
	double	getValueWithRelativeIndex(double aIndex);
	void	setMode(std::string aMode);
	
	double linear(double index);
	double quadratic(double index);
	double lagrange(double index);
	~FracDelay();
};

#endif