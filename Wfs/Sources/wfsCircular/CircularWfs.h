/*
 *  CircularWfs.h
 *  signalVec
 *
 *  Created by julien colafrancesco on 17/07/12.
 *
 */

#ifndef WFS_PI
#define WFS_PI 3.14159265358979323846 
#endif

#ifndef DEF_CIRCULAR_WFS
#define DEF_CIRCULAR_WFS

#include "Wfs.h"


class CircularWfs : public wfs
{
protected:
	double* m_speakersTheta;
	double* m_verticalSpeakersPos;
public:
	CircularWfs(int aNumberOfSpeaker, double aSpeakersDelta, double aReferenceDistance):
	wfs(aNumberOfSpeaker, aSpeakersDelta, aReferenceDistance)
	{
		m_speakersTheta = new double[m_numberOfSpeaker];
		m_verticalSpeakersPos = new double[m_numberOfSpeaker];

		
		calculateSpeakersPosition();
		
	}
	
	void calculateSpeakersPosition()
	{
		for(int speakerIndex = 0; speakerIndex < m_numberOfSpeaker; speakerIndex++)
		{
			m_speakersTheta[speakerIndex] = (2*WFS_PI/m_numberOfSpeaker)*speakerIndex;
			m_horizSpeakersPos[speakerIndex] = m_referenceDistance * cos(m_speakersTheta[speakerIndex]);
			m_verticalSpeakersPos[speakerIndex] = m_referenceDistance * sin(m_speakersTheta[speakerIndex]);
		}
	}
	
	double calculateDistance(int aSpeakerIndex)
	{
		double tmpVsToSpkVectorX = m_virtualSourceHorzPos - m_horizSpeakersPos[aSpeakerIndex];
		double tmpVsToSpkVectorY = m_virtualSourceVertPos - m_verticalSpeakersPos[aSpeakerIndex];		
		return module(tmpVsToSpkVectorX, tmpVsToSpkVectorY);
	}
	
	double calculateAngle(int aSpeakerIndex)
	{
		double tmpVsToSpkVectorX = m_virtualSourceHorzPos - m_horizSpeakersPos[aSpeakerIndex];
		double tmpVsToSpkVectorY = m_virtualSourceVertPos - m_verticalSpeakersPos[aSpeakerIndex];	
		double angle  = atan2(tmpVsToSpkVectorY, tmpVsToSpkVectorX );
		angle -= m_speakersTheta[aSpeakerIndex];
		angle = piWrap(angle);
		
		return angle;
		
	}
	
	bool isVirtualSourceOutside()
	{
		if (module(m_virtualSourceHorzPos, m_virtualSourceVertPos) >= m_referenceDistance)
			return true;
		else 
			return false;
	}
	
	~CircularWfs(){}
};


#endif