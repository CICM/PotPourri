//
//  MbObjectManager.cpp
//  miragebox
//
//  Created by eliott PARIS on 29/05/13.
//
//

#include "MbObjectManager.h"

MbObjectManager::MbObjectManager(t_object* _mirageBoxObjectPointer)
{
    m_mbPointer = _mirageBoxObjectPointer;
    m_counter=0;
}

MbObjectManager::~MbObjectManager()
{
    m_objects.clear();
}
/*
void MbObjectManager::setRect(t_rect rect)
{
    m_mbRect = rect;
}
*/

int  MbObjectManager::setObjectsDirty()
{
    int c=0;
    std::map<t_gobj*,MbObject>::iterator it;
    for( it = m_objects.begin(); it != m_objects.end(); it++)
    {
        c++;
        it->second.setNew(false);
    }
    return c;
    
}

void MbObjectManager::cleanObjects()
{
    std::map<t_gobj*,MbObject>::iterator it;
    for( it = m_objects.begin(); it != m_objects.end(); it++)
    {
        if (!it->second.isNew())
        {
            m_objects.erase(it);
            m_socketOut->removeObject(it->second.getObjectId());
        }
    }
    
}

bool MbObjectManager::addObject(t_gobj* obj)
{
    std::map<t_gobj*,MbObject>::iterator it;
    it = m_objects.find(obj);
    
    if (it != m_objects.end())
    {
        it->second.setNew(true);
        return false;
    }
    else
    {
        m_objects.insert(std::pair<t_gobj*,MbObject>(obj, MbObject(obj,m_counter++)));
        return true;
    }
    
}


bool MbObjectManager::removeObject(t_gobj* obj)
{
    std::map<t_gobj*,MbObject>::iterator it;
    it = m_objects.find(obj);
    
    if (it != m_objects.end())
    {
        m_objects.erase(obj);
        return true;
    }
    else
        return false;
    
}


t_gobj* MbObjectManager::getObjectById(int _id)
{
    std::map<t_gobj*,MbObject>::iterator it;
    for( it = m_objects.begin(); it != m_objects.end(); it++)
    {
        if (it->second.getObjectId()==_id) return it->first;
    }
    return NULL;
}

MbObject MbObjectManager::getMbObjectByObject(t_gobj* obj)
{
    std::map<t_gobj*,MbObject>::iterator it;
    for( it = m_objects.begin(); it != m_objects.end(); it++)
    {
        if (it->first==obj) return it->second;
    }
    return NULL;

    
}



int MbObjectManager::getIdByObject(t_gobj* obj)
{
    std::map<t_gobj*,MbObject>::iterator it;
    for( it = m_objects.begin(); it != m_objects.end(); it++)
    {
        if (it->first==obj) return it->second.getObjectId();
        
    }
    return -1;
}

void MbObjectManager::setSocketOut(OscCom *socket)
{
    m_socketOut=socket;
}

/*
void MbObjectManager::checkContent()
{
    t_object *jp;
	t_object *jb;
	t_object *mybox;
	t_object *o;
	//t_rect jr;
	//t_symbol *scriptingname;
	//t_max_err err;
    
    std::vector<t_object*> tempObjects;
    
	// get the object's parent patcher
	err = object_obex_lookup(m_mbPointer, gensym("#P"), (t_object **)&jp);
	if (err != MAX_ERR_NONE)
		return;
	
	// get the object's wrapping box
	err = object_obex_lookup(m_mbPointer, gensym("#B"), (t_object **)&mybox);
	if (err != MAX_ERR_NONE)
		return;
	
	jb = jpatcher_get_firstobject(jp); // get the first BOX in the object list
    
	while(jb) {
		jbox_get_patching_rect(jb, &jr); // x, y, width, height (double)
        
        o = jbox_get_object(jb); // get the box's object (b_firstin in Max4)
        
        if (jgraphics_rectcontainsrect(&m_mbRect, &jr) && (jb != mybox))
        {
            //object_post((t_object *)x, "found an object at %ld %ld, w %ld, h %ld", (long)jr.x, (long)jr.y, (long)jr.width, (long)jr.height);
            
            scriptingname = jbox_get_varname(jb); // scripting name
            if (scriptingname && scriptingname != gensym(""))
            {
                //object_post((t_object *)x, " it is named %s...", scriptingname->s_name);
            }
            
            //post(" it's a(n) %s object...", object_classname(o)->s_name);
            
            if( class_is_ui( object_class(o)) ) // it's a GUI object
            {
                std::map<t_object*,MbObject>::iterator it;
                it = m_objects.find(o);
                
                if (it != m_objects.end())
                {
                    post("y etait deja");
                }
                else
                {
                    post("est nouveau");
                    m_objects.insert(std::pair<t_object*,MbObject>(o, MbObject(o)));
                    //m_objects.push_back(o);
                    //m_objects.insert(std::pair<long,MbObject>(long(o), MbObject(o)));
                    //m_objects.insert(std::pair<int,int>(int(20), int(100)));
                }
                
                                
                long ac = 0;
                t_atom *av = NULL;
                object_getvalueof(o, &ac, &av);
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
                }
            }
        }
        else // l'objet n'est pas ou plus contenu dans la miragebox :
        {
            std::map<t_object*,MbObject>::iterator it;
            it = m_objects.find(o);
            if (it != m_objects.end()) {
                m_objects.erase(o);
            }
                    }
		
		jb = jbox_get_nextobject(jb); // iterate
	}
    
    post("Miragebox contains %ld Objects !", m_objects.size());
}
*/