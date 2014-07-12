
//
//  OscMsg.m
//  DaemiaTest
//
//  Created by Manuel Deneu on 31/12/12.
//  Copyright (c) 2012 Manuel Deneu. All rights reserved.
//

#import "OscMsg.h"

@implementation OscMsg

@synthesize adress;
@synthesize method;
@synthesize list;


-(id) init
{
    if (self=[super init])
    {
        self.list = [[NSMutableArray alloc] init];
        return self;
    }
    else return nil;
}


-(id) initWithAdress:(NSString *)_adress method:(NSString *)_method objects:(id) firstObj, ...
{
    if (self = [super init])
    {
        [self setAdress:_adress];
        [self setMethod:_method];
        
        list = [[NSMutableArray alloc] init];
        va_list args;
        va_start(args, firstObj);
        
        for (id obj = firstObj; obj != nil; obj = va_arg(args, id))
        {
            [self.list addObject:obj];
        }
        va_end(args);
        
        return self;
    }
    else return nil;
}


-(id) copyWithZone: (NSZone *) zone
{
    OscMsg *aCopy = [[OscMsg allocWithZone: zone] init];
    
    [aCopy setList:list];
    [aCopy setMethod:method];
    [aCopy setAdress:adress];
    
    return aCopy;
}





-(NSString *)description
{
    return [NSString stringWithFormat:@"adress : %@ \n method : %@ \n list %@",self.adress, self.method,self.list]; 
}

@end
