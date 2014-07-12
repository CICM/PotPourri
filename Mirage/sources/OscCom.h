//
//  OscCom.h
//  miragebox
//
//  Created by Manuel Deneu on 28/05/13.
//
//

#ifndef __OscCom__
#define __OscCom__

#include "CicmTools.h"

#include <iostream>
#include "ip/UdpSocket.h"
#include "ip/PacketListener.h"
#include "osc/OscOutboundPacketStream.h"

#include "osc/OscReceivedElements.h"
#include "osc/OscReceivedElements.h"
#include "osc/OscPacketListener.h"
#include "osc/OscPrintReceivedElements.h"

#define OUTPUT_BUFFER_SIZE 1024
#define MAX_UDP_RECEIVE 65536L // longer than data in maximum UDP packet

#define ADDRESS "192.168.97.208"
//#define PORT 1234

class MyThreadClass
{
public:
    MyThreadClass() {/* empty */}
    virtual ~MyThreadClass() {    /*pthread_exit(&_thread);*/}
    
    /** Returns true if the thread was successfully started, false if there was an error starting the thread */
    inline bool StartInternalThread()
    {
        
//        pthread_attr_setdetachstate(attr, PTHREAD_CREATE_JOINABLE);
        int rc;
        rc =pthread_create(&_thread, NULL, InternalThreadEntryFunc, this);
        post("return code from pthread_create() is %d\n", rc);
        return ( rc== 0);
    }
    
    /** Will not return until the internal thread has exited. */
    inline void WaitForInternalThreadToExit()
    {
     //   pthread_attr_destroy(attr);


        
        //(void) pthread_join(_thread, (void**)&rt);
        post("return on exit %i ",        pthread_kill(_thread, 0));

    }
    
protected:
    /** Implement this method in your subclass with the code you want your thread to run. */
    virtual void InternalThreadEntry() = 0;
    
private:
    static void * InternalThreadEntryFunc(void * This) {((MyThreadClass *)This)->InternalThreadEntry(); return NULL;}
    
    pthread_t _thread;
    //pthread_attr_t *attr;
};



class OscCom : MyThreadClass , osc::OscPacketListener
{
public :
    OscCom(t_object* object,int _inPort,int _outPort);
    ~OscCom();
    
    // reconnect after inPort, outPort, ADRESS changes
    void reconnect();
    
    void sendOsc(osc::OutboundPacketStream msg);

    void sendTest();
    void removeObject(int objId);
    
    void removeAllObjects();
    void newHSlider(int objId);
    
    void setInPort(int port);
    int  getInPort() const;
    
    void setOutPort(int port);
    int  getOutPort() const;
    
    void setMinAndMaxValuesForObject(float min, float max, int objId);

    // a privatiser

    virtual void ProcessMessage( const osc::ReceivedMessage& m,
                                const IpEndpointName& remoteEndpoint );

    CicmMethod callBackFunction;
    
private :
    virtual void InternalThreadEntry();
    t_object* m_object;

    UdpTransmitSocket *transmitSocket;
    UdpListeningReceiveSocket *listeningSocket;
   
    int inPort;
    int outPort;
};

#endif /* defined(__miragebox__OscSocket__) */
