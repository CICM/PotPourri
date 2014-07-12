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

#ifndef __miragebox__MbObject__
#define __miragebox__MbObject__

#include "ProjectHeader.h"

#include <iostream>

class MbObject
{
    int m_objectId;
    t_object* m_mbPointer;
    t_object* m_objectPointer;
    t_symbol* m_scriptingname;
    t_symbol* m_classname;
    t_rect    m_mb_patching_rect;
    t_rect    m_mbDropAreaRect;
    t_rect    m_object_patching_rect;
    t_rect    m_mbrel_object_patching_rect;
public:
    MbObject(t_object* _mbPointer = NULL, t_object* _objectPointer = NULL, int _objectId = NULL);
    ~MbObject();
    
    void sendMessageToObject(long ac, t_atom *av);
    void sendMessageToObject(t_symbol* action, long ac, t_atom *av);
    
    inline int getObjId() {return m_objectId;}
    inline t_object* getObjPtr() {return m_objectPointer;}
    
    void set_mbPatchingRect(t_rect _pr);
    void setObjectPointer(t_object* _objectPointer);
    void notify(t_symbol *s, t_symbol *msg, void *data);
    void outputCurrentValue();
    void getValue(long *ac, t_atom **av);
    void getAttrValue(t_symbol* attrname, long *ac, t_atom **av);
    inline t_symbol* getClassName() {return m_classname;}
    inline std::string getClassNameStr() {return m_classname->s_name;}
};

#endif /* defined(__miragebox__MbObject__) */
