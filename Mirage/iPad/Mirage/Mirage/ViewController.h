//
//  ViewController.h
//  Mirage
//
//  Created by Manuel Deneu on 28/05/13.
//  Copyright (c) 2013 Manuel Deneu. All rights reserved.
//

#import <UIKit/UIKit.h>


// com
#import "OscSocket.h"
#import "SettingsViewController.h"







@interface ViewController : UIViewController <oscSocketProtocol,NSNetServiceBrowserDelegate,NSNetServiceDelegate>
{
    NSNetServiceBrowser* _netServiceBrowser;
    NSNetService* _currentResolve;
    
    NSTimer *pingPendingTimer;
    
    IBOutlet UISwitch *editionMode;
    
    
}

// actions
-(IBAction)buttonPatchClick:(id)sender;
-(IBAction)editionModeClick:(id)sender;
-(IBAction)manuallyAddPatchClick:(id)sender;
-(IBAction)openSettings:(id)sender;


// OSC
-(void) connectionError:(NSString*)error;
//-(void) getPing;







@end
