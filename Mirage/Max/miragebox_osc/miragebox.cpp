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

// shared variables
unsigned int mirageboxId = 0;
unsigned int mirageboxObjectId = 0;

#include "ProjectHeader.h"
#include "../../sources/CicmTools.h"

#include <sstream> //for std::stringstream
#include <string>  //for std::string
#include "MbObjectManager.h"
#include <vector.h>

#include "../../sources/OscCom.h"
#include "../../sources/osc/OscReceivedElements.h"
#include "../../sources/osc/OscOutboundPacketStream.h"

// 1024/732 => 1.4

enum orientation {
    LANDSCAPE = 0,
    PORTRAIT
};

typedef struct  _miragebox
{
	t_jbox		j_box;
	t_rect		rect;
    t_object	*a_patcher;			// pointer to our patcher
	t_object	*f_patcherview;		// pointer to our first patcherview
	t_pt		a_cached;
    
    // miragebox
    int         f_mirageboxId;
    OscCom*           osc;
    MbObjectManager*  mb;
    long        f_draw_menubar;
    long        f_draw_mbBorder;
    int         f_is_connected;
    
    // miragebox options
    t_symbol*   f_hostname;
    t_symbol*   f_title;
    long        f_port;
    long        f_device;
    long        f_orientation;
    
    // colors
	t_jrgba		f_colorBackground;
    t_jrgba		f_colorBorder;
    t_jrgba		f_mbBorderColor;

    // outlets
	void*		f_out;
    void*		f_outlet_infos;

} t_miragebox;

t_class *miragebox_class;

// general methods
void *miragebox_new(t_symbol *s, int argc, t_atom *argv);
void miragebox_free(t_miragebox *x);
void miragebox_getdrawparams(t_miragebox *x, t_object *patcherview, t_jboxdrawparams *params);
long miragebox_oksize(t_miragebox *x, t_rect *newrect);
void miragebox_assist(t_miragebox *x, void *b, long m, long a, char *s);
t_max_err miragebox_notify(t_miragebox *x, t_symbol *s, t_symbol *msg, void *sender, void *data);
void mirabox_attach(t_miragebox *x);

t_max_err miragebox_set_attr_title(t_miragebox *x, t_object *attr, long ac, t_atom *av);
t_max_err miragebox_set_attr_hostname(t_miragebox *x, t_object *attr, long ac, t_atom *av);
t_max_err miragebox_set_attr_port(t_miragebox *x, t_object *attr, long ac, t_atom *av);
t_max_err miragebox_set_attr_device(t_miragebox *x, t_object *attr, long ac, t_atom *av);
t_max_err miragebox_set_attr_orientation(t_miragebox *x, t_object *attr, long ac, t_atom *av);

// mouse/key methods
void miragebox_mouseleave(t_miragebox *x, t_object *patcherview, t_pt pt, long modifiers);
void miragebox_mouseenter(t_miragebox *x, t_object *patcherview, t_pt pt, long modifiers);
void miragebox_mousedown(t_miragebox *x, t_object *patcherview, t_pt pt, long modifiers);
void miragebox_mousedown2(t_miragebox *x, t_object *patcherview, t_pt pt, long modifiers);
void miragebox_mouseup(t_miragebox *x, t_object *patcherview, t_pt pt, long modifiers);
long miragebox_key(t_miragebox *x, t_object *patcherview, long keycode, long modifiers, long textcharacter);
void miragebox_mousemove(t_miragebox *x, t_object *patcherview, t_pt pt, long modifiers);
void miragebox_mousedrag(t_miragebox *x, t_object *patcherview, t_pt pt, long modifiers);
void miragebox_mousedoubleclick(t_miragebox *x, t_object *patcherview, t_pt pt, long modifiers);

// msg-in methods
void miragebox_bang(t_miragebox *x);
void miragebox_list(t_miragebox *x, t_symbol *s, short ac, t_atom *av);
void miragebox_anything(t_miragebox *x, t_symbol *s, short ac, t_atom *av);
void miragebox_float(t_miragebox *x, double f);
void miragebox_int(t_miragebox *x, long i);

