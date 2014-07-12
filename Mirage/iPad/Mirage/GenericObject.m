//
//  GenericObject.m
//  FreeOsc
//
//  Created by Manuel Deneu on 07/12/12.
//  Copyright (c) 2012 Manuel Deneu. All rights reserved.
//

#import "GenericObject.h"

@implementation GenericObject

@synthesize mappedValDigits;
@synthesize valDigits;


@synthesize minVal;
@synthesize maxVal;
@synthesize minMappedVal;
@synthesize maxMappedVal;

@synthesize value;
@synthesize mappedValue;

@synthesize loopBackValue;
@synthesize adress;



- (id)init
{
    if ([super init])
    {
        adress = @"/adress/objetc";
        loopBackValue=TRUE;
        
        minVal=0.0;
        maxVal=1.0;
        
        minMappedVal=0.0;
        maxMappedVal=1.0;
        
        value=0.5;
        mappedValue=0.5;
        
        mappedValDigits=3;
    }
    
    return self;
}

////////////////////////////////////////////////////////////////////////////////
//
//      Accesseurs
//
////////////////////////////////////////////////////////////////////////////////
-(void) setMaxMappedVal:(float)val
{
    maxMappedVal=val;
    
    if ((maxMappedVal<10) && (maxMappedVal>=0)) mappedValDigits=3;
    if ((maxMappedVal<100) && (maxMappedVal>=10)) mappedValDigits=2;
    if ((maxMappedVal<1000) && (maxMappedVal>=100)) mappedValDigits=1;
    
}

-(float) maxMappedVal
{    
    return maxMappedVal;
}


@end
