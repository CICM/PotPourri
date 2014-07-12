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

#include "wfs.h"

/*
 * Abstract: Construction of a WFS object
 * Param: aNumberOfSpeaker    : number of speaker in the array
 * Param: aSpeakersDelta      : spacement between speakers (in m)
 * Param: aReferenceDistance  : reference distance (in m)
 */

wfs::wfs(int aNumberOfSpeaker, double aSpeakersDelta, double aReferenceDistance) : 
m_numberOfSpeaker(aNumberOfSpeaker), m_speakersDelta(aSpeakersDelta), m_referenceDistance(aReferenceDistance), m_samplingRate(44100)
{
	m_horizSpeakersPos	= new double[m_numberOfSpeaker];
	m_speakersGains		= new double[m_numberOfSpeaker];
	m_output			= new double[m_numberOfSpeaker];
	m_delaysObject		= new FracDelay(2048);
	for(int i = 0; i < m_numberOfSpeaker; i++)
	{
		m_horizSpeakersPos[i] = 0.;
		m_speakersGains[i] = 0.;
		m_output[i] = 0.;
	}
	
	m_distancesComplexes	= new MKL_Complex16[m_numberOfSpeaker];
	m_distancesVector = new double[m_numberOfSpeaker];
	m_anglesReal = new double[m_numberOfSpeaker];
	m_anglesImag = new double[m_numberOfSpeaker];
	m_anglesVector = new double[m_numberOfSpeaker];
	m_delaysVector = new double[m_numberOfSpeaker];	
	m_delaysRatios = new double[m_numberOfSpeaker];
	calculateSpeakersPosition();		
}



/*
 * Abstract: Set the coordinates of the virtual source
 * Param: aVirtualSourceHorzPos : virtual source horizontal coordinate (in m)
 * Param: aVirtualSourceVertPos : virtual source vertical coordinate (in m)
 */
void wfs::setVirtualSourcePos(double aVirtualSourceHorzPos, double aVirtualSourceVertPos)
{
	m_virtualSourceHorzPos = aVirtualSourceHorzPos;
	m_virtualSourceVertPos = aVirtualSourceVertPos;
}

/*
 * Abstract: Set the horizontal coordinate of the virtual source
 * Param: aVirtualSourceHorzPos : virtual source horizontal coordinate (in m)
 */
void wfs::setVirtualSourceHorzPos(double aVirtualSourceHorzPos)
{
	m_virtualSourceHorzPos = aVirtualSourceHorzPos;
	for (int i = 0; i < m_numberOfSpeaker; i++) 
	{
		m_distancesComplexes[i].real = m_horizSpeakersPos[i] - m_virtualSourceHorzPos;
		m_anglesReal[i] = m_virtualSourceVertPos - m_referenceDistance;
	}
}

/*
 * Abstract: Set the horizontal coordinate of the virtual source
 * Param: aVirtualSourceVertPos : virtual source vertical coordinate (in m)
 */
void wfs::setVirtualSourceVertPos(double aVirtualSourceVertPos)
{
	m_virtualSourceVertPos = aVirtualSourceVertPos;
	for (int i = 0; i < m_numberOfSpeaker; i++) 
	{
		m_distancesComplexes[i].imag =  m_referenceDistance - m_virtualSourceVertPos;
		m_anglesImag[i] = m_virtualSourceHorzPos - m_horizSpeakersPos[i];
	}
}

/*
 * Abstract: Set distance between loudspeakers
 * Param: aSpeakersDelta : speakers delta (in m)
 */
void wfs::setSpeakersDelta(double aSpeakersDelta)
{
	m_speakersDelta = aSpeakersDelta;
	calculateSpeakersPosition();
}

/*
 * Abstract: Set the number of loud
 * Param: aSpeakersDelta : speakers delta (in m)
 */
void wfs::setNumberOfSpeaker(double aNumberOfSpeaker)
{
	m_numberOfSpeaker = aNumberOfSpeaker;
	delete[] m_horizSpeakersPos;
	delete[] m_speakersGains;
	delete[] m_output;
	m_horizSpeakersPos	= new double[m_numberOfSpeaker];
	m_speakersGains		= new double[m_numberOfSpeaker];
	m_output			= new double[m_numberOfSpeaker];
	calculateSpeakersPosition();
}

/*
 * Abstract: Set the horizontal coordinate of the virtual source
 * Param: aVirtualSourceVertPos : virtual source vertical coordinate (in m)
 */
void wfs::setReferenceDistance(double aReferenceDistance)
{
	m_referenceDistance = aReferenceDistance;
}

void wfs::setSamplingRate(double aSamplingRate)
{
	m_samplingRate = aSamplingRate;
	for (int i = 0; i < m_numberOfSpeaker; i++) 
		m_delaysRatios[i] = (m_samplingRate / CELERITY_OF_SOUND);
}

