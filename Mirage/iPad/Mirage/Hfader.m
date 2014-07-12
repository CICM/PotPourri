//
//  Hfader.m
//  FreeOsc
//
//  Created by Manuel Deneu on 21/11/12.
//  Copyright (c) 2012 Manuel Deneu. All rights reserved.
//

#import "Hfader.h"
#import <QuartzCore/QuartzCore.h>

@implementation Hfader
{
    UIView *cursorView;
    UIView *lineView;
    CGRect cursorFrame;
    
    float sliderLenght;
    
    CGPoint currentPoint;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setOpaque:NO];
        
        self.label = [[NSString alloc] initWithFormat: @"slider%i",self.objId];
        
        sliderLenght = self.bounds.size.width-50;
        
        cursorFrame.origin.x=0;
        cursorFrame.origin.y=0;
        cursorFrame.size.height=self.bounds.size.height;
        cursorFrame.size.width=grabber_size;
        
        lineView = [[UIView alloc] initWithFrame:CGRectMake( 0, (self.bounds.size.height/2)-1, sliderLenght, 2)];
        lineView.backgroundColor = [UIColor whiteColor];
        
        cursorView = [[UIView alloc] initWithFrame:cursorFrame];
        cursorView.backgroundColor = [UIColor redColor];
        
        currentPoint.x=self.oscObject.value;
        currentPoint.y=cursorView.bounds.size.height/2;
        [cursorView setCenter:currentPoint];
        
        
        self.layer.borderColor = [UIColor blueColor].CGColor;
        self.layer.borderWidth = 3.0f;
        
        
        
        [self addSubview:lineView];
        [self addSubview:cursorView];
        
        [self setUserInteractionEnabled:YES];
        
        
        
    }
    return self;
}



- (void)drawRect:(CGRect)rect
{

    [ [UIColor whiteColor] set];
//    textVal = [NSString stringWithFormat: @"%.2f",self.oscObject.mappedValue];
//    textVal = [NSString stringWithFormat:@"%i",self.objId];
    
    [[NSString stringWithFormat:@"%i",self.objId]
     drawAtPoint:CGPointMake(sliderLenght+10, 5) withFont:[UIFont boldSystemFontOfSize:16.0]];
    
    if (self.oscObject.mappedValDigits==3)
    [[NSString stringWithFormat: @"%.3f",self.oscObject.mappedValue]
     drawAtPoint:CGPointMake(sliderLenght+10, (H_fader_height/2)+5) withFont:[UIFont boldSystemFontOfSize:16.0]];
    
    if (self.oscObject.mappedValDigits==2)
        [[NSString stringWithFormat: @"%.2f",self.oscObject.mappedValue]
         drawAtPoint:CGPointMake(sliderLenght+10, (H_fader_height/2)+5) withFont:[UIFont boldSystemFontOfSize:16.0]];
    
    if (self.oscObject.mappedValDigits==1)
        [[NSString stringWithFormat: @"%.1f",self.oscObject.mappedValue]
         drawAtPoint:CGPointMake(sliderLenght+10, (H_fader_height/2)+5) withFont:[UIFont boldSystemFontOfSize:16.0]];
    

     
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self];
    
    if ( (!editState) && (!editOscState) ) 
    {
        if ((touchPoint.x>=0) && (touchPoint.x<=sliderLenght))
        {
            
            currentPoint.x=touchPoint.x;
            currentPoint.y=cursorView.bounds.size.height/2;
            [cursorView setCenter:currentPoint];
            
            [self.oscObject setMappedValue:[self setMappedValue] ];
            [self sendOscValue];
            
            [self setNeedsDisplay];
            
        }
    }
    
    if ((editState) && (!editOscState) )
    {
        // retrieve touch point
        UITouch *touch = [touches anyObject];
        CGPoint point = [touch locationInView:[self superview] ];
        
        [self setCenter:point];
    }
    
    
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

-(float) setMappedValue
{
    float var=( currentPoint.x/sliderLenght*(self.oscObject.maxMappedVal-self.oscObject.minMappedVal)) +self.oscObject.minMappedVal;
    
    return var;
}

@end
