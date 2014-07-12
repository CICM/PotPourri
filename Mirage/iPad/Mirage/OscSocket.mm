//
//  OscSocket.m
//  testOscHandler
//
//  Created by Manuel Deneu on 30/12/12.
//  Copyright (c) 2012 Manuel Deneu. All rights reserved.
//

#import "OscSocket.h"
//#include <iostream>
#include "cstring"
#include "OscReceivedElements.h"
#include "OscPacketListener.h"

#include "OscOutboundPacketStream.h"
#import "GCDAsyncUdpSocket.h"






#define OUTPUT_BUFFER_SIZE 2048

#define FORMAT(format, ...) [NSString stringWithFormat:(format), ##__VA_ARGS__]




@implementation OscSocket
{
    GCDAsyncUdpSocket *m_udpSocket; // Socket Udp


    char buffer[OUTPUT_BUFFER_SIZE];

}

@synthesize delegate;

@synthesize isRunning  = m_isRunning;


@synthesize ipHost     = m_ipHost;
@synthesize inUdpPort  = m_inUdpPort;
@synthesize outUdpPort = m_outUdpPort;



            /* ****************************************************************** */

// Constructeur
- (id) init
{
	if (self = [super init])
    {
    

    inOscQueue = [[NSMutableArray alloc] init];
    outOscQueue = [[NSMutableArray alloc] init];
        
    maxItemsInQueue  = 30;
    maxItemsOutQueue = 30;
    
    m_isRunning = false;
        



        

        

        
    m_udpSocket = [[GCDAsyncUdpSocket alloc] initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
    m_isRunning = false;
        
   	return self;
    }
    else return nil;
    
}

            /* ****************************************************************** */

- (BOOL) startConnection
{

    if (!m_isRunning)
    {
        // START udp server
        NSError *error = nil;
        
        
        //////////////////////////////////////////
        // Udp
        //////////////////////////////////////////
        
        if (![m_udpSocket bindToPort:m_inUdpPort error:&error])
        {

            UIAlertView* dialog = [[UIAlertView alloc] initWithFrame:CGRectMake(500.0, 45.0, 245.0, 600.0)];
            [dialog setDelegate:self];
            [dialog setTitle:@"Error"];
            [dialog setMessage:@"Error during connection"];
            [dialog addButtonWithTitle:@"OK"];
            [dialog show];
            return false;
        }
        
        if (![m_udpSocket beginReceiving:&error])
        {
            [m_udpSocket close];
            return false;
        }
        
        [m_udpSocket enableBroadcast:YES error:nil];
        
    }

    m_isRunning = YES;
    return true;
}


- (BOOL) stopConnection
{

    if (m_isRunning)
	{
		[m_udpSocket close];
        
		m_isRunning = false;
        
		return true;
	}
    
    else return false;

}

            /* ****************************************************************** */
            //                                                                    //
            //              Gestion des piles                                     //
            //                                                                    //  
            /* ****************************************************************** */

//////////////////////////////
// Methodes privées
//////////////////////////////

- (OscMsg*) dequeueIncommingOsc
{
    if ([inOscQueue count] == 0) return nil;
    
    OscMsg* headObject = [[inOscQueue lastObject] copy];
    if (headObject != nil)
        {
        [inOscQueue removeLastObject];
        }
    return headObject;
}

- (void) enqueueIncommingOsc:(OscMsg*)anObject
{
    if ([inOscQueue count]>maxItemsInQueue)  [inOscQueue removeObjectAtIndex:0];
    
    [inOscQueue addObject:anObject];

}


- (OscMsg*) dequeueOutcommingOsc
{
    if ([outOscQueue count] == 0) return nil;
    
    OscMsg* headObject = [[outOscQueue lastObject] copy];
    if (headObject != nil)
    {
        [outOscQueue removeLastObject];
    }
    return headObject;
}

- (void) enqueueOutcommingOsc:(id)anObject
{
    if ([outOscQueue count]>maxItemsOutQueue)  [outOscQueue removeObjectAtIndex:0];
    [outOscQueue addObject:anObject];

}


-(void) oscOut:(OscMsg*) msg
{
    
    
     [self enqueueOutcommingOsc:msg];
     [self sendOscMsg:[self dequeueOutcommingOsc] ];
    //[self sendOscMsg:msg ];
    
}

-(OscMsg*) oscIn
{
    return [[self dequeueIncommingOsc] copy];
    
}



            /* ****************************************************************** */



////////////////////////////////////////////////////////////////////////////////
//
//  sendOscMsg(adress,method Array of values)
//  Generic method ver2
//
////////////////////////////////////////////////////////////////////////////////
- (BOOL) sendOscMsg:(OscMsg*)msg;
{
    NSString *entete=[msg.adress stringByAppendingString:msg.method];

    osc::OutboundPacketStream p( buffer, OUTPUT_BUFFER_SIZE );
    

    //p << osc::BeginBundleImmediate
    p<< osc::BeginMessage( [entete UTF8String] );
    
    for (int i=0;i<[msg.list count];i++)
    {
        if ([[msg.list objectAtIndex:i] isKindOfClass:[NSNumber class]])
        {
            if((strcmp([(NSNumber*)[msg.list objectAtIndex:i] objCType], @encode(float))) == 0)
            p << (float) [[msg.list objectAtIndex:i] floatValue];
            else if((strcmp([(NSNumber*)[msg.list objectAtIndex:i] objCType], @encode(int))) == 0)
                p << (int) [[msg.list objectAtIndex:i] intValue];
        }
        
        else if ([[msg.list objectAtIndex:i] isKindOfClass:[NSString class]])
        {
            p << [[msg.list objectAtIndex:i] UTF8String];
            
        }
    }
        
    p<< osc::EndMessage;// << osc::EndBundle;
    
   // transmitSocket->Send( p.Data(), p.Size() );
    NSData* data = [NSData dataWithBytes:p.Data() length:p.Size()];
    [m_udpSocket sendData:data toHost:m_ipHost port:m_outUdpPort withTimeout:-1 tag:0];
    

        
        
    return YES;

    
}


////////////////////////////////////////////////////////////////////////////////
//
//  reception   des paquets Udp
//
////////////////////////////////////////////////////////////////////////////////

- (void)udpSocket:(GCDAsyncUdpSocket *)sock didReceiveData:(NSMutableData *)data
      fromAddress:(NSData *)address
withFilterContext:(id)filterContext
{

    
    if (!m_isRunning) return;
    else
    {
    OscMsg *msgIn = [[OscMsg alloc] init];

    osc::ReceivedMessage msg( osc::ReceivedPacket((const char*)[data bytes],[data length]));

    
    // l'addresse
    NSString *entete = [NSString stringWithUTF8String:msg.AddressPattern()];
        
    NSRange startRange = [entete rangeOfString:@"/"];
    NSRange endRange = [entete rangeOfString:@"/" options:NSBackwardsSearch];
        
    NSRange adress;
    adress.location=startRange.location+1;
    adress.length=endRange.location;
        

    msgIn.adress = [NSString stringWithString :[entete substringWithRange:adress] ];
    msgIn.method = [NSString stringWithString :[entete substringFromIndex:(endRange.location+1) ] ];
    
              
    
        
    osc::ReceivedMessage::const_iterator arg = msg.ArgumentsBegin();
        while (arg !=msg.ArgumentsEnd())
        {
            if ( (arg)->IsFloat())
                [msgIn.list addObject:[NSNumber numberWithFloat:(arg++)->AsFloat()]];
            
            else if ( (arg)->IsInt32())
                [msgIn.list addObject:[NSNumber numberWithInt:(arg++)->AsInt32()]];
            else if ( (arg)->IsString())
                [msgIn.list addObject:[NSString stringWithUTF8String:(arg++)->AsString()]];

        }
        
        [self enqueueIncommingOsc:msgIn];
        [self.delegate didReceiveOscContent];
        
        msgIn=nil;

        

    }




    
    
}



@end