// msg-out methods
void miragebox_output(t_miragebox *x);
void miragebox_valueChanged(t_miragebox *x, t_object* o);
void miragebox_notifyApp(t_miragebox *x, t_symbol* notifyMsg, void *data);

// paint methods
void miragebox_paint(t_miragebox *x, t_object *view);
void draw_background(t_miragebox *x, t_object *view, t_rect *rect);

// checkers
void miragebox_checkBoxInMe(t_miragebox *x);

// OSC
void mirabox_receiveOsc(t_object *o, osc::ReceivedMessage &m);

int C74_EXPORT main()
{
	t_class *c;
	
	c = class_new("miragebox", (method)miragebox_new, (method)miragebox_free, (short)sizeof(t_miragebox), 0L, A_GIMME, 0);
	
	c->c_flags |= CLASS_FLAG_NEWDICTIONARY;
	jbox_initclass(c, JBOX_COLOR | JBOX_FONTATTR);
	
	class_addmethod(c, (method) miragebox_assist,          "assist",        A_CANT,	0);
	class_addmethod(c, (method) miragebox_paint,           "paint",         A_CANT,	0);
	class_addmethod(c, (method) miragebox_getdrawparams,   "getdrawparams", A_CANT,   0);
	class_addmethod(c, (method) miragebox_notify,          "notify",        A_CANT,   0);
	class_addmethod(c, (method) miragebox_bang,            "bang",                 0L,0);
    class_addmethod(c, (method) miragebox_int,             "int",           A_LONG,  0);
    class_addmethod(c, (method) miragebox_float,           "float",         A_FLOAT,  0);
    class_addmethod(c, (method) miragebox_list,             "list",           A_GIMME,  0);
	class_addmethod(c, (method) miragebox_anything,        "anything",      A_GIMME,  0);
	class_addmethod(c, (method) miragebox_mousedown,       "mousedown",     A_CANT,   0);
	class_addmethod(c, (method) miragebox_mousedrag,       "mousedrag",     A_CANT,   0);
	class_addmethod(c, (method) miragebox_mouseup,         "mouseup",       A_CANT,   0);
	class_addmethod(c, (method) miragebox_mousemove,       "mousemove",     A_CANT,   0);
    class_addmethod(c, (method) miragebox_mousedoubleclick,"mousedoubleclick", A_CANT,0);
	class_addmethod(c, (method) miragebox_key,             "key",           A_CANT,   0);
    //class_addmethod(c, (method) miragebox_oksize,          "oksize",        A_CANT,   0);
    	
	CLASS_ATTR_DEFAULT			(c, "patching_rect", 0, "0 0 300 300");
	
	CLASS_ATTR_INVISIBLE		(c, "color", 0);
	CLASS_ATTR_INVISIBLE		(c, "textcolor", 0);
	
    CLASS_STICKY_CATEGORY(c, 0, "Color");
	CLASS_ATTR_RGBA				(c, "bgcolor", 0, t_miragebox, f_colorBackground);
	CLASS_ATTR_STYLE			(c, "bgcolor", 0, "rgba");
	CLASS_ATTR_LABEL			(c, "bgcolor", 0, "Background Color");
	CLASS_ATTR_ORDER			(c, "bgcolor", 0, "1");
	CLASS_ATTR_DEFAULT_SAVE_PAINT(c, "bgcolor", 0, "0.96 0.96 0.96 1.");
    
    CLASS_ATTR_RGBA				(c, "bordercolor", 0, t_miragebox, f_colorBorder);
	CLASS_ATTR_STYLE			(c, "bordercolor", 0, "rgba");
	CLASS_ATTR_LABEL			(c, "bordercolor", 0, "Border Color");
	CLASS_ATTR_ORDER			(c, "bordercolor", 0, "2");
	CLASS_ATTR_DEFAULT_SAVE_PAINT(c, "bordercolor", 0, "0.8 0.8 0.8 1.");
    
    CLASS_ATTR_RGBA				(c, "mbbordercolor", 0, t_miragebox, f_mbBorderColor);
	CLASS_ATTR_STYLE			(c, "mbbordercolor", 0, "rgba");
	CLASS_ATTR_LABEL			(c, "mbbordercolor", 0, "Border Color");
	CLASS_ATTR_ORDER			(c, "mbbordercolor", 0, "3");
	CLASS_ATTR_DEFAULT_SAVE_PAINT(c, "mbbordercolor", 0, "0.2 0.2 0.2 1.");
    CLASS_STICKY_CATEGORY_CLEAR(c);
    
    CLASS_STICKY_CATEGORY (c, 0, "Miragebox");
    CLASS_ATTR_SYM              (c, "title", 0, t_miragebox, f_title);
    CLASS_ATTR_ACCESSORS        (c, "title", (method)NULL, miragebox_set_attr_title);
    CLASS_ATTR_ORDER			(c, "title", 0, "1");
    CLASS_ATTR_LABEL			(c, "title", 0, "Title");
    CLASS_ATTR_DEFAULT_SAVE     (c, "title", 0, "");
    
    CLASS_ATTR_SYM              (c, "hostname", 0, t_miragebox, f_hostname);
    CLASS_ATTR_ACCESSORS        (c, "hostname", (method)NULL, miragebox_set_attr_hostname);
    CLASS_ATTR_LABEL			(c, "hostname", 0, "Host Name");
    CLASS_ATTR_ORDER			(c, "hostname", 0, "2");
    CLASS_ATTR_DEFAULT_SAVE     (c, "hostname", 0, "localhost");
    
    CLASS_ATTR_LONG             (c, "port", 0, t_miragebox, f_port);
    CLASS_ATTR_ACCESSORS        (c, "port", (method)NULL, miragebox_set_attr_port);
    CLASS_ATTR_LABEL			(c, "port", 0, "Port");
    CLASS_ATTR_ORDER			(c, "port", 0, "3");
    CLASS_ATTR_DEFAULT_SAVE     (c, "port", 0, "7400");
    
    CLASS_ATTR_LONG             (c, "device", 0, t_miragebox, f_device);
    CLASS_ATTR_ACCESSORS        (c, "device", (method)NULL, miragebox_set_attr_device);
    CLASS_ATTR_LABEL			(c, "device", 0, "Device");
    CLASS_ATTR_ENUMINDEX2       (c, "device", 0, "Ipad", "Iphone");
    CLASS_ATTR_ORDER			(c, "device", 0, "4");
    CLASS_ATTR_DEFAULT_SAVE_PAINT(c, "device", 0, "0");
    
    CLASS_ATTR_LONG             (c, "orientation", 0, t_miragebox, f_orientation);
    CLASS_ATTR_ACCESSORS        (c, "orientation", (method)NULL, miragebox_set_attr_orientation);
    CLASS_ATTR_LABEL			(c, "orientation", 0, "Orientation");
    CLASS_ATTR_ENUMINDEX2       (c, "orientation", 0, "Landscape", "Portrait");
    CLASS_ATTR_ORDER			(c, "orientation", 0, "5");
    CLASS_ATTR_DEFAULT_SAVE_PAINT(c, "orientation", 0, "0");
    CLASS_STICKY_CATEGORY_CLEAR(c);
	
	class_register(CLASS_BOX, c);
	miragebox_class = c;
    post("miragebox object version Beta 0.1 - 2013");
	return 0;
}

