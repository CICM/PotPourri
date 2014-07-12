//
//  EditionViewControllerDelegate.h
//  Iannix
//
//  Created by Manuel Deneu on 16/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "OscSocket.h"

@class SettingsViewDelegate;

@protocol SettingsViewControllerDelegate
-(void) ipFieldDidChangeTo:(NSString*) var;
-(void) inPortFieldDidChangeTo:(int) var;
-(void) outPortFieldDidChangeTo:(int) var;

-(OscSocket*) getSocket;

@end