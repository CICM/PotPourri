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


/* ======= Notifications : (all notification have object reference passed in the "data" argument)
 - miragebox_boxadded           // new box added to the miragebox
 - miragebox_boxremoved         // box removed from the miragebox
 - miragebox_boxdropin          // box droped in the miragebox (mouse release) (object not yet registered in the miragebox) (followed by a miragebox_boxadded if possible)
 - miragebox_boxdropout         // box just leave the miragebox (mouse release) (object still registered in the miragebox) (followed by a miragebox_boxdropout)
 - miragebox_boxmovedin         // box moved inside the the miragebox (mouse release) (object registered in the miragebox)
 - miragebox_boxmovein          // box is moving inside the the miragebox (DONT KNOW if object registered OR NOT in the miragebox)
 - miragebox_boxenter           // box just enter in the miragebox (object not yet registered in the miragebox)
 - miragebox_boxleave           // box just leave the miragebox (object still registered in the miragebox)
 - miragebox_valuechanged       // a value have changed in a miragebox contained object
 - miragebox_attrchanged        // an attribute have changed in a miragebox contained object 
 ======= */

#include "MbObjectManager.h"

MbObjectManager::MbObjectManager(t_object* _mirageBoxObjectPointer)
{
    t_max_err err;
    m_mbPointer = _mirageBoxObjectPointer;
    err = object_obex_lookup(m_mbPointer, gensym("#P"), (t_object **)&m_patcher);
	if (err != MAX_ERR_NONE)
		object_error(m_mbPointer, "init error");
}

MbObjectManager::~MbObjectManager()
{
    // detach all objects
    for (std::map<t_object*,MbObject>::iterator it = m_objects.begin(); it != m_objects.end(); ++it)
        object_detach_byptr(m_mbPointer, it->first);
    m_objects.clear();
}

void MbObjectManager::setRect(t_rect rect)
{
    m_mbRect = rect;
    m_mbDropAreaRect = m_mbRect;
    m_mbDropAreaRect.y += MENUBARSIZE;
    m_mbDropAreaRect.height -= MENUBARSIZE;
    
    for (std::map<t_object*,MbObject>::iterator it = m_objects.begin(); it != m_objects.end(); ++it)
        m_objects.at(it->first).set_mbPatchingRect(m_mbRect);
}

void MbObjectManager::setPatcherview(t_object* _patcherview)
{
    m_patcherview = _patcherview;
}


void MbObjectManager::checkContent()
{
	t_object *jb;
	t_object *o;
	
	jb = jpatcher_get_firstobject(m_patcher); // get the first BOX in the object list
    
	while(jb)
    {
        o = jbox_get_object(jb); // get the box's object
        
        if (object_isInBoxRect(o) && !object_isInTheBox(o)) mb_addboxIfInside(o);
        else if (!object_isInBoxRect(o) && object_isInTheBox(o)) mb_removeboxIfInside(o);
        
		jb = jbox_get_nextobject(jb); // iterate
	}
    
    post("Miragebox contains %ld Objects !", getNumberOfObject());
}

void MbObjectManager::notify(t_symbol *s, t_symbol *msg, void *sender, void *data)
{
    //post("got %s message from %X (%s)", msg->s_name, sender, s->s_name);
	//t_symbol *name;
    
    if (sender == m_patcherview)
    {
        if (msg == gensym("attr_modified"))
        {
            t_symbol *attrname;
            attrname = (t_symbol *)object_method(data, gensym("getname"));
            //post("attrname : %s", attrname->s_name);
        }
        
        else if (msg == gensym("begintransaction"))
        {
            //post("begintransaction");
        }
        
        else if (msg == gensym("endtransaction"))
        {
            //post("endtransaction");
        }
        
        else if(msg == gensym("boxnotify_newobject"))
        {
            if (data)
            {
                mb_addboxIfInside((t_object*)data);
                //post("new %s object", object_classname((t_object*)data)->s_name);
            }
        }
        
        else if (msg == gensym("boxnotify_freeobject"))
        {
            if (data)
            {
                mb_removeboxIfInside((t_object*)data);
                //post("free %s object", object_classname((t_object*)data)->s_name);
            }
        }
        
        else if ( msg == gensym("startmoveboxes") )
        {
            //post("startmoveboxes");
            checkSelectedBoxes();
            //post("number of selected boxes = %ld", m_uiSelectedObjects.size());
            // attach all selected object (if not contained in the box)
            for (std::map<t_object*,SelObject>::iterator it = m_uiSelectedObjects.begin(); it != m_uiSelectedObjects.end(); ++it)
                if (m_objects.find(it->first) == m_objects.end()) object_attach_byptr_register(m_mbPointer, it->first, CLASS_BOX);
            //checkContent();
        }
        
        else if ( msg == gensym("endmoveboxes") )
        {
            //post("endmoveboxes");
            //post("number of selected boxes = %ld", m_uiSelectedObjects.size());
            for (std::map<t_object*,SelObject>::iterator it = m_uiSelectedObjects.begin(); it != m_uiSelectedObjects.end(); ++it)
            {
                t_object* o = (*it).first;
                
                if (m_uiSelectedObjects.at(o).isStartInside() && m_uiSelectedObjects.at(o).isInside()) {
                    //post("box move'in the mirabox");
                    object_notify(m_mbPointer, gensym("miragebox_boxmovedin"), o);
                }
                else if (!m_uiSelectedObjects.at(o).isStartInside() && m_uiSelectedObjects.at(o).isInside())
                {
                    //post("box drop in the mirabox");
                    object_notify(m_mbPointer, gensym("miragebox_boxdropin"), o);
                }
                else if (m_uiSelectedObjects.at(o).isStartInside() && !m_uiSelectedObjects.at(o).isInside())
                {
                    //post("box drop out the mirabox");
                    object_notify(m_mbPointer, gensym("miragebox_boxdropout"), o);
                }
                // no notify need for box moved outside of the miragebox context
                
                // detach all selected object (if not contained in the box) :
                if (m_objects.find(it->first) == m_objects.end()) object_detach_byptr(m_mbPointer, it->first);
            }
        }
    }
    else if (sender == m_mbPointer)
    {
        if ( msg == gensym("miragebox_boxdropin") )
        {
            mb_addboxIfInside((t_object*)data);
        }
        
        else if ( msg == gensym("miragebox_boxdropout") )
        {
            mb_removeboxIfInside((t_object*)data);
        }
    }
    else
    {
        t_object* o = (t_object*)sender;
        if ( (msg == _sym_attr_modified) && object_isInTheSelection(o) )
        {
            if ( (t_symbol *)object_method(data, gensym("getname")) == gensym("patching_rect") )
            {
                t_rect jr;
                jbox_get_patching_rect(o, &jr);
                // retrieve previous inside state (for testing purpose)
                bool wasInside = m_uiSelectedObjects.at(o).isInside();
                // update current inside state
                m_uiSelectedObjects.at(o).setInside( jgraphics_rectcontainsrect(&m_mbDropAreaRect, &jr) );
                
                if (wasInside && m_uiSelectedObjects.at(o).isInside()) {
                    //post("box move'in the mirabox");
                    object_notify(m_mbPointer, gensym("miragebox_boxmovein"), o);
                }
                else if (!wasInside && m_uiSelectedObjects.at(o).isInside())
                {
                    //post("box enter in the mirabox");
                    object_notify(m_mbPointer, gensym("miragebox_boxenter"), o);
                }
                else if (wasInside && !m_uiSelectedObjects.at(o).isInside())
                {
                    //post("box leave the mirabox");
                    object_notify(m_mbPointer, gensym("miragebox_boxleave"), o);
                }
                // no notify need for box moving outside of the miragebox context
            }
        }
        
        if (object_isInTheBox(o))
        {
            m_objects[o].notify(s, msg, data);
        }
    }
}