void *miragebox_new(t_symbol *s, int argc, t_atom *argv)
{
	t_miragebox *x =  NULL; 
	t_dictionary *d;
	long flags;
	
	if (!(d = object_dictionaryarg(argc,argv)))
		return NULL;
	
	x = (t_miragebox *)object_alloc(miragebox_class);
    if (x)
    {
        flags = 0
        | JBOX_DRAWFIRSTIN
        | JBOX_DRAWINLAST
        | JBOX_TRANSPARENT
        | JBOX_DRAWBACKGROUND
        | JBOX_GROWBOTH
        | JBOX_HILITE
        ;
        jbox_new(&x->j_box, flags, argc, argv);
        x->j_box.b_firstin = (t_object*) x;
        
        x->f_draw_menubar = 1;
        
        x->f_out = outlet_new(x, NULL);
        
        x->f_mirageboxId = mirageboxId++;
        //post("mirageboxId %i", x->f_mirageboxId);
        
        x->mb = new MbObjectManager((t_object*) x, x->f_mirageboxId);
        //x->osc = new OscCom((t_object*) x, 8032, 1234);
        //x->osc->callBackFunction = (CicmMethod)mirabox_receiveOsc;
        
        attr_dictionary_process(x, d);
        
        // Get a pointer to our patcher
        object_obex_lookup(x, gensym("#P"), &x->a_patcher);
        
        // The patcherview is not available when the object is created as a patcher is being read from disk,
        // so we have to defer to wait for it before getting it and attaching for notifications.
        defer_low(x, (method)mirabox_attach, NULL, 0, NULL);
        
        jbox_ready(&x->j_box);
        jbox_set_background((t_object *)x, 1);
    }
	return (x);
}

