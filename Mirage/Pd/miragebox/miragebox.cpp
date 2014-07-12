

#include <stdio.h>
#include "MbObjectManager.h"




// OSC STUFF
#include "../../sources/OscCom.h"
#include "../../sources/osc/OscReceivedElements.h"




extern "C"
{

#include "m_pd.h"
#include "g_canvas.h"
#include "m_imp.h"
#include "s_stuff.h"
#include "g_all_guis.h"
}




using namespace std;


class Service;
class OscDumpPacketListener;

typedef struct miragebox
{
    t_object x_obj;
    t_canvas *x_canvas;
    MbObjectManager*  mb;

    // socket out
    OscCom *oscSocket;
    int mirageBoxId;
        


    

} t_miragebox;

int counto=0;
int mirageBoxIdCounter=0;


void *miragebox_new(t_symbol *s, long argc, t_atom *argv);
void miragebox_free(t_miragebox *x);
void miragebox_bang(t_miragebox *x);
void miragebox_processOsc(t_miragebox *x,osc::ReceivedMessage m);

void miragebox_service_poll(t_miragebox *x);
void miragebox_servicePublished(t_miragebox *x);
static void miragebox_canvasListener(int var);
static void miragebox_notif(t_object *x,osc::ReceivedMessage &m);
static void patchDirty(t_miragebox *x, int sockfd);



/* ********************************************************************* */




/* ********************************************************************* */





static t_class *Miragebox_class;
////////////////////////////////////////////////////////////////
//
//      Canvas communication
//
////////////////////////////////////////////////////////////////
static void miragebox_canvasListener(int var)
{
    post("from canvas %i",var);
}

////////////////////////////////////////////////////////////////
//
//      Bonjour 
//
////////////////////////////////////////////////////////////////
static void miragebox_tick(t_miragebox *x)
{

    post("tick");
    //clock_delay(x->clock, 1000);
}

void miragebox_servicePublished(t_miragebox *x)
{
    post("service published");
    //if (x->mpService->getDNSServiceRef()) post("dns ok %i",var);
   
//    x->mpService->startMonitoring();




    
}
void miragebox_service_poll(t_miragebox *x)
{
    /*
    post("on time");
    if(x->mpService && x->mpService->getDNSServiceRef())
	{
		DNSServiceErrorType err = kDNSServiceErr_NoError;
		if(NetServiceThread::poll(x->mpService->getDNSServiceRef(), 0.001, err))
		{
			if(err > 0)
			{
				x->mpService->stop();
				post("error %d", err);
			}
		}
		else
		{
			if(x->mpService && x->mpService->getDNSServiceRef()) // we check again, because it might have change in reaction to a callback
			{
                //clock_delay(x->clock, 1000);
				//schedule_defer(x, (method)zeroconf_service_poll, 1000, NULL, 0, NULL); // reschedule in 1 sec
			}
		}
	}
*/
    //clock_delay(x->clock, 1000);
}

////////////////////////////////////////////////////////////////
//
//      Object
//
////////////////////////////////////////////////////////////////
static void miragebox_notif(t_object *x,osc::ReceivedMessage &m)
{
    t_miragebox *obj=(t_miragebox*) x;
    
    post("osc %i",counto);
    counto++;
   // post("addr : %s",m.AddressPattern());
    miragebox_processOsc(obj, m);
}


void miragebox_processOsc(t_miragebox *x,osc::ReceivedMessage m)
{
    
    

   // post(m.AddressPattern());
/*      
    try{
        // example of parsing single messages. osc::OsckPacketListener
        // handles the bundle traversal.
        
        if( strcmp( m.AddressPattern(), "/mira/val" ) == 0 )
        {
            // example #1 -- argument stream interface
            osc::ReceivedMessage::const_iterator arg = m.ArgumentsBegin();
            int a1=(arg++)->AsInt32();
            float a2 = (arg++)->AsFloat();
            //float a3 = (arg++)->AsFloat();
            if( arg != m.ArgumentsEnd() )
                throw osc::ExcessArgumentException();
            
            post("test1 %i %f",a1,a2);
            
            t_gobj *remote;
            if ((remote=x->mb->getObjectById(a1)))
            {
                post("obj found");
                pd_float(&remote->g_pd, a2);
                
            }
        }
        
        
        else if( strcmp( m.AddressPattern(), "/mira/test2" ) == 0 )
        {
            // example #2 -- argument iterator interface, supports
            // reflection for overloaded messages (eg you can call
            // (*arg)->IsBool() to check if a bool was passed etc).
            osc::ReceivedMessage::const_iterator arg = m.ArgumentsBegin();
            int a1=(arg++)->AsInt32();
            float a2 = (arg++)->AsFloat();
            //float a3 = (arg++)->AsFloat();
            if( arg != m.ArgumentsEnd() )
                throw osc::ExcessArgumentException();
            
            post("test2 %f %f",a2,a2);
           
        }
    }
    catch( osc::Exception& e )
    {
        // any parsing errors such as unexpected argument types, or
        // missing arguments get thrown as exceptions.
        post ("error while parsing message: ");
//        << m.AddressPattern() << ": " << e.what() << "\n";
    }
    
    */
  
}


