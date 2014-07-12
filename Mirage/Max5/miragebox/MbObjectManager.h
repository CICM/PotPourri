/*
 * Miragebox : Ipad/max communicator
 *
 * Copyright (C) 2013 Eliott Paris, Manuel Deneu, Pierre Guillot, CICM, Universite Paris 8
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

#ifndef __miragebox__MbObjectManager__
#define __miragebox__MbObjectManager__

#include "ProjectHeader.h"

#include <iostream>
#include <map>
#include <vector.h>
#include "MbObject.h"

// shared variables
extern unsigned int mirageboxId;
extern unsigned int mirageboxObjectId;

// shared variables
//unsigned int mirageboxId = 0;
//unsigned int mirageboxObjectId = 0;

class SelObject
{
    bool m_startInside;
    bool m_isInside;
public:
    inline SelObject(bool isInside) {m_startInside = m_isInside = isInside;}
    inline ~SelObject() {;}
    inline bool isStartInside() {return m_startInside;}
    inline bool isInside() {return m_isInside;}
    inline void setInside(bool isInside) {m_isInside = isInside;}
};


class MbObjectManager
{
    int       m_mirageboxId;                            // the unique id of this miragebox in the patch
    t_object *m_mbPointer;                              // miragebox object's pointer
    t_rect m_mbRect;                                    // miragebox's rect
    t_rect m_mbDropAreaRect;                            // miragebox's droppable area rect
    t_object* m_patcher;                                // patcher object
    t_object* m_patcherview;                            // patcher view
    std::map<int, MbObject> m_objects;                  // (key : object id) objects contained by the miragebox
    std::map<t_object*, SelObject> m_uiSelectedObjects; // selected objects in patcher
    
public:
    //MbObjectManager(t_object* _mirageBoxObjectPointer, int* mirageboxObjectIdPointer);
    MbObjectManager(t_object* _mirageBoxObjectPointer, int _mirageboxUniqId);
    ~MbObjectManager();
    
    /**
     Tests if the Id correspond to a registered object in the miragebox, return the object pointer if true, NULL otherwise;
     @param 	int		The object Id. (positive only)
     @return            This function returns the object pointer if true, NULL otherwise
     */
    t_object* getObjPtrByObjId(int _objectId);
    
    /**
     Tests if the object is registered in the miragebox, return the object pointer if true, -1 otherwise
     @param 	t_object*  The object pointer
     @return               This function returns the object Id if true, int(-1) otherwise
     */
    int       getObjIdByObjPtr(t_object* o);
    
    void checkContent();
    bool object_canBeAdded(t_object* o);
    bool object_isInTheBox(t_object* o);
    bool object_isInTheBox(int _objectId);
    bool object_isInBoxRect(t_object* o);
    bool object_isInTheSelection(t_object* o);
    bool mb_removeboxIfInside(t_object* o);
    bool mb_addboxIfInside(t_object* o);
    void checkSelectedBoxes();
    void notify(t_symbol *s, t_symbol *msg, void *sender, void *data);
    
    void sendMessageToObject(t_object* o, long ac, t_atom *av);
    void sendMessageToObject(int objId, long ac, t_atom *av);
    void sendMessageToObject(t_symbol* action, long ac, t_atom *av);
    
    /* setters */
    void setRect(t_rect rect);
    void setPatcherview(t_object* _patcherview);
    
    /* getters */
    inline long getNumberOfObject() {return m_objects.size();}
    void getValue (t_object* o, long *ac, t_atom **av);
    void getValue (int objId, long *ac, t_atom **av);
    void getAttrValue (t_object* o, t_symbol* attrname, long *ac, t_atom **av);
    void getAttrValue (int objId, t_symbol* attrname, long *ac, t_atom **av);
    t_symbol* getClassName (t_object* o);
    t_symbol* getClassName (int objId);
    std::string getClassNameStr(t_object* o);
    std::string getClassNameStr(int objId);
};

#endif /* defined(__miragebox__MbObjectManager__) */
