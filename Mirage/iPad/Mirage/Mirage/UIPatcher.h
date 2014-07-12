//
//  UIPatcher.h
//  Mirage
//
//  Created by Manuel Deneu on 04/06/13.
//  Copyright (c) 2013 Manuel Deneu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OscSocket.h"
#import "GraphicObj.h"


BOOL editState;

@interface UIPatcher : UIView <oscSocketProtocol,GraphicObjDelegate>

@property (nonatomic, retain) OscSocket *socket;
@property int patchId;
@property (nonatomic, retain) NSString *patchName;

+ (void)initialize;

+ (BOOL) editState;
+ (void) SetEditState: (BOOL) state;

- (id)initWithFrame:(CGRect)frame PatchId:(int) _id;
- (void) startWithHost:(NSString*) hostIp InPort:(int) _inPort OutPort:(int) _outPort;
-(void) sendPing;

-(IBAction)addButtonClick:(id)sender;
-(void) switchToEditMode;


// oscSocketProtocol
-(void) didReceiveOscContent;
-(void) isSendingOscContent;

// object protocol
-(void) sendOscValue:(int) objId value:(float) val;
@end
