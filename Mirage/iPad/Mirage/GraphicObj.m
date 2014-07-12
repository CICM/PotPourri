//
//  GraphicObj.m
//  FreeOsc
//
//  Created by Manuel Deneu on 21/11/12.
//  Copyright (c) 2012 Manuel Deneu. All rights reserved.
//

#import "GraphicObj.h"
#import <QuartzCore/QuartzCore.h>

@implementation GraphicObj

@synthesize delegate = _delegate;

@synthesize label;
@synthesize objId;

@synthesize oscObject;

//- (id)initWithFrameAndId:(CGRect)frame iD:(int) m_id
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        oscObject = [[GenericObject alloc] init];
        
        
        self.objId=[self.delegate nextId];

        textVal = [[NSString alloc] initWithFormat: @"%.2f",self.oscObject.value];
        label = [[NSString alloc] initWithFormat: @"obj%i",self.objId];
        
        
        UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(deleteObject:)];
        [self setUserInteractionEnabled:YES];
        [self addGestureRecognizer:tap];
        tap.numberOfTapsRequired=2;
        
        UITapGestureRecognizer* doubleFingersTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(editObject:)];
        [self setUserInteractionEnabled:YES];
        [self addGestureRecognizer:doubleFingersTap];
        
        //doubleFingersTap.numberOfTapsRequired=1;
        //doubleFingersTap.numberOfTouchesRequired=2;
        
        doubleFingersTap.numberOfTapsRequired=1;
        doubleFingersTap.numberOfTouchesRequired=1;
        
    }
    return self;
}


+ (void)initialize
{
    editState=FALSE;
    editOscState=FALSE;
    
}

+ (BOOL) editState
{
    return editState;
}

+ (void) SetEditState: (BOOL) state
{
    editState=state;
}

+ (BOOL) editOscState
{
    return editOscState;
}

+ (void) SetEditOscState: (BOOL) state
{
    editOscState=state;
}



-(void)editObject:(UIGestureRecognizer*)recognizer
{
    if ( (editOscState) && ([recognizer state] == UIGestureRecognizerStateEnded) )
    {
        [_delegate askForEditObj:[NSNumber numberWithInt:self.objId] ];
    }
    
}

- (void)deleteObject:(UIGestureRecognizer*)recognizer
{
    if( (editState) && (!editOscState) &&([recognizer state] == UIGestureRecognizerStateEnded) )
    {
        CALayer *layer = self.layer;
        
        layer.opacity = 0.0;
        layer.transform = CATransform3DMakeScale(0.5, 0.5, 0.5);
        [UIView setAnimationDelegate:self];
        
        [UIView beginAnimations:@"anim" context:nil];
        
        [UIView setAnimationDidStopSelector:@selector(endOfAnimation)];
        
        [UIView setAnimationDuration:0.1];
        
        [UIView setAnimationDelay:0];
        [UIView setAnimationDelegate:self];
        
        layer.opacity = 1.0;
        layer.transform = CATransform3DIdentity;
        
        [UIView commitAnimations];
        
        //[self removeFromSuperview];
    
        
        [self.delegate askForDeleteObj:self.objId];
        
    }
}

-(void) sendOscValue
{
    [self.delegate sendOscValue:self.objId value:self.oscObject.mappedValue];
}

-(NSString *) description
{
    return [NSString stringWithFormat:@"Generic Object: %i ", self.objId];
}

@end