void mirabox_receiveOsc(t_object *o, osc::ReceivedMessage &m)
{
    post("mirabox_receiveOsc");
    post("add+method : %s", m.AddressPattern());
}

void mirabox_attach(t_miragebox *x)
{
	x->f_patcherview = object_attr_getobj(x->a_patcher, gensym("firstview"));
	object_attach_byptr_register(x, x->f_patcherview, CLASS_NOBOX);
    x->mb->setPatcherview(x->f_patcherview);
    x->mb->checkContent();
}

void miragebox_getdrawparams(t_miragebox *x, t_object *patcherview, t_jboxdrawparams *params)
{
	params->d_borderthickness = 1;
	params->d_cornersize = 4;
    params->d_bordercolor = x->f_colorBorder;
    params->d_boxfillcolor = x->f_colorBackground;
}

void miragebox_free(t_miragebox *x)
{
	jbox_free(&x->j_box);
    delete x->mb;
}

void miragebox_assist(t_miragebox *x, void *b, long m, long a, char *s)
{
	if (m == ASSIST_INLET) {
		sprintf(s,"nothing yet");
	} else {
		if (a == 0) {
			sprintf(s,"nothing yet");
		}
		else if (a == 1) {
			sprintf(s,"nothing yet");
		}
	}
}

t_max_err miragebox_set_attr_title(t_miragebox *x, t_object *attr, long ac, t_atom *av)
{
    if (ac && av) {
        if (atom_gettype(av) == A_SYM) {
            x->f_title = atom_getsym(av);
        }
    }
    return MAX_ERR_NONE;
}

t_max_err miragebox_set_attr_hostname(t_miragebox *x, t_object *attr, long ac, t_atom *av)
{
    if (ac && av) {
        if (atom_gettype(av) == A_SYM) {
            x->f_hostname = atom_getsym(av);
        }
    }
    return MAX_ERR_NONE;
}

t_max_err miragebox_set_attr_port(t_miragebox *x, t_object *attr, long ac, t_atom *av)
{
    if (ac && av) {
        if (atom_gettype(av) == A_LONG || atom_gettype(av) == A_FLOAT) {
            x->f_port = atom_getlong(av);
        }
    }
    return MAX_ERR_NONE;
}

