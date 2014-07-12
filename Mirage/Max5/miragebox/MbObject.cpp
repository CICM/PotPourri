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

#include "MbObject.h"

MbObject::MbObject(t_object* _mbPointer, t_object* _objectPointer, int _objectId)
{
    m_objectId = _objectId;
    m_mbPointer = _mbPointer;
    m_objectPointer = _objectPointer;
    m_scriptingname = jbox_get_varname((t_object*)m_objectPointer);
    m_classname     = object_classname(m_objectPointer);
    //outputCurrentValue();
}

MbObject::~MbObject()
{
}

void MbObject::set_mbPatchingRect(t_rect _pr)
{
    m_mb_patching_rect = _pr;
    m_mbDropAreaRect = m_mb_patching_rect;
    m_mbDropAreaRect.y += MENUBARSIZE;
    m_mbDropAreaRect.height -= MENUBARSIZE;
}

void MbObject::setObjectPointer(t_object* _objectPointer)
{
    m_objectPointer = _objectPointer;
}

void MbObject::notify(t_symbol *s, t_symbol *msg, void *data)
{
    post("msg : %s", msg->s_name);
    if ( msg == gensym("attr_modified") )
    {
        t_symbol *attrname = (t_symbol *)object_method((t_object *)data, gensym("getname"));
        t_atom    m_infos[2];
        atom_setobj(m_infos, m_objectPointer);
        
        // renvoie le patching_rect relatif à la miragebox
        if (attrname == gensym("patching_rect"))
        {
            long    temp_ac = 0;
            t_atom *temp_av = NULL;
            
            object_attr_getvalueof(m_objectPointer, attrname, &temp_ac, &temp_av);
            
            if (temp_ac && temp_av)
            {
                if (temp_ac >= 4)
                {
                    m_object_patching_rect.x = atom_getfloat(temp_av);
                    m_object_patching_rect.y = atom_getfloat(temp_av+1);
                    m_object_patching_rect.width = atom_getfloat(temp_av+2);
                    m_object_patching_rect.height = atom_getfloat(temp_av+3);
                    
                    m_mbrel_object_patching_rect = m_object_patching_rect;
                    m_mbrel_object_patching_rect.x -= m_mbDropAreaRect.x;
                    m_mbrel_object_patching_rect.y -= m_mbDropAreaRect.y;
                }
            }
        }
        
        atom_setsym(m_infos+1, attrname);
        object_notify(m_mbPointer, gensym("miragebox_attrchanged"), m_infos);
    }
    
    else if ( msg == gensym("modified") )
    {
        object_notify(m_mbPointer, gensym("miragebox_valuechanged"), m_objectPointer);
    }
    
    else if (msg == gensym("button_pressed"))
    {
        object_notify(m_mbPointer, gensym("miragebox_valuechanged_bang"), m_objectPointer);
        //post("bang");
    }
    //post("msg : %s", msg->s_name);
}

void MbObject::outputCurrentValue()
{
    long ac = 0;
    t_atom *av = NULL;
    object_getvalueof(m_objectPointer, &ac, &av);
    if (ac && av)
    {
        for (int i=0; i<ac; i++)
        {
            if (atom_gettype(av+i) == A_LONG)
            {
                post("La Valeur courante %i est un long : %ld", i, atom_getlong(av+i));
            }
            else if (atom_gettype(av+i) == A_FLOAT)
            {
                post("La Valeur courante %i est un float : %f", i, atom_getfloat(av+i));
            }
            else if (atom_gettype(av+i) == A_SYM)
            {
                post("La Valeur courante %i est un symbol : %s", i, atom_getsym(av+i)->s_name);
            }
        }
        freebytes(av, sizeof(t_atom) * ac);
    }
}

void MbObject::getValue(long *ac, t_atom **av)
{
    if (m_classname == gensym("button"))
    {
        *ac = 1;
        t_atom val[1];
        atom_setsym(val, gensym("bang"));
        *av = val;
    }
    else
    {
        object_getvalueof(m_objectPointer, ac, av);
    }
}

void MbObject::getAttrValue(t_symbol* attrname, long *ac, t_atom **av)
{
    // renvoie le patching_rect relatif à la miragebox
    if (attrname == gensym("patching_rect"))
    {
        //long temp_ac = 4;
        t_atom relRect[4];
        atom_setfloat(relRect, m_mbrel_object_patching_rect.x);
        atom_setfloat(relRect+1, m_mbrel_object_patching_rect.y);
        atom_setfloat(relRect+2, m_mbrel_object_patching_rect.width);
        atom_setfloat(relRect+3, m_mbrel_object_patching_rect.height);
        *ac = 4;
        *av = relRect;
    }
    else
    {
        object_attr_getvalueof(m_objectPointer, attrname, ac, av);
    }
}

void MbObject::sendMessageToObject(long ac, t_atom *av)
{
    // exemples :
    // setvalue 32 24
    // setattr  patching_rect 10. 10. 200. 50.
    
    if (atom_gettype(av) == A_SYM)
    {
        t_symbol *action = atom_getsym(av);
        if (action == gensym("setvalue"))
        {
            if (m_classname == gensym("button"))
            {
                object_method(m_objectPointer, gensym("bang"));
            }
            else
            {
                object_setvalueof(m_objectPointer, ac-1, av+1);
            }
        }
        else if (action == gensym("setattr"))
        {
            if ( (ac > 2) && atom_gettype(av+1) == A_SYM)
            {
                object_attr_setvalueof(m_objectPointer, atom_getsym(av+1), ac-2, av+2);
            }
            
        }
        else if (action == gensym("getvalue"))
        {
            object_notify(m_mbPointer, gensym("miragebox_valuerequest"), m_objectPointer);
        }
        else if (action == gensym("getattr"))
        {
            if ( atom_gettype(av+1) == A_SYM )
            {
                t_atom    m_infos[2];
                atom_setobj(m_infos, m_objectPointer);
                atom_setsym(m_infos+1, atom_getsym(av+1));
                object_notify(m_mbPointer, gensym("miragebox_attrrequest"), m_infos);
            }
        }
    }
}

void MbObject::sendMessageToObject(t_symbol* action, long ac, t_atom *av)
{
    // exemples :
    // action(/setvalue) av[0]=32 av[1]=24
    // action(/setattr)  av[0]="patching_rect" av[1]=10. [...]10. 200. 50.
    
    if (action == gensym("/setvalue"))
    {
        if (m_classname == gensym("button"))
        {
            object_method(m_objectPointer, gensym("bang"));
        }
        else
        {
            object_setvalueof(m_objectPointer, ac, av);
        }
    }
    else if (action == gensym("/setattr"))
    {
        if ( (ac > 1) && atom_gettype(av) == A_SYM)
        {
            object_attr_setvalueof(m_objectPointer, atom_getsym(av), ac-1, av+1);
        }
        
    }
    else if (action == gensym("/getvalue"))
    {
        object_notify(m_mbPointer, gensym("miragebox_valuerequest"), m_objectPointer);
    }
    else if (action == gensym("/getattr"))
    {
        if ( atom_gettype(av) == A_SYM )
        {
            t_atom    m_infos[2];
            atom_setobj(m_infos, m_objectPointer);
            atom_setsym(m_infos+1, atom_getsym(av));
            object_notify(m_mbPointer, gensym("miragebox_attrrequest"), m_infos);
        }
    }
}