/*
 * Abstract: Main process, call methods relatives to delays and gains associated with each speaker
 * Param: aSample : source signal (sample by sample)
 * Return: output vector (one sample per speaker)
 *
double* wfs::process(double aSample)
{
	double delay, theta, distance;
	double speakersGainSummation = 0.;
	
	m_delaysObject->write(aSample);
	for (int i = 0; i < m_numberOfSpeaker; i++) 
	{	
		distance = calculateDistance(i);
		theta = calculateAngle(i);
		delay = ((distance / CELERITY_OF_SOUND) * m_samplingRate) + 1.;
		
		if (isVirtualSourceOutside()) 
		{
			m_output[i] = m_delaysObject->read(-500. - delay);
			if (fabs(theta) < M_PI_2)
			{
				m_speakersGains[i] = (fabs(cos(theta))/sqrt(distance)) * m_speakersDelta;
				m_speakersGains[i] *= 0.5 * (1. - cos(M_2PI * (double)(i + 1) / (double)(m_numberOfSpeaker + 1)));
			}
			else 
				m_speakersGains[i] = 0.;
		}
		else
		{
			m_output[i] = m_delaysObject->read(-500. + delay);
			if(fabs(theta) >= M_PI_2)
				m_speakersGains[i] = (fabs(cos(theta))/sqrt(distance)) * m_speakersDelta;
			else
				m_speakersGains[i] = 0.;
		}
		
		speakersGainSummation += m_speakersGains[i];
	}
	
	for (int i = 0; i < m_numberOfSpeaker; i++)
	{
		m_speakersGains[i] /= speakersGainSummation;
		m_output[i] *= m_speakersGains[i];
	}
	return m_output;
}*/

double* wfs::process(double aSample)
{
	double delay, theta, distance;
	double speakersGainSummation = 0.;
	
	m_delaysObject->write(aSample);
	/* Distances */
	
	vzAbs(m_numberOfSpeaker, m_distancesComplexes, m_distancesVector);
	vdAtan2(m_numberOfSpeaker, m_anglesReal, m_anglesImag, m_anglesVector);
	vdMul(m_numberOfSpeaker, m_distancesVector, m_delaysRatios, m_delaysVector);
//	for (int i = 0; i < m_numberOfSpeaker; i++) 
//	{	
//		if (isVirtualSourceOutside()) 
//		{
//			m_output[i] = m_delaysObject->read(-501. - m_delaysVector[i]);
//			if (fabs(m_anglesVector[i]) < M_PI_2)
//			{
//				m_speakersGains[i] = (fabs(cos(m_anglesVector[i]))/sqrt(m_distancesVector[i])) * m_speakersDelta;
//				m_speakersGains[i] *= 0.5 * (1. - cos(M_2PI * (double)(i + 1) / (double)(m_numberOfSpeaker + 1)));
//			}
//			else 
//				m_speakersGains[i] = 0.;
//		}
//		else
//		{
//			m_output[i] = m_delaysObject->read(-499. + m_delaysVector[i]);
//			if(fabs(m_anglesVector[i]) >= M_PI_2)
//				m_speakersGains[i] = (fabs(cos(m_anglesVector[i]))/sqrt(m_distancesVector[i])) * m_speakersDelta;
//			else
//				m_speakersGains[i] = 0.;
//		}
//		
//		speakersGainSummation += m_speakersGains[i];
//	}
//	
//	for (int i = 0; i < m_numberOfSpeaker; i++)
//	{
//		m_speakersGains[i] /= speakersGainSummation;
//		m_output[i] *= m_speakersGains[i];
//	}
	return m_output;
}

// methods to virtualize 

double wfs::calculateDistance(int aSpeakerIndex)
{
	return module(m_horizSpeakersPos[aSpeakerIndex] - m_virtualSourceHorzPos, m_referenceDistance - m_virtualSourceVertPos);
}

double wfs::calculateAngle(int aSpeakerIndex)
{
	double angle  = atan2(m_virtualSourceHorzPos - m_horizSpeakersPos[aSpeakerIndex], m_virtualSourceVertPos - m_referenceDistance);
	angle -= M_2PI;
	angle = piWrap(angle);
	return angle;
}

bool wfs::isVirtualSourceOutside()
{
	if (m_virtualSourceVertPos >= m_referenceDistance)
		return true;
	else 
		return false;
}

void wfs::calculateSpeakersPosition()
{
	double firstSpeakerHorzPos;
	if (m_numberOfSpeaker % 2 == 0)
	{
		firstSpeakerHorzPos = -(m_numberOfSpeaker/2 - 0.5) * m_speakersDelta;
	}
	else
	{
		firstSpeakerHorzPos = -floor(m_numberOfSpeaker/2) * m_speakersDelta;
	}
	
	for (int i = 0; i < m_numberOfSpeaker; i++) 
	{
		m_horizSpeakersPos[i] = firstSpeakerHorzPos + (double)i * m_speakersDelta;
	}
}

/*
 * Abstract: Display values of the gain array
 */
void wfs::displayGains()
{
	for (int speakerIndex = 0; speakerIndex < m_numberOfSpeaker; speakerIndex++) {
		std::cout<<m_speakersGains[speakerIndex] << " ";
	}
	std::cout<<std::endl;
}

/*
 * Abstract: Display values of the output array
 */
void wfs::displayOutputs()
{
	for (int speakerIndex = 0; speakerIndex < m_numberOfSpeaker; speakerIndex++) {
		std::cout<<m_output[speakerIndex] << " ";
	}
	std::cout<<std::endl;
}

wfs::~wfs()
{
	free(m_horizSpeakersPos);
	free(m_output);
	free(m_speakersGains);
	free(m_delays);
	delete m_delaysObject;
}
