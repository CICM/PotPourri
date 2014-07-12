//
//  GraphicObj.h
//  FreeOsc
//
//  Created by Manuel Deneu on 21/11/12.
//  Copyright (c) 2012 Manuel Deneu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GenericObject.h"


@protocol GraphicObjDelegate

- (void) askForEditObj:(NSNumber*) tag;
- (void) askForDeleteObj:(int) tag;

-(void) sendOscValue:(int) objId value:(float) val;
- (NSInteger) nextId;
@end




BOOL editState;
BOOL editOscState;



@interface GraphicObj : UIView
{
    NSString *textVal;
}

@property (nonatomic, retain) id<GraphicObjDelegate> delegate;

// propriétés pour l'OSC et tout et tout
@property (nonatomic, retain) GenericObject *oscObject;

@property NSString *label;
@property NSInteger objId;


+ (void)initialize;

+ (BOOL) editState;
+ (void) SetEditState: (BOOL) state;

+ (BOOL) editOscState;
+ (void) SetEditOscState: (BOOL) state;

-(void) sendOscValue;


//- (id)initWithFrameAndId:(CGRect)frame iD:(int) m_id;
- (id)initWithFrame:(CGRect)frame;
- (void)deleteObject:(UIGestureRecognizer*)recognizer;

-(NSString *) description;

@end
