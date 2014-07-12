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

#ifndef DEF_WFS
#define DEF_WFS

#define CELERITY_OF_SOUND 340.29

#include "mkl.h"
#include "FracDelay.h"

class wfs
{
protected:
	int		m_numberOfSpeaker;
	double	m_speakersDelta;
	double	m_referenceDistance;
	double	m_virtualSourceHorzPos;
	double	m_virtualSourceVertPos;
	double	m_samplingRate;
	
	double*		m_horizSpeakersPos;
	double*		m_output;
	double*		m_speakersGains;
	double*		m_delays;
	FracDelay*	m_delaysObject;	
	
	MKL_Complex16*	m_distancesComplexes;
	double*			m_distancesVector;
	double*			m_anglesReal;
	double*			m_anglesImag;
	double*			m_anglesVector;
	double*			m_delaysRatios;
	double*			m_delaysVector;

public:
	wfs(int aNumberOfSpeaker, double aSpeakersDelta, double aReferenceDistance);
	
	virtual void calculateSpeakersPosition();
	virtual double calculateDistance(int aSpeakerIndex);
	virtual double calculateAngle(int aSpeakerIndex);
	virtual bool isVirtualSourceOutside();
	
	void	setVirtualSourcePos(double aVirtualSourceHorzPos, double aVirtualSourceVertPos);
	void	setVirtualSourceHorzPos(double aVirtualSourceHorzPos);
	void	setVirtualSourceVertPos(double aVirtualSourceVertPos);
	void	setSpeakersDelta(double aSpeakersDelta);
	void	setNumberOfSpeaker(double aNumberOfSpeaker);
	void	setReferenceDistance(double aReferenceDistance);
	void	setSamplingRate(double aSamplingRate);
	void	computeRatio();
	double* process(double aSample);

	void displayGains();
	void displayOutputs();

	~wfs();
};


inline double module(double x, double y)
{
	return sqrt(x*x + y*y);
}

inline double piWrap(double angularValue)
{
	if(angularValue > M_PI)
		angularValue -= M_2PI;
	else if(angularValue < -M_PI)
		angularValue += M_2PI;
	
	return angularValue;
	
}

#endif