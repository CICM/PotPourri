//
//  EditionViewDelegate.h
//  Iannix
//
//  Created by Manuel Deneu on 16/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingsViewControllerProtocol.h"

#import "OscSocket.h"


@interface SettingsViewDelegate : UIViewController <SettingsViewControllerDelegate >
{
    
}
@property (nonatomic,assign) id delegate;


-(void) openDialogBoxForSocket:(OscSocket*) socket;
-(void) stopConnection;
-(void) initConnection;

@end

