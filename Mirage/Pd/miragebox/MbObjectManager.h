
#ifndef __miragebox__MbObjectManager__
#define __miragebox__MbObjectManager__

extern "C"
{
#include "m_pd.h"

}

#include <iostream>
#include <map>

#include "MbObject.h"
#include "OscCom.h"

class MbObjectManager
{
    t_object *m_mbPointer; // miragebox object's pointer
    
    //t_object *mybox; // miragebox's wrapping box
  //  t_rect m_mbRect; // miragebox's rect
    
    std::map<t_gobj*, MbObject> m_objects;
    //std::map<long, MbObject> m_objects;
    //std::map<int, int> m_objects;
    
public:
    MbObjectManager(t_object* _mirageBoxObjectPointer);
    ~MbObjectManager();
    
    //void checkContent();
    int setObjectsDirty();                // PD
    void cleanObjects();                  // PD
    bool addObject(t_gobj* obj);          // PD
    bool removeObject(t_gobj* obj);       // PD
    
    /* setters */
//    void setRect(t_rect rect);
    
    /* getters */
    inline long getNumberOfObject() {return m_objects.size();}
    
    t_gobj* getObjectById(int _id);
    int getIdByObject(t_gobj* obj);
    MbObject getMbObjectByObject(t_gobj* obj);
    
    void setSocketOut(OscCom *socket);
    
private :
    OscCom *m_socketOut;
    int m_counter;
    
};

#endif /* defined(__miragebox__MbObjectManager__) */
