/**
 * HoaLibrary : A High Order Ambisonics Library
 * Copyright (c) 2012-2013 Julien Colafrancesco, Pierre Guillot, Eliott Paris, CICM, Universite Paris-8.
 * All rights reserved.
 *
 * Website  : http://www.mshparisnord.fr/hoalibrary/
 * Contacts : cicm.mshparisnord@gmail.com
 *
 * Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 *
 *  - Redistributions may not be sold, nor may they be used in a commercial product or activity.
 *  - Redistributions of source code must retain the above copyright notice, 
 *      this list of conditions and the following disclaimer.
 *  - Redistributions in binary form must reproduce the above copyright notice,
 *      this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 *  - Neither the name of the CICM nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES,
 * INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
 * IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED 
 * AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include "CicmFreeverb.h"

Freeverb::Freeverb()
{    
    for(int i = 0; i < numcombs; i++)
    {
        m_comb_filter.push_back(new FilterComb(combtuning[i]+46));
        m_comb_filter[i]->setBufferSize(combtuning[i]);
    }
    
    for(int i = 0; i < numallpasses; i++)
    {
        m_allpass_filter.push_back(new FilterAllpass((long)(allpasstuning[i]+46)));
        m_allpass_filter[i]->setBufferSize(allpasstuning[i]);
        m_allpass_filter[i]->setFeedback(0.5);
    }
    
    setSamplingRate(44100);
	setroomsize(initialroom);
	setdamp(initialdamp);
	setmode(initialmode);
    setDryValue(0.);
    setWetValue(1.);
    setSpread(0.);
}

void Freeverb::setVectorSize(long aVectorSize)
{
	m_vector_size = Tools::clip_power_of_two(aVectorSize);
}

long Freeverb::getVectorSize()
{
	return m_vector_size;
}

void Freeverb::setSamplingRate(long aSamplingRate)
{
    m_sampling_rate = aSamplingRate;
    
    for(int i = 0; i < numcombs; i++)
        m_comb_filter[i]->setBufferSizeMax((long)((combtuning[i] + 47) * (double)m_sampling_rate / 44100.));
    for(int i = 0; i < numallpasses; i++)
        m_allpass_filter[i]->setBufferSizeMax((long)((allpasstuning[i] + 47) * (double)m_sampling_rate / 44100.));
    
    setDirectionalSpread(m_directional_spread);
    setDiffuseSpread(m_diffuse_spread);
}

long Freeverb::getSamplingRate()
{
	return m_sampling_rate;
}


void Freeverb::update()
{
	if (mode >= freezemode)
	{
		roomsize1 = 1;
		damp1 = 0;
		m_gain = muted;
	}
	else
	{
		roomsize1 = roomsize;
		damp1 = damp;
		m_gain = fixedgain;
	}

	for(int i = 0; i < numcombs; i++)
	{
		m_comb_filter[i]->setFeedback(roomsize1);
		m_comb_filter[i]->setDamp(damp1);
	}
}

void Freeverb::setroomsize(double value)
{
	if(value <= 0.)
		value = 0.;
	else if (value >= 1.)
		value = 1;
	roomsize = (value*scaleroom) + offsetroom;
	update();
}

double Freeverb::getroomsize()
{
	return (roomsize-offsetroom)/scaleroom;
}

void Freeverb::setdamp(double value)
{
	if(value <= 0.)
		value = 0.;
	else if (value >= 1.)
		value = 1;
	damp = value*scaledamp;
	update();
}

double Freeverb::getdamp()
{
	return damp/scaledamp;
}

void Freeverb::setmode(double value)
{
	if(value <= 0.)
		value = 0.;
	else if (value >= 1.)
		value = 1;
	mode = value;
	update();
}

double Freeverb::getmode()
{
	if (mode >= freezemode)
		return 1;
	else
		return 0;
}

void Freeverb::setDryValue(double value)
{
    m_dry = Tools::clip(value, 0., 1.);
}

double Freeverb::getDryValue()
{
    return m_dry;
}

void Freeverb::setWetValue(double value)
{
    m_wet = Tools::clip(value, 0., 1.);
}

double Freeverb::getWetValue()
{
    return m_wet;
}

void Freeverb::setAllpassFeedback(double value)
{
    value = Tools::clip(value, 0., 1.);
    for(int i = 0; i < numallpasses; i++)
        m_allpass_filter[i]->setFeedback(value);
}

double Freeverb::getAllpassFeedback()
{
    return m_allpass_filter[0]->getFeedback();
}

void Freeverb::setSpread(double value)
{
    setDiffuseSpread(value);
    setDirectionalSpread(value);
}

void Freeverb::setDiffuseSpread(double value)
{
    m_diffuse_spread = Tools::clip(value, 0., 1.) * 46.;
    for(int i = 0; i < numcombs; i++)
    {
        long bufferSize = (combtuning[i] + m_diffuse_spread) * ((double)m_sampling_rate / 44100.);
        m_comb_filter[i]->setBufferSize(bufferSize);
    }
}

void Freeverb::setDirectionalSpread(double value)
{
    m_directional_spread = Tools::clip(value, 0., 1.) * 46.;
    for(int i = 0; i < numallpasses; i++)
    {
        long bufferSize = (allpasstuning[i] + m_directional_spread) * ((double)m_sampling_rate / 44100.);
        m_allpass_filter[i]->setBufferSize(bufferSize);
    }
}

double Freeverb::getDiffuseSpread()
{
    return m_diffuse_spread;
}

double Freeverb::getDirectionalSpread()
{
    return m_directional_spread;
}

Freeverb::~Freeverb()
{
    m_comb_filter.clear();
    m_allpass_filter.clear();   
}
