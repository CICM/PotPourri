//
//  OscCom.cpp
//  miragebox
//
//  Created by Manuel Deneu on 28/05/13.
//
//

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

extern "C"
{
    
#include "m_pd.h"
#include "g_canvas.h"
#include "m_imp.h"
#include "s_stuff.h"
#include "g_all_guis.h"
}




OscCom::OscCom(t_object* object,int _inPort,int _outPort)
{
    connectionState=StateDisconnected;
    
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
    
    service = new Service("pd12",prt);
    //this->setPort(prt);

    //this->publish(true);
    service->publish(true);

}

bool OscCom::stopConnection()
{
    listeningSocket->AsynchronousBreak();
    post("socket stopped");
    delete listeningSocket;
    
    return true;
}

OscCom::~OscCom()
{
    listeningSocket->AsynchronousBreak();
    WaitForInternalThreadToExit();

    if (service)            delete service;
    if (transmitSocket)     delete transmitSocket;
    if (listeningSocket)    delete listeningSocket;

  
}

void OscCom::setBoxId(int var)
{
    boxId=var;
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
    if (this->listeningSocket) this->listeningSocket->RunUntilSigInt();
}

void OscCom::ProcessMessage( const osc::ReceivedMessage& m,
                            const IpEndpointName& remoteEndpoint )
{

    if (service)    delete service;
    /*
    if( strcmp( m.AddressPattern(), "/ping" ) == 0 )
    {
        osc::ReceivedMessage::const_iterator arg = m.ArgumentsBegin();
        int _boxId=(arg++)->AsInt32();
        if (boxId==_boxId) this->getPing(_boxId);
    }
    
    else
    {*/
        post("osc in");
        callBackFunction(m_object,&m);
    //}

}


void OscCom::getPing(int val)
{
    connectionState=StateConnected;
    post("ping Ok for boxId %i",val);
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
    post("new slider %i",objId);
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

/* ****** ****** ****** ****** ****** ****** */

int OscCom::udpreceive_new_socket(
                                  //t_udpreceive *x,
                                  char *address, int port)
{
    // return nonzero if successful in creating and binding a socket
    int                 sockfd;
    int                 intarg;
    int                 multicast_joined = 0;
    struct sockaddr_in  server;
    struct hostent      *hp;
#if defined __APPLE__ || defined _WIN32
    struct ip_mreq      mreq;
#else
    struct ip_mreqn     mreq;
#endif
    
    if (inPort >= 0)
    {
        // close the existing socket first
        sys_rmpollfn(inSocket);
        sys_closesocket(inSocket);
    }
    /* create a socket */
    sockfd = socket(AF_INET, SOCK_DGRAM, 0);
#ifdef DEBUG
    post("udpreceive_new: socket %d port %d", sockfd, portno);
#endif
    if (sockfd < 0)
    {
        //udpreceive_sock_err(x, "udpreceive: socket");
        return 0;
    }
    server.sin_family = AF_INET;
    if (address[0] == 0) server.sin_addr.s_addr = INADDR_ANY;
    else
    {
        hp = gethostbyname(address);
        if (hp == 0)
        {
          //  pd_error(x, "udpreceive: bad host?\n");
            return 0;
        }
        memcpy((char *)&server.sin_addr, (char *)hp->h_addr, hp->h_length);
    }
    /* enable delivery of all multicast or broadcast (but not unicast)
     * UDP datagrams to all sockets bound to the same port */
    
    intarg = 1;
    if (setsockopt(sockfd, SOL_SOCKET, SO_REUSEADDR,
                   (char *)&intarg, sizeof(intarg)) < 0)
     //   udpreceive_sock_err(x, "udpreceive: setsockopt (SO_REUSEADDR) failed");
    
    /* assign server port number */
    server.sin_port = htons((u_short)port);
    
    /* if a multicast address was specified, join the multicast group */
    /* hop count defaults to 1 so we won't leave the subnet*/
    if (0xE0000000 == (ntohl(server.sin_addr.s_addr) & 0xF0000000))
    {
        server.sin_addr.s_addr = INADDR_ANY;
        /* first bind the socket to INADDR_ANY */
        if (bind(sockfd, (struct sockaddr *)&server, sizeof(server)) < 0)
        {
         //   udpreceive_sock_err(x, "udpreceive: bind");
            sys_closesocket(sockfd);
            return 0;
        }
        /* second join the multicast group */
        memcpy((char *)&server.sin_addr, (char *)hp->h_addr, hp->h_length);
        
#if defined __APPLE__ || defined _WIN32
        mreq.imr_multiaddr.s_addr = server.sin_addr.s_addr;
        mreq.imr_interface.s_addr = INADDR_ANY;/* can put a specific local IP address here if host is multihomed */
#else
        mreq.imr_multiaddr.s_addr = server.sin_addr.s_addr;
        mreq.imr_address.s_addr = INADDR_ANY;
        mreq.imr_ifindex = 0;
#endif //__APPLE__ || _WIN32
        if (setsockopt(sockfd, IPPROTO_IP, IP_ADD_MEMBERSHIP,
                       (char *)&mreq, sizeof(mreq)) < 0)
         //  udpreceive_sock_err(x, "udpreceive: setsockopt IP_ADD_MEMBERSHIP");
            post("error");
        
        else
        {
            multicast_joined = 1;
            post ("udpreceive: added to multicast group");
        }
    }
    else
    {
        /* name the socket */
        if (bind(sockfd, (struct sockaddr *)&server, sizeof(server)) < 0)
        {
          //  udpreceive_sock_err(x, "udpreceive: bind");
            sys_closesocket(sockfd);
            return 0;
        }
    }
    //x->x_multicast_joined = multicast_joined;
    inSocket = sockfd;
//    x->x_total_received = 0L;
    sys_addpollfn(inSocket, (t_fdpollfn)udp_read(), x);
    return 1;
}


/* ****** ****** ****** ****** ****** ****** */

void OscCom::udpreceive_sock_err(
                               // t_udpreceive *x,
                                char *err_string)
{
    /* prints the last error from errno or WSAGetLastError() */
#ifdef _WIN32
    LPVOID  lpMsgBuf;
    DWORD   dwRetVal = WSAGetLastError();
    int     len = 0, i;
    char    *cp;
    
    if (len = FormatMessageA(FORMAT_MESSAGE_ALLOCATE_BUFFER | FORMAT_MESSAGE_FROM_SYSTEM | FORMAT_MESSAGE_IGNORE_INSERTS
                             , NULL, dwRetVal, MAKELANGID(LANG_NEUTRAL, SUBLANG_DEFAULT), (LPSTR)&lpMsgBuf, 0, NULL))
    {
        cp = (char *)lpMsgBuf;
        for(i = 0; i < len; ++i)
        {
            if (cp[i] < 0x20)
            { /* end string at first weird character */
                cp[i] = 0;
                break;
            }
        }
        pd_error(x, "%s: %s (%d)", err_string, lpMsgBuf, dwRetVal);
        LocalFree(lpMsgBuf);
    }
#else
    post("%s: %s (%d)", err_string, strerror(errno), errno);
#endif
}

void OscCom::udp_read(
                      //t_udpreceive *x,
                      //int sockfd
                      )
{
    int                 i, read = 0;
    struct sockaddr_in  from;
    socklen_t           fromlen = sizeof(from);
    t_atom              output_atom;
    long                addr;
    unsigned short      port;
    
    read = recvfrom(inSocket, _msginbuf, MAX_UDP_RECEIVE, 0, (struct sockaddr *)&from, &fromlen);
#ifdef DEBUG
    post("udpreceive_read: read %lu x->x_connectsocket = %d",
         read, x->x_connectsocket);
#endif
    /* get the sender's ip */
    addr = ntohl(from.sin_addr.s_addr);
    port = ntohs(from.sin_port);
    /*
    x->x_addrbytes[0].a_w.w_float = (addr & 0xFF000000)>>24;
    x->x_addrbytes[1].a_w.w_float = (addr & 0x0FF0000)>>16;
    x->x_addrbytes[2].a_w.w_float = (addr & 0x0FF00)>>8;
    x->x_addrbytes[3].a_w.w_float = (addr & 0x0FF);
    x->x_addrbytes[4].a_w.w_float = port;
    outlet_anything(x->x_addrout, gensym("from"), 5L, x->x_addrbytes);
    */
    if (read < 0)
    {
      //  udpreceive_sock_err("udpreceive_read");
        post("error");
        sys_closesocket(inSocket);
        return;
    }
    if (read > 0)
    {
        for (i = 0; i < read; ++i)
        {
            /* convert the bytes in the buffer to floats in a list */
           // x->x_msgoutbuf[i].a_w.w_float = (float)(unsigned char)x->x_msginbuf[i];
            post("received");
        }
        
        /*
        x->x_total_received += read;
        SETFLOAT(&output_atom, read);
        outlet_anything(x->x_addrout, gensym("received"), 1, &output_atom);
        // send the list out the outlet 
        if (read > 1) outlet_list(x->x_msgout, &s_list, read, x->x_msgoutbuf);
        else outlet_float(x->x_msgout, x->x_msgoutbuf[0].a_w.w_float);
        */
    }
}





/*
static void udpreceive_status(t_udpreceive *x)
{
    t_atom output_atom;
    
    SETFLOAT(&output_atom, x->x_multicast_joined);
    outlet_anything( x->x_addrout, gensym("multicast"), 1, &output_atom);
    SETFLOAT(&output_atom, x->x_total_received);
    outlet_anything( x->x_addrout, gensym("total"), 1, &output_atom);
}

static void udpreceive_port(t_udpreceive *x, t_float portno)
{
    int result = udpreceive_new_socket(x, x->x_addr_name, (int)portno);
}
*/





