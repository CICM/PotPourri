//
//  SettingsViewController.m
//  Iannix
//
//  Created by Manuel Deneu on 15/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SettingsViewController.h"

#import <ifaddrs.h>
#import <arpa/inet.h>





@implementation SettingsViewController
{
    BOOL asChanged;
    NSTimer *timer;
}

@synthesize delegate;


-(void) onTime
{
    localIp.text=[self getOwnIpAddress];

    if ([masterSwitch isOn])
    {
    if ([ [self getOwnIpAddress] isEqualToString:@"error"])
        {
        [masterSwitch setOn:FALSE];

            
        UIAlertView* dialog = [[UIAlertView alloc] initWithFrame:CGRectMake(500.0, 45.0, 245.0, 600.0)];
        [dialog setDelegate:self];
        [dialog setTitle:@"Error"];
        [dialog setMessage:@"Device not connected to Wifi.\nPlease check Wifi settings."];
        [dialog addButtonWithTitle:@"OK"];
        [dialog show];
            

            


            

        }
    }
    
}

// Get IP Address
- (NSString *)getOwnIpAddress 
{    
    NSString *address = @"error";
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    // retrieve the current interfaces - returns 0 on success
    success = getifaddrs(&interfaces);
    if (success == 0) {
        // Loop through linked list of interfaces
        temp_addr = interfaces;
        while(temp_addr != NULL) {
            if(temp_addr->ifa_addr->sa_family == AF_INET) {
                // Check if interface is en0 which is the wifi connection on the iPhone
                if([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                    // Get NSString from C String
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];               
                }
            }
            temp_addr = temp_addr->ifa_next;
        }
    }
    // Free memory
    freeifaddrs(interfaces);

    
    return address;
    
}

//////////////////////////////////////////////////////////////////////////////////////////


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{                                                 
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) 
    {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    asChanged=FALSE;
    
    ipHostField.text=[delegate getSocket].ipHost;
    inPortField.text =  [NSString stringWithFormat: @"%i",[delegate getSocket].inUdpPort];
    outPortField.text =  [NSString stringWithFormat: @"%i",[delegate getSocket].outUdpPort];
    
        
    [masterSwitch setOn:[delegate getSocket].isRunning];
    


    if ([[self getOwnIpAddress] isEqualToString:@"error"])
    {
        [masterSwitch setOn:FALSE];
        [[delegate getSocket] stopConnection];
    }
    

    [cancelButton setHidden:TRUE];
    
    [inPortField addTarget:self action:@selector(inPortFieldDidChange) forControlEvents:UIControlEventEditingDidEnd];
    [outPortField addTarget:self action:@selector(outPortFieldDidChange) forControlEvents:UIControlEventEditingDidEnd];
    [ipHostField addTarget:self action:@selector(ipHostFieldDidChange) forControlEvents:UIControlEventEditingDidEnd];
    

    
    timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(onTime) userInfo:nil repeats:YES];

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
    
    
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

/////////////////////////////////////////////////////////////////////////////////////////////
//
// mise à jours des champs de renseignement de connection & sauvegarde des donnes
//
/////////////////////////////////////////////////////////////////////////////////////////////

-(void) ipHostFieldDidChange
{
    
    [delegate ipFieldDidChangeTo:ipHostField.text];
    
    //[self.rawUdp stopConnection];
    /*
    [self.defaults setObject:ipHostField.text forKey:@"ipHost"];
    [self.defaults synchronize];
    */
  //  [self.rawUdp setIpHost:ipHostField.text];
  //  [self.rawUdp startConnection];
    
    
}

-(void) inPortFieldDidChange
{
    [delegate inPortFieldDidChangeTo:[inPortField.text intValue]];
    
}


-(void) outPortFieldDidChange
{
    [delegate outPortFieldDidChangeTo:[outPortField.text intValue]];
    
}







/////////////////////////////////////////////////////////////////////////////////////////////
// 
// Gestion de l'interface UI
//
/////////////////////////////////////////////////////////////////////////////////////////////
-(void) switchConnection
{
    
/*
    if ([delegate getSocket].isRunning) NSLog(@"running");
    else if (![delegate getSocket].isRunning) NSLog(@"stopped");
*/
    [masterSwitch setOn: [delegate getSocket].isRunning];
    


}

- (IBAction)startStop:(id)sender
{

    if ([delegate getSocket].isRunning)
    {
        // On arrete la connection
        [[delegate getSocket] stopConnection];
        
    }
    else 
    {
        // On initialise la connection
        [[delegate getSocket] setIpHost:ipHostField.text];
        
        [[delegate getSocket] setInUdpPort:[inPortField.text intValue]];
        
        [[delegate getSocket] startConnection];
        [[delegate getSocket] setOutUdpPort:[outPortField.text intValue]];
    }

    [self switchConnection];

    
}

// methode commune aux boutons 'Done' & 'cancel'
- (IBAction) done
{
    //[[delegate getSocket] saveSettings];
    [timer invalidate];
    [self settingsViewController:self didFinishWithChange:asChanged];
    
   
    
}

- (IBAction)setchanged:(id)sender
{
    asChanged=TRUE;
    
    if ([cancelButton isHidden]) [cancelButton setHidden:FALSE];
}




-(void) settingsViewController:(SettingsViewController *)controller didFinishWithChange:(BOOL)changed
{
    [self dismissViewControllerAnimated:YES completion:NULL];
    
}

@end