t_max_err miragebox_set_attr_orientation(t_miragebox *x, t_object *attr, long ac, t_atom *av)
{
    if (ac && av) {
        if (atom_gettype(av) == A_LONG || atom_gettype(av) == A_FLOAT) {
            x->f_orientation = atom_getlong(av) == 1 ? 1 : 0;
            t_rect presRect;
            jbox_get_presentation_rect((t_object*)x, &presRect);
            if (x->f_orientation == LANDSCAPE)
            {
                presRect.width = long(presRect.height * 1.4);
            }
            else if (x->f_orientation == PORTRAIT)
            {
                presRect.width = long(presRect.height / 1.4);
            }
            jbox_set_presentation_rect((t_object*)x, &presRect);
        }
    }
    return MAX_ERR_NONE;
}

t_max_err miragebox_set_attr_device(t_miragebox *x, t_object *attr, long ac, t_atom *av)
{
    if (ac && av) {
        if (atom_gettype(av) == A_LONG || atom_gettype(av) == A_FLOAT) {
            x->f_device = atom_getlong(av);
        }
    }
    return MAX_ERR_NONE;
}

long miragebox_oksize(t_miragebox *x, t_rect *newrect)
{
    //long presentation = jpatcher_get_presentation(jbox_get_patcher((t_object*)x));
    /*
    long presentation = 1;
    if (presentation) {
        t_rect presRect;
        jbox_get_presentation_rect((t_object*)x, &presRect);
        if (x->f_orientation == LANDSCAPE)
        {
            newrect->width = long(presRect.height * 1.4);
        }
        else if (x->f_orientation == PORTRAIT)
        {
            newrect->width = long(presRect.height / 1.4);
        }
    }
    */
    return 0;
}


void miragebox_list(t_miragebox *x, t_symbol *s, short ac, t_atom *av)
{
    post("list %s", s->s_name);
    //post("list %s", atom_getsym(av)->s_name);
    if (ac && av) {
        if (atom_gettype(av) == A_LONG)
        {
            if ( (t_object*)(atom_getlong(av)) == (t_object*)x )
            {
                if ( (ac >= 3) && atom_gettype(av+1) == A_LONG)
                {
                    x->mb->sendMessageToObject( (t_object*)atom_getlong(av+1), ac-2, av+2 );
                }
            }
        }
    }
}


void miragebox_float(t_miragebox *x, double f)
{
    
}

void miragebox_int(t_miragebox *x, long i)
{
	//post("%ld", i);
    //t_object *o = (t_object*)i;
    //t_object *o = (t_object*)i;
    //post("objectclass : %s", object_classname(o)->s_name);
}

void miragebox_anything(t_miragebox *x, t_symbol *s, short ac, t_atom *av)
{
    post("anything %s", s->s_name);
    char *input = s->s_name;
    // ex of message :
    // /getvalue 1 1
    // /getattr  1 1 minimum
    if (input[0] == '/')
    {
        t_symbol* action = s;
        
        if (ac && av)
        {
            if ( (atom_gettype(av) == A_LONG) && (atom_getlong(av) == x->f_mirageboxId) )
            {
                x->mb->sendMessageToObject(action, ac-1, av+1);
            }
        }
    }
}

/*
void miragebox_anything(t_miragebox *x, t_symbol *s, short ac, t_atom *av)
{
    //post("anything %s", s->s_name);
    std::string input = s->s_name;
    if (input[0] == '/')
    {
        long argc = 0;
        t_atom *argv = NULL;
        
        input.erase(input.begin()); // remove first slash
        std::replace(input.begin(), input.end(), '/', ' '); // replace other slash by a space
        
        atom_setparse(&argc, &argv, input.c_str());
        
        if (argc && argv)
        {
            if (atom_gettype(argv) == A_LONG)
            {
                if ( (t_object*)(atom_getlong(argv)) == (t_object*)x )
                {
                    if ( (argc >= 3) && atom_gettype(argv+1) == A_LONG)
                    {
                        x->mb->sendMessageToObject( (t_object*)atom_getlong(argv+1), argc-2, argv+2 );
                    }
                }
            }
            sysmem_freeptr(argv);
        }
        //post("stringreplaced %s", input.c_str());
    }
}
*/

//========================= Output Methods :

