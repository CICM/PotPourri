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


#include "CicmFilterDelay.h"

CicmFilterDelay::CicmFilterDelay(long aBufferSize, long aVectorSize, long aSamplingRate) : Filter(aVectorSize, aSamplingRate)
{
	m_buffer = NULL;
    m_size = NULL;
    setBufferSizeInSample(aBufferSize);
}

CicmFilterDelay::CicmFilterDelay(double aBufferSize, long aVectorSize, long aSamplingRate) : Filter(aVectorSize, aSamplingRate)
{
    m_buffer = NULL;
    m_size = NULL;
    setBufferSizeInMs(aBufferSize);
}

long CicmFilterDelay::getBufferSizeInSample()
{
    return m_size;
}

double  CicmFilterDelay::getBufferSizeInMs()
{
    return (double)m_size / (double)m_sampling_rate * 1000.;
}

void CicmFilterDelay::setBufferSizeInSample(long aBufferSize)
{
    if(m_buffer)
        Cicm_Free(m_buffer);
    m_size = Tools::clip_min(aBufferSize, 1);
    Cicm_Vector_Double_Malloc(m_buffer, m_size);
    m_ramp = 0;
}

void CicmFilterDelay::setBufferSizeInMs(double aBufferSize)
{
    if(m_buffer)
        Cicm_Free(m_buffer);
    m_size = (long)((Tools::clip_min(aBufferSize, 1)+1) * (double)m_sampling_rate / 1000.);
    Cicm_Vector_Double_Malloc(m_buffer, m_size);
    m_ramp = 0;
}

CicmFilterDelay::~CicmFilterDelay()
{
	if(m_buffer)
        Cicm_Free(m_buffer);
}
