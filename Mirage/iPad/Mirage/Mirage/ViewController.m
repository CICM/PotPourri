//
//  ViewController.m
//  Mirage
//
//  Created by Manuel Deneu on 28/05/13.
//  Copyright (c) 2013 Manuel Deneu. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import "ViewController.h"
#import "Hfader.h"


#include <netdb.h>
#include <sys/param.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <sys/socket.h>

#include <time.h>
#include "UIPatcher.h"


#define INIT_X 50


@implementation ViewController
{
    SettingsViewDelegate *settingsView;

    NSMutableArray      *boxButtons;

    NSMutableDictionary *boxList;

    CGRect patchFrame;
    
    int counterId;
    int selectedId;
    bool isEditing;
    
    UIPatcher *selectedPatch;
    
}




- (void)viewDidLoad
{
    [super viewDidLoad];
    pingPendingTimer = [NSTimer scheduledTimerWithTimeInterval:3.0
                                                        target:self
                                                      selector:@selector(pingPoll:)
                                                      userInfo:nil
                                                       repeats:YES];

    


    counterId=0;
    isEditing=NO;
    
    
    
    _netServiceBrowser = [[NSNetServiceBrowser alloc] init];
    [_netServiceBrowser setDelegate:self];
    [_netServiceBrowser searchForServicesOfType:@"_mirage._tcp." inDomain:@"local"];
    
/*
    socket=[[OscSocket alloc] init];
    [socket setIpHost:@"192.168.1.4"];
    [socket setInUdpPort:1234];
    [socket setOutUdpPort:7000];
    [socket setDelegate:self];
    [socket startConnection];
*/
    
    
    settingsView    =[[SettingsViewDelegate alloc] initWithNibName:Nil bundle:Nil];
    [settingsView setDelegate:self];

    
//    [slide setTransform:CGAffineTransformMakeRotation(M_PI_2)];
    
    //[self createHSlider:0];
    
    
    boxList = [[NSMutableDictionary alloc] init];
    boxButtons = [[NSMutableArray alloc] init];
    
    
    patchFrame.origin.y=60;
    patchFrame.origin.x=4;
    patchFrame.size.width=1016;
    patchFrame.size.height=700;
    
    /*
    UIPatcher *patchView = [[UIPatcher alloc] initWithFrame:frame PatchId:0];
    [self.view addSubview:patchView];
    
    [boxList setObject:patchView forKey:[NSNumber numberWithInt:0]];
    */
    

}

-(UIPatcher*) createNewPatchWithName:(NSString*) name
{
    // la vue
    UIPatcher *patchView = [[UIPatcher alloc] initWithFrame:patchFrame PatchId:counterId];
    [patchView setPatchName:name];
    [patchView setPatchId:counterId];
    [patchView setTag:counterId];


    [self.view addSubview:patchView];


    
    [boxList setObject:patchView forKey:name];
    
    
    // le bouton dans la barre
    // X 70 Y 10 W 120 H 40
    int count = boxButtons.count;
    float x=INIT_X + count*(120 + 10);
    UIButton *patchButton = [[UIButton alloc] initWithFrame:CGRectMake(x, 10, 120, 40)];
    [patchButton setTitle:name forState:UIControlStateNormal];
    [patchButton setTag:counterId];
    [patchButton addTarget:self action:@selector(buttonPatchClick:) forControlEvents:UIControlEventTouchUpInside];
    
   
    
    
    [[patchButton layer] setBorderColor:[UIColor grayColor].CGColor];
    
    
    [boxButtons addObject:patchButton];
    [self.view addSubview:boxButtons.lastObject];

    selectedId = counterId;
    counterId++;
    
    for (UIButton *btn in boxButtons)
    {
        if (btn.tag==selectedId)
            [[btn layer] setBorderWidth:1.0f];
        else
            [[btn layer] setBorderWidth:0.0f];
    }
    
    
    return patchView;
}


/* ******** ******** ******** ******** ******** ******** ******** ******** ******** */
//                                                                                  //
//                         ACTIONS                                                  //
//                                                                                  //
/* ******** ******** ******** ******** ******** ******** ******** ******** ******** */

// Clic sur un des tabs
-(IBAction)buttonPatchClick:(id)sender
{
    sender= (UIButton*) sender;
    
    NSLog(@"click %i",[sender tag]);
    for (UIPatcher *view in self.view.subviews)
    {

        if ([view isKindOfClass:[UIPatcher class]])
        {

            NSLog(@"view %i",view.tag);
            if (view.tag==[sender tag])
            {
                selectedId = view.tag;
                selectedPatch = view;
                
                [self.view bringSubviewToFront:view];
            }
//          else [view removeFromSuperview];
        }

    }
    
    for (UIButton *btn in boxButtons)
    {
        if (btn.tag==selectedId)
            [[btn layer] setBorderWidth:1.0f];
        else
            [[btn layer] setBorderWidth:0.0f];
    }

}

-(IBAction)editionModeClick:(id)sender
{
    isEditing=editionMode.on;
    
    [GraphicObj SetEditState:isEditing];
    [UIPatcher SetEditState:isEditing];
    
    if (isEditing)
    {
        NSLog(@"Edition ON");

        

    }
    
    else
    {
        NSLog(@"Edition OFF");
    }

    [selectedPatch switchToEditMode];
    
}

-(IBAction)manuallyAddPatchClick:(id)sender
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"New patch" message:@"choose a name:" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
    alertView.alertViewStyle = UIAlertViewStylePlainTextInput;
    UITextField *textField = [alertView textFieldAtIndex:0];

    [alertView setTag:1];
    [alertView show];

    
    
}


-(IBAction)openSettings:(id)sender
{
    [settingsView openDialogBoxForSocket:selectedPatch.socket];
 
                         
}
/* ******** ******** ******** ******** ******** ******** ******** ******** ******** */
//                                                                                  //
//                         ZEROCONF                                                 //
//                                                                                  //
/* ******** ******** ******** ******** ******** ******** ******** ******** ******** */

-(void) netServiceBrowser:(NSNetServiceBrowser *)aNetServiceBrowser didFindService:(NSNetService *)aNetService moreComing:(BOOL)moreComing
{
    NSLog(@"find %@",aNetService.name);
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"New mirageBox detected!" message:@"Join?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
    [alert setTag:0];
    [alert show];
        
    _currentResolve =aNetService;
    
    

    
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    // TAG
    // 0 : from zero conf
    // 1 : ajout manuel
    // yes cliked
    if (alertView.tag==0)
    {
        if (buttonIndex)
        {
            [_currentResolve setDelegate:self];
            [_currentResolve resolveWithTimeout:0.0];
        }
        // no clicked
        else
        {
            _currentResolve=nil;
        }
    }
    else if (alertView.tag==1)
    {
        if (buttonIndex)
        {
            NSString *name = [alertView textFieldAtIndex:0].text;
            NSLog(@"name : %@",name);
            UIPatcher *newPatch= [self createNewPatchWithName:name];
            
            [[newPatch socket] setOutUdpPort:0];
            [[newPatch socket] setIpHost:@"255.255.255.0"];
            [[newPatch socket] setInUdpPort:0];

            
        }
        // no clicked
        else
        {
            
        }
    }
    
    
    
}

- (void)netService:(NSNetService *)sender didNotResolve:(NSDictionary *)errorDict
{
	//[self stopCurrentResolve];
	NSLog(@"did not resolve adress");	
}


- (void)netServiceDidResolveAddress:(NSNetService *)service
{
	assert(service == _currentResolve);

	NSLog(@"did resolve adress %i",    service.port);
    NSLog(@"host name %@",service.hostName);
    
    
    
    struct hostent * record = gethostbyname([service.hostName UTF8String]);
	if(record == NULL)
	{
		exit(1);
	}
	struct in_addr * address = (struct in_addr * )record->h_addr;
	NSString *ip_address = [NSString stringWithUTF8String: inet_ntoa(* address)];
    NSString *name= service.name;
    
    UIPatcher *newPatch= [self createNewPatchWithName:name];
    [[newPatch socket] setOutUdpPort:service.port];
    [[newPatch socket] setIpHost:ip_address];
    [[newPatch socket] setInUdpPort:1234];
    
    
    NSLog(@"ip = %@",ip_address);
//    [socket setIpHost:ip_address];
//    [socket setOutUdpPort:service.port];
    
    

}

-(void)pingPoll:(NSTimer *) theTimer
{
    //pingPendingCounter++;
    //NSLog(@"on time");
    
    NSEnumerator *enumerator = [boxList keyEnumerator];
    
    for(NSString *aKey in enumerator)
    {
        [[boxList valueForKey:aKey] sendPing]; //made up method
    }


}







/* ****** ****** ****** ****** ****** ****** ****** ****** */
//
//  OSC
//
/* ****** ****** ****** ****** ****** ****** ****** ****** */
-(void) didReceiveOscContent
{
        
}

-(void) isSendingOscContent
{
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return (UIDeviceOrientationLandscapeLeft);
}
@end
