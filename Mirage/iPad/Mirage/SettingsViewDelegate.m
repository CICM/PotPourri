//
//  EditionViewDelegate.m
//  Iannix
//
//  Created by Manuel Deneu on 16/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SettingsViewDelegate.h"
#import "SettingsViewController.h"

#import "OscSocket.h"


@interface SettingsViewDelegate ()

@end

@implementation SettingsViewDelegate
{
    SettingsViewController *controller;
    
    OscSocket *_socket;

}
@synthesize delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    

}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}
-(void) initConnection
{
    /*
    controller.rawUdp = [[udpHandler alloc] init];
    
    
    [controller.rawUdp setIpHost:[defaults stringForKey:@"ipHost" ] ];
    [controller.rawUdp setInUdpPort:[defaults integerForKey:@"inUdpPort" ] ];
    [controller.rawUdp setOutUdpPort:[defaults integerForKey:@"outUdpPort" ] ];
     
    
    [controller.rawUdp setIpHost:@"bla" ];
    [controller.rawUdp setInUdpPort:1234];
    [controller.rawUdp setOutUdpPort:4321 ];
    */
}
-(void) openDialogBoxForSocket:(OscSocket*) socket
{
    
    _socket=socket;
    
    controller = [[SettingsViewController alloc] initWithNibName:@"SettingsViewController" bundle:nil  ];
    
    controller.modalTransitionStyle=UIModalTransitionStyleFlipHorizontal;
    controller.modalPresentationStyle=UIModalPresentationFormSheet;
    [controller setDelegate:self];
    
    [self.delegate presentViewController:controller animated:YES completion:NULL];
    
    // dirty
    controller.view.superview.frame = CGRectMake(340, 200, 332, 400);//it's important to do this after presentModalViewController
    self.view.superview.center = self.view.center;//self.view assumes the base view is doing the launching, if not you might need self.view.superview.center
    
    
    
     
}

-(OscSocket*) getSocket
{
    return _socket;
}

-(void) stopConnection
{
    [controller switchConnection];
}

-(void) ipFieldDidChangeTo:(NSString*) var
{
    [_socket setIpHost:var];

}

-(void) inPortFieldDidChangeTo:(int) var
{
    [_socket setInUdpPort:var];

}

-(void) outPortFieldDidChangeTo:(int) var
{
    [_socket setOutUdpPort:var];
}









@end
