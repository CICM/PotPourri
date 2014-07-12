//
//  OscCom.cpp
//  miragebox
//
//  Created by Manuel Deneu on 28/05/13.
//
//

#include "ProjectHeader.h"

#include "OscCom.h"
// OSC STUFF
#include "osc/OscReceivedElements.h"
#include "osc/OscPacketListener.h"
#include <poll.h>

#ifdef _WIN32
#include <winsock2.h>
#include <ws2tcpip.h>
#else
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netinet/tcp.h>
#include <netdb.h>
#include <stdio.h>
#include <errno.h>
#endif

/*
extern "C"
{
#include "m_pd.h"
#include "g_canvas.h"
#include "m_imp.h"
#include "s_stuff.h"
#include "g_all_guis.h"
}
*/



OscCom::OscCom(t_object* object, int _inPort, int _outPort)
{
    
    m_object = object;
    inPort  = _inPort;
    outPort = _outPort;
    transmitSocket = new UdpTransmitSocket( IpEndpointName( ADDRESS, outPort ) );
    
    
    listeningSocket = new UdpListeningReceiveSocket(
                                IpEndpointName(IpEndpointName::ANY_ADDRESS, IpEndpointName::ANY_PORT)
                                ,this);
    int prt =listeningSocket->LocalEndpointFor(IpEndpointName( ADDRESS, inPort )).port;
    post("bounded : Port in = %i",prt);
    
    if (StartInternalThread())
        post("thread ok");
    else
        post("thread pas ok...");

}


OscCom::~OscCom()
{
    listeningSocket->Break();
    
    WaitForInternalThreadToExit();
    post("thread killed");
    
    if (transmitSocket)     delete transmitSocket;
    if (listeningSocket)    delete listeningSocket;

  
}

void OscCom::reconnect()
{
//    transmitSocket->Connect(IpEndpointName( ADDRESS, outPort ));
   if(listeningSocket) listeningSocket->Break();
    WaitForInternalThreadToExit();
    
    if (StartInternalThread()) post("thread ok");
    else post("thread pas ok...");
}

void OscCom::setInPort(int port)
{
    inPort=port;
}

int  OscCom::getInPort() const
{
    return inPort;
}


void OscCom::setOutPort(int port)
{
    outPort=port;
}

int  OscCom::getOutPort() const
{
    return outPort;
}

// demarre le thread
 void OscCom::InternalThreadEntry()
{
    post("init");
    //UdpListeningReceiveSocket s(IpEndpointName( IpEndpointName::ANY_ADDRESS, inPort),this);
//    s.RunUntilSigInt();


    if (this->listeningSocket) this->listeningSocket->RunUntilSigInt();
    
}

void OscCom::ProcessMessage( const osc::ReceivedMessage& m,
                            const IpEndpointName& remoteEndpoint )
{
    post("osc in");
    
    callBackFunction(m_object,&m);
}

void OscCom::sendOsc(osc::OutboundPacketStream msg)
{
    transmitSocket->Send(msg.Data(), msg.Size());
}


void OscCom::removeAllObjects()
{
    char buffer[OUTPUT_BUFFER_SIZE];
    osc::OutboundPacketStream p( buffer, OUTPUT_BUFFER_SIZE );
    
    //p << osc::BeginBundleImmediate
    p<< osc::BeginMessage( "/miragebox/removeAll" )<<  osc::EndMessage;
    //    << osc::EndBundle;
    
    transmitSocket->Send( p.Data(), p.Size() );
}
void OscCom::removeObject(int objId)
{
    char buffer[OUTPUT_BUFFER_SIZE];
    osc::OutboundPacketStream p( buffer, OUTPUT_BUFFER_SIZE );
    
    //p << osc::BeginBundleImmediate
    p<< osc::BeginMessage( "/miragebox/remove" )<< objId<< osc::EndMessage;
    //    << osc::EndBundle;
    
    transmitSocket->Send( p.Data(), p.Size() );
}

void OscCom::newHSlider(int objId)
{
    char buffer[OUTPUT_BUFFER_SIZE];
    osc::OutboundPacketStream p( buffer, OUTPUT_BUFFER_SIZE );
    
    //p << osc::BeginBundleImmediate
    p<< osc::BeginMessage( "/miragebox/addHSlider" )<< objId<< osc::EndMessage;
//    << osc::EndBundle;
    
    transmitSocket->Send( p.Data(), p.Size() );
}

void OscCom::setMinAndMaxValuesForObject(float min, float max, int objId)
{
    char buffer[OUTPUT_BUFFER_SIZE];
    osc::OutboundPacketStream p( buffer, OUTPUT_BUFFER_SIZE );
    
    //p << osc::BeginBundleImmediate
    p<< osc::BeginMessage( "/miragebox/setMinMax" )<< min << max << objId<< osc::EndMessage;
    //    << osc::EndBundle;
    
    transmitSocket->Send( p.Data(), p.Size() );
}



