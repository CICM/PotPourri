//
//  MbObject.cpp
//  miragebox
//
//  Created by eliott PARIS on 29/05/13.
//
//

#include "MbObject.h"

MbObject::MbObject(t_gobj* _objectPointer,int _objId)
{
    m_objectPointer = _objectPointer;
    m_isNew=true;
    m_objId=_objId;
    
    m_minValue=0.0;
    m_maxValue=1.0;
    
    
}

MbObject::~MbObject()
{
}

void MbObject::setObjectPointer(t_gobj* _objectPointer)
{
    m_objectPointer = _objectPointer;
}

bool MbObject::isNew() const
{
    return m_isNew;
}

void MbObject::setNew(bool state)
{
    m_isNew=state;
}

int MbObject::getObjectId() const
{
    return m_objId;
}

void  MbObject::setMinValue(float var)
{
    m_minValue=var;
}
float MbObject::getMinValue() const
{
    return m_minValue;
}

void  MbObject::setMaxValue(float var)
{
    m_maxValue=var;
}
float MbObject::getMaxValue() const
{
    return m_maxValue;
}