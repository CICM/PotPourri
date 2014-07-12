//
//  OscSocket.h
//  testOscHandler
//
//  Created by Manuel Deneu on 30/12/12.
//  Copyright (c) 2012 Manuel Deneu. All rights reserved.
//


/*
 Bugs:
 - pb strings qui envoyent un int comme arugment suivant
 
 
*/

#import <Foundation/Foundation.h>


#import "OscMsg.h"







/******************************************/
// Protocole à implémenter dans la classe déléguée du
// socket afin de réceptionner les messages OSC entrants

@protocol oscSocketProtocol <NSObject>

// Notification d'activité OSC
-(void) connectionError:(NSString*)error;
-(void) didReceiveOscContent;
-(void) isSendingOscContent;

@end


@interface OscSocket : NSObject
{
    NSMutableArray* inOscQueue;
    NSMutableArray* outOscQueue;
    
    int maxItemsInQueue;
    int maxItemsOutQueue;
}


@property (nonatomic, assign) id<oscSocketProtocol> delegate;


// Propriétées Réseaux du socket
@property BOOL isRunning;

@property (nonatomic, retain) NSString* ipHost;
@property int inUdpPort;                         
@property int outUdpPort;




            /* ****************************************************************** */

- (id) init;
-(void) saveSettings;
            /* ****************************************************************** */

- (BOOL) startConnection;
- (BOOL) stopConnection;

            /* ****************************************************************** */
// Gestion de la file de sortie OSC
-(void) displayOutList;
-(void) displayInList;

-(void) flushOscOutQueue;
-(void) flushOscInQueue;

-(void) setMaxItemsInQueue:(int) var;
-(void) setMaxItemsOutQueue:(int) var;

-(void) oscOut:(OscMsg*) msg;
-(OscMsg*) oscIn;



// Methode mise à jour avec utilisation de l'objet OscMsg
- (BOOL) sendOscMsg:(OscMsg*)msg;



            /* ****************************************************************** */




@end