void test(t_object *x, long aLong, t_symbol* aString)
{
    post("hey dzdzdz %ld, %s", aLong, aString->s_name);
}

void miragebox_bang(t_miragebox *x)
{
    x->osc->removeAllObjects();
    
    //x->mb->checkContent();
    //CicmMethod testing = (CicmMethod)test;
    //testing(x, 666, gensym("devil in the machine"));
}

void miragebox_notifyApp(t_miragebox *x, t_symbol* notifyMsg, void *data)
{
    long ac = 0;
    t_atom *av = NULL;
    
    if (notifyMsg == gensym("newobject"))
    {
        int objectId = x->mb->getObjIdByObjPtr((t_object*)data);
        short ac_out = 3;
        t_atom av_out[ac_out];
        atom_setlong(av_out, x->f_mirageboxId);
        atom_setsym(av_out+1, x->mb->getClassName(objectId));
        atom_setlong(av_out+2, objectId);
        outlet_anything(x->f_out, gensym("/newobject"), ac_out, av_out);
    }
    
    else if (notifyMsg == gensym("freeobject"))
    {
        int objectId = x->mb->getObjIdByObjPtr((t_object*)data);
        short ac_out = 2;
        t_atom av_out[ac_out];
        atom_setlong(av_out, x->f_mirageboxId);
        atom_setlong(av_out+1, objectId);
        outlet_anything(x->f_out, gensym("/freeobject"), ac_out, av_out);
    }
    
    /*
    else if (notifyMsg == gensym("setvalue"))
    {
        t_object *objectPointer = (t_object*)data;
        x->mb->getValue(objectPointer, &ac, &av);
        if (ac && av)
        {
            //osc::OutboundPacketStream msg;
            
        }
    }
    */
    
    else if (notifyMsg == gensym("setvalue"))
    {
        int objectId = x->mb->getObjIdByObjPtr((t_object*)data);
        x->mb->getValue(objectId, &ac, &av);
        if (ac && av)
        {
            short acOffset = 2;
            short ac_out = ac + acOffset;
            t_atom av_out[ac_out];
            
            atom_setlong(av_out, x->f_mirageboxId);
            atom_setlong(av_out+1, objectId);
            atom_setatom_array(ac, av_out + acOffset, ac, av);
            /*
            for (int i=0; i<ac_out; i++)
            {
                if (atom_gettype(av+i) == A_LONG) atom_setlong(av_out+i+acOffset, atom_getlong(av+i));
                else if (atom_gettype(av+i) == A_FLOAT) atom_setfloat(av_out+i+acOffset, atom_getfloat(av+i));
                else if (atom_gettype(av+i) == A_SYM) atom_setsym(av_out+i+acOffset, atom_getsym(av+i));
                else if (atom_gettype(av+i) == A_OBJ) atom_setobj(av_out+i+acOffset, atom_getobj(av+i));
            }
            */
            outlet_anything(x->f_out, gensym("/setvalue"), ac_out, av_out);
        }
    }
    
    else if (notifyMsg == gensym("setattr"))
    {
        // data[2] : atom[0] = (obj)objPtr | atom[2] = (sym)attrname
        t_atom   *infos = (t_atom*)data;
        int       objectId = x->mb->getObjIdByObjPtr((t_object*)atom_getobj(infos));
        t_symbol *attrname = atom_getsym(infos+1);
        x->mb->getAttrValue(objectId, attrname, &ac, &av);
        if (ac && av)
        {
            short acOffset = 3;
            short ac_out = ac + acOffset;
            t_atom av_out[ac_out];
            
            atom_setlong(av_out, x->f_mirageboxId);
            atom_setlong(av_out+1, objectId);
            atom_setsym(av_out+2, attrname);
            atom_setatom_array(ac, av_out + acOffset, ac, av);
            outlet_anything(x->f_out, gensym("/setattr"), ac_out, av_out);
        }
    }
    
    else if (notifyMsg == gensym("mb_setattr"))
    {
        t_symbol* attrname = (t_symbol *)data;
        object_attr_getvalueof(x, attrname, &ac, &av);
        
        if (ac && av)
        {
            short acOffset = 2;
            short ac_out = ac + acOffset;
            t_atom av_out[ac_out];
            
            atom_setlong(av_out, x->f_mirageboxId);
            atom_setsym(av_out+1, attrname);
            atom_setatom_array(ac, av_out + acOffset, ac, av);
            outlet_anything(x->f_out, gensym("/mb_setattr"), ac_out, av_out);
        }
        
        /*
        if (attrname == gensym("patching_rect"))
        {
            ;
        }
        else if (attrname == gensym("title"))
        {
            ;
        }
        */
    }
    
    if (ac && av) freebytes(av, sizeof(t_atom) * ac);
}

