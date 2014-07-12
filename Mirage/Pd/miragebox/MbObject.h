//
//  MbObject.h
//  miragebox
//
//  Created by eliott PARIS on 29/05/13.
//
//

#ifndef __miragebox__MbObject__
#define __miragebox__MbObject__

#include <iostream>

extern "C"
{
#include "m_pd.h"
}

class MbObject
{
    t_gobj* m_objectPointer;
    bool m_isNew;
    int m_objId;
    
    // values
    float m_minValue;
    float m_maxValue;
    
public:
    MbObject(t_gobj* _objectPointer = NULL, int _objId=0);
    ~MbObject();
    
    void setObjectPointer(t_gobj* _objectPointer);

    bool isNew() const;
    void setNew(bool state);
    
    int getObjectId() const;
    
    
    // values
    void  setMinValue(float var);
    float getMinValue() const;
    
    void  setMaxValue(float var);
    float getMaxValue() const;
    

};

#endif /* defined(__miragebox__MbObject__) */
