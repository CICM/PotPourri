//
//  SettingsViewController.h
//  Iannix
//
//  Created by Manuel Deneu on 15/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingsViewDelegate.h"
//#import "GenericObject.h"






@interface SettingsViewController : UIViewController  
{
    IBOutlet UILabel     *localIp;
    IBOutlet UITextField *ipHostField;
    IBOutlet UITextField *inPortField;
    IBOutlet UITextField *outPortField;
    IBOutlet UISwitch    *masterSwitch;

    IBOutlet UIButton *doneButton;
    IBOutlet UIButton *cancelButton;
    
    
    
}
@property (nonatomic,assign) id <SettingsViewControllerDelegate> delegate;





- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil;


- (IBAction) done;
- (IBAction)startStop:(id)sender;

-(void) switchConnection;


-(void) settingsViewController:(SettingsViewController *)controller didFinishWithChange:(BOOL)changed;

@end