void miragebox_output(t_miragebox *x)
{
    
}

//========================= Notify Methods :

t_max_err miragebox_notify(t_miragebox *x, t_symbol *s, t_symbol *msg, void *sender, void *data)
{
    x->mb->notify(s, msg, sender, data);
    if (sender == x)
    {
        if (msg == gensym("miragebox_boxadded"))
        {
            miragebox_notifyApp(x, gensym("newobject"), data);
        }
        else if (msg == gensym("miragebox_boxremoved"))
        {
            miragebox_notifyApp(x, gensym("freeobject"), data);
        }
        else if (msg == gensym("miragebox_valuechanged") || msg == gensym("miragebox_valuerequest") || msg == gensym("miragebox_valuechanged_bang"))
        {
            miragebox_notifyApp(x, gensym("setvalue"), data);
        }
        else if (msg == gensym("miragebox_attrchanged") || msg == gensym("miragebox_attrrequest"))
        {
            miragebox_notifyApp(x, gensym("setattr"), data);
        }
        else if (msg == gensym("miragebox_boxmovein"))
        {
            x->f_draw_mbBorder = 1;
            jbox_invalidate_layer((t_object *)x, NULL, gensym("background_layer"));
            jbox_redraw((t_jbox*)x);
        }
        else if (msg == gensym("miragebox_boxleave"))
        {
            x->f_draw_mbBorder = 0;
            jbox_invalidate_layer((t_object *)x, NULL, gensym("background_layer"));
            jbox_redraw((t_jbox*)x);
        }
        
        if (msg == _sym_attr_modified)
        {
            t_symbol *name = (t_symbol *)object_method((t_object *)data, gensym("getname"));
            if(name == gensym("bgcolor") || name == gensym("bordercolor"))
            {
                jbox_invalidate_layer((t_object *)x, NULL, gensym("background_layer"));
                jbox_redraw((t_jbox*)x);
            }
            else if (name == gensym("title") || name == gensym("patching_rect") )
            {
                miragebox_notifyApp(x, gensym("mb_setattr"), name);
            }
        }
    }
    if (msg == gensym("endtransaction"))
    {
        x->f_draw_mbBorder = 0;
        jbox_invalidate_layer((t_object *)x, NULL, gensym("background_layer"));
        jbox_redraw((t_jbox*)x);
    }
	return jbox_notify((t_jbox *)x, s, msg, sender, data);
}

//========================= Paint Methods :

void miragebox_paint(t_miragebox *x, t_object *view)
{
	t_rect rect;
	jbox_get_rect_for_view((t_object *)x, view, &rect);
	x->rect = rect;
    x->mb->setRect(rect);
	draw_background(x, view, &rect);
}

