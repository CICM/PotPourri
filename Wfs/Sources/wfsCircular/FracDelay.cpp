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


#include "FracDelay.h"

FracDelay::FracDelay(long aBufferSize, std::string aMode)
{
	m_bufferSize = aBufferSize;
	m_buffer = new double[m_bufferSize];
	for(int i = 0; i < m_bufferSize; i++)
		m_buffer[i] = 0;
	setMode(aMode);
	m_ramp = 0;
}

void FracDelay::write(double aSample)
{
	m_buffer[m_ramp] = aSample;
	if(++m_ramp == m_bufferSize)
		m_ramp = 0;
}

double FracDelay::read(double aIndex)
{
	switch (m_mode) 
	{
		case 0:
			return linear(aIndex);
			break;
		case 1:
			return quadratic(aIndex);
			break;
		default:
			return lagrange(aIndex);
			break;
	}
}

double FracDelay::readwrite(double aSample, double aIndex)
{
	write(aSample);
	return read(aIndex);
}

void FracDelay::setMode(std::string aMode)
{
	if(aMode == "quadratic")
		m_mode = 1;
	else if(aMode == "lagrange")
		m_mode = 2;
	else
		m_mode = 0;
}

double FracDelay::getValueWithRelativeIndex(double aIndex)
{
	long index = (long)(aIndex + (m_ramp - 1) + m_bufferSize) % m_bufferSize;
	return m_buffer[index];
}

double FracDelay::linear(double index)  
{
	int		floorPart	= index;
	double	decimalPart = index - floorPart;
	double	out = getValueWithRelativeIndex(index) * (1. - decimalPart)	+ getValueWithRelativeIndex(index + 1) * decimalPart;
	return out;
}

double FracDelay::quadratic(double index)  
{
	int		floorPart	= index;
	double	decimalPart = index - floorPart;
	double	one, two, thr, fou, oneMthr, alpha;
	double	out;
	
	fou = getValueWithRelativeIndex(index - 3);
	thr = getValueWithRelativeIndex(index - 2);
	two = getValueWithRelativeIndex(index - 1);
	one = getValueWithRelativeIndex(index);
	oneMthr = thr - two;
	alpha = 5. / 3.;
	
	out = two + decimalPart * (oneMthr - alpha * (1. - decimalPart) * ((fou - one - 3. * oneMthr) * decimalPart + (fou + 2. * one - 3. * two)));

	return out;
}

double FracDelay::lagrange(double index)  
{
	int i, j;
	long floorPart  = (int)index;
	double decimalPart = index - floorPart + 1.;
	long tmpIndex;
	double out, weight;

	
	for (i = 0, out = 0.; i < 4; ++i) 
	{
		tmpIndex = floorPart - 1 + i;
		for (j = 0, weight = 1.; j < 4; ++j) 
		{
			if (j != i) 
				weight *= (decimalPart - j) / (double)(i - j);
		}
		
		out += weight * getValueWithRelativeIndex(tmpIndex);
	}
	
	return out;

}

FracDelay::~FracDelay()
{
	free(m_buffer);
}