void miragebox_bang(t_miragebox *x)
{
 
 
    // on tagge tous les objets de l'objet manager comme non nouveaux
    // pour faire le tri de ceux qui ont été supprimés
    x->mb->setObjectsDirty();
    
    post("dirty %i",x->x_canvas->gl_dirty);
    post("############");
    
    
    

    
    /*
    
    t_gobj *y;
    
    for (y = x->x_canvas->gl_list; y; y = y->g_next)
    {
        
        // self
        if (strncmp( class_getname( pd_class(&y->g_pd)),"miragebox",9)==0)
        {
            //  post("me");
            
            
        }

        
        // vertical slider
        else if (strncmp( class_getname( pd_class(&y->g_pd)),"vsl",3)==0)
        {
            // si l'objet est nouveau, on l'ajoute
            // et on envoie à l'interface la commance pour le créer
            
            if (x->mb->addObject(y) )
            {
                post("vertical slider added");
              //  x->oscSocketOut->newHSlider();
            }


//            pd_float(&y->g_pd, 0.8);

           
            
        }
        
        
        // horizontal slider
        else if (strncmp( class_getname( pd_class(&y->g_pd)),"hsl",3)==0)
        {
            if (x->mb->addObject(y) )
            {
                post("horizontal slider added ");
                t_hslider *obj =(t_hslider*) y;
                
                float min=(float)obj->x_min;
                float max=(float)obj->x_max;
                post("min %f",min);
                post("max %f",max);
                x->mb->getMbObjectByObject(y).setMinValue((float)obj->x_min);
                x->mb->getMbObjectByObject(y).setMaxValue((float)obj->x_max);
                
                x->oscSocket->newHSlider(x->mb->getIdByObject(y));
                x->oscSocket->setMinAndMaxValuesForObject(min,
                                                             max,
                                                             x->mb->getIdByObject(y));
            }
            
        }
        
        // number box
        else if (strncmp( class_getname( pd_class(&y->g_pd)),"nbx",3)==0)
        {
            if (x->mb->addObject(y) )
            {
                post("number box added");
               // x->oscSocketOut->newHSlider();
            }
        }
        

        // bang
        else if (strncmp( class_getname( pd_class(&y->g_pd)),"bng",3)==0)
        {
            if (x->mb->addObject(y) )
            {
                post("bang added");
         //       x->oscSocketOut->newHSlider();
            }
        }

        // toggle
        else if (strncmp( class_getname( pd_class(&y->g_pd)),"tgl",3)==0)
        {
            if (x->mb->addObject(y) )
            {
                post("toggle added");
         //       x->oscSocketOut->newHSlider();
            }
        }
        
        
        else
        {
            //post("unsupported object : %s",class_getname( pd_class(&y->g_pd)));
        }
        
        
        
        
    }

//    post(x->canvasSymbol->s_next->s_name);
    
    x->mb->cleanObjects();
    post("objects count %i",x->mb->getNumberOfObject());
    // SI COUNT  = 0 nettoyer completement interface!!
    if (x->mb->getNumberOfObject()==0) x->oscSocket->removeAllObjects();
    
    */
}


static void patchDirty(t_miragebox *x, int sockfd)
{
    post("path is dirty");
}
void *miragebox_new(t_symbol *s, long argc, t_atom *argv)
{
    t_miragebox *x = NULL;
    x = (t_miragebox *)pd_new(Miragebox_class);
    if (x)
	{
        x->mirageBoxId=mirageBoxIdCounter;
        mirageBoxIdCounter++;
        post(" self ID = %i",x->mirageBoxId);
        

        t_canvas *canvas=canvas_getcurrent();
        x->x_canvas = canvas;
        
        x->mb = new MbObjectManager((t_object*) x);
        x->oscSocket=new OscCom((t_object*)x ,89720,1234);
        
        x->oscSocket->callBackFunction= (CICMmethod) miragebox_notif;
        x->oscSocket->setBoxId(x->mirageBoxId);
        x->mb->setSocketOut(x->oscSocket);




        
                    
    }
    return x;
}




void miragebox_free(t_miragebox *x)
{
    post("free");
    if (x);
    {
        delete x->oscSocket;
        delete x->mb;
    }
}

extern "C" void miragebox_setup(void)
{
    
    
    Miragebox_class = class_new(gensym("miragebox"),
                                       (t_newmethod)miragebox_new,
                                       (t_method)miragebox_free, sizeof(t_miragebox),
                                       0L,
                                       A_GIMME, 0);
    
    class_addbang(Miragebox_class,(t_method)miragebox_bang);

    


}