bool MbObjectManager::object_canBeAdded(t_object* o)
{
    return (class_is_ui(object_class(o)) && (o != m_mbPointer) && object_classname(o) != gensym("newobj"));
}

bool MbObjectManager::object_isInTheBox(t_object* o)
{
    return (m_objects.find(o) != m_objects.end());
}

bool MbObjectManager::object_isInTheSelection(t_object* o)
{
    return (m_uiSelectedObjects.find(o) != m_uiSelectedObjects.end());
}

bool MbObjectManager::object_isInBoxRect(t_object* o)
{
    t_rect jr;
    jbox_get_patching_rect(o, &jr);
    return ( jgraphics_rectcontainsrect(&m_mbDropAreaRect, &jr) );
}

bool MbObjectManager::mb_removeboxIfInside(t_object* o)
{
    if (object_isInTheBox(o)) {
        m_objects.erase(o);
        object_notify(m_mbPointer, gensym("miragebox_boxremoved"), o);
        object_detach_byptr(m_mbPointer, o);
        return true;
    }
    return false;
}

bool MbObjectManager::mb_addboxIfInside(t_object* o)
{
    if (object_canBeAdded(o))
    {
        t_rect jr;
        jbox_get_patching_rect(o, &jr);
        if ( jgraphics_rectcontainsrect(&m_mbDropAreaRect, &jr) && !object_isInTheBox(o) )
        {
            t_max_err err;
            err = object_attach_byptr_register(m_mbPointer, o, CLASS_BOX);
            if (err == MAX_ERR_NONE)
            {
                m_objects.insert(std::pair<t_object*,MbObject>(o, MbObject(m_mbPointer, o)));
                object_notify(m_mbPointer, gensym("miragebox_boxadded"), o);
                return true;
            }
            else
            {
                object_post(m_mbPointer, "miragebox can't use the %s object", object_classname(o)->s_name );
            }
        }
    }
    return false;
}

void MbObjectManager::checkSelectedBoxes()
{
    long numberOfSelectedBoxes = 0;
    t_atom *av = NULL;
    object_attr_getvalueof(m_patcherview, gensym("selectedboxes"), &numberOfSelectedBoxes, &av);
    if (numberOfSelectedBoxes && av)
    {
        t_object* o;
        m_uiSelectedObjects.clear();
        
        for (int i=0; i<numberOfSelectedBoxes; i++)
        {
            o = (t_object*) atom_getobj(av+i);
            if ( object_canBeAdded(o) )
            {
                t_rect jr;
                jbox_get_patching_rect(o, &jr);
                m_uiSelectedObjects.insert(std::pair<t_object*, SelObject>(o, SelObject(jgraphics_rectcontainsrect(&m_mbDropAreaRect, &jr)) ));
            }
        }
        freebytes(av, sizeof(t_atom) * numberOfSelectedBoxes);
    }
    else
    {
        m_uiSelectedObjects.clear();
    }
}

void MbObjectManager::getValue (t_object* o, long *ac, t_atom **av)
{
    if (object_isInTheBox(o)) m_objects.at(o).getValue(ac, av);
}

void MbObjectManager::getAttrValue(t_object* o, t_symbol* attrname, long *ac, t_atom **av)
{
    if (object_isInTheBox(o)) m_objects.at(o).getAttrValue(attrname, ac, av);
}

t_symbol* MbObjectManager::getClassName(t_object* o)
{
    return object_isInTheBox(o) ? m_objects.at(o).getClassName() : gensym("");
}

std::string MbObjectManager::getClassNameStr(t_object* o)
{
    std::string empty = "";
    return object_isInTheBox(o) ? m_objects.at(o).getClassNameStr() : empty;
}

void MbObjectManager::sendMessageToObject(t_object* o, long ac, t_atom *av)
{
    if (object_isInTheBox(o))
    {
        m_objects.at(o).sendMessageToObject(ac, av);
    }
}