void draw_background(t_miragebox *x,  t_object *view, t_rect *rect)
{
    long mbBorderPadding = 5;
    t_rect mbBorder;
    mbBorder.x = mbBorderPadding;
    mbBorder.y = mbBorderPadding + (MENUBARSIZE);
    mbBorder.width = x->rect.width - long(mbBorderPadding*2);
    mbBorder.height = x->rect.height - long(mbBorderPadding*2) - (MENUBARSIZE);
    
    t_jrgba grey = {0.45, 0.45, 0.45, 1.};
    t_jrgba red = {0.8, 0., 0., 1.};
    t_jrgba green = {0., 0.8, 0., 1.};
    
	t_jgraphics *g = jbox_start_layer((t_object *)x, view, gensym("background_layer"), rect->width, rect->height);
	
	if (g)
    {
        if (x->f_draw_mbBorder == 1)
        {
            jgraphics_set_source_jrgba(g, &x->f_mbBorderColor);
            jgraphics_rectangle(g, mbBorder.x, mbBorder.y, mbBorder.width, mbBorder.height);
            jgraphics_set_line_width(g, mbBorderPadding);
            jgraphics_stroke(g);
        }
        
        if (x->f_draw_menubar == 1)
        {
            // menubar bg :
            jgraphics_set_source_jrgba(g, &x->f_colorBorder);
            jgraphics_rectangle(g, 1, 1, x->rect.width-2, MENUBARSIZE);
            jgraphics_fill(g);
            
            // menubar bg :
            jgraphics_set_source_jrgba(g, &grey);
            jgraphics_line_draw_fast(g, 1, MENUBARSIZE+1, x->rect.width-1, MENUBARSIZE+1, 0.5);
            
            // menubar connected :
            jgraphics_set_source_jrgba(g, x->f_is_connected ? &green : &red);
            jgraphics_arc(g, x->rect.width-(MENUBARSIZE*0.5+1), (MENUBARSIZE*0.5+1), (MENUBARSIZE*0.25), 0, JGRAPHICS_2PI);
            jgraphics_fill(g);
            
            jgraphics_set_source_jrgba(g, &grey);
            jgraphics_arc(g, x->rect.width-(MENUBARSIZE*0.5+1), (MENUBARSIZE*0.5+1), (MENUBARSIZE*0.25+2), 0, JGRAPHICS_2PI);
            jgraphics_set_line_width(g, 1);
            jgraphics_stroke(g);
            
            jgraphics_move_to(g, 5, 15);
            jgraphics_show_text(g, x->f_title->s_name);
        }
        
		jbox_end_layer((t_object*)x, view, gensym("background_layer"));
	}
	jbox_paint_layer((t_object *)x, view, gensym("background_layer"), 0., 0.);
}

//========================= Mouse Methods :

void miragebox_mouseenter(t_miragebox *x, t_object *patcherview, t_pt pt, long modifiers)
{
	//post("mouseenter");
}

void miragebox_mouseleave(t_miragebox *x, t_object *patcherview, t_pt pt, long modifiers)
{
	//post("mouseleave");
}

void miragebox_mousedown(t_miragebox *x, t_object *patcherview, t_pt pt, long modifiers)
{    
    //-- modifiers :
    //post("modifiers : %ld", modifiers);
    // 16 : rien
    // 17 : cmd
    // 18 : shift
    // 148: ctrl
    // 19 : cmd+shift
    //post("mousedown");
}

void miragebox_mousedrag(t_miragebox *x, t_object *patcherview, t_pt pt, long modifiers)
{
    //post("mousedrag");
}

void miragebox_mouseup(t_miragebox *x, t_object *patcherview, t_pt pt, long modifiers)
{
    ;   
}

void miragebox_mousemove(t_miragebox *x, t_object *patcherview, t_pt pt, long modifiers)
{
    //post("mousemove");
}

void miragebox_mousedoubleclick(t_miragebox *x, t_object *patcherview, t_pt pt, long modifiers)
{
    ;
}

long miragebox_key(t_miragebox *x, t_object *patcherview, long keycode, long modifiers, long textcharacter)
{	
	//post("keycode : %ld , modifiers : %ld , textcharacter : %ld ", keycode, modifiers, textcharacter);
    int filter = 0;
	if (keycode == 97 && modifiers == 1 && textcharacter == 0) // cmd+a -> select all;
    {
        //filter = 1;
	}
	return filter;	// returns 1 if you want to filter it from the key object (otherwise return 0)
}