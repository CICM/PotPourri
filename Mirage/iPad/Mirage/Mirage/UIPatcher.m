//
//  UIPatcher.m
//  Mirage
//
//  Created by Manuel Deneu on 04/06/13.
//  Copyright (c) 2013 Manuel Deneu. All rights reserved.
//

#import "UIPatcher.h"
#import "GraphicObj.h"
#import "Hfader.h"


@implementation UIPatcher
{
    UIButton *addObjectButton;
    
    NSMutableDictionary *objects;
    int objCounter;
}

@synthesize socket;
@synthesize patchId;
@synthesize patchName;

/* ******* ******* ******* ******* ******* ******* ******* ******* ******* ******* */

+ (void)initialize
{
    editState=FALSE;
    
}

+ (BOOL) editState
{
    return editState;
}

+ (void) SetEditState: (BOOL) state
{
    editState=state;
}

/* ******* ******* ******* ******* ******* ******* ******* ******* ******* ******* */

- (id)initWithFrame:(CGRect)frame PatchId:(int) _id
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setBackgroundColor:[UIColor colorWithRed:0.96 green:0.96 blue:0.96 alpha:1.0]];
        socket=[[OscSocket alloc] init];
        objects = [[NSMutableDictionary alloc] init];
        objCounter=0;
        
        [self createHSlider:0];
        
        addObjectButton = [UIButton buttonWithType:UIButtonTypeContactAdd];
        [addObjectButton setFrame:CGRectMake(50, 50,23 , 23)];
        [addObjectButton addTarget:self action:@selector(addButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        
        
    }
    return self;
}

- (void) startWithHost:(NSString*) hostIp InPort:(int) _inPort OutPort:(int) _outPort
{
    [socket setIpHost:hostIp];
    [socket setInUdpPort:_inPort];
    [socket setOutUdpPort:_outPort];
    [socket setDelegate:self]; 
    [socket startConnection];

}

-(IBAction)addButtonClick:(id)sender
{
    NSLog(@"add object");
}

-(void) switchToEditMode
{
    if (editState)
        [self addSubview:addObjectButton];
    else
        [addObjectButton removeFromSuperview];
}

-(void) sendPing
{
    OscMsg *msg=[[OscMsg alloc] initWithAdress:@"/mirage/" method:@"ping" objects:[NSNumber numberWithInt:patchId],nil];
    //[socket sendOscMsg:msg];
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    [self.patchName drawAtPoint:CGPointMake(300,300) withFont:[UIFont boldSystemFontOfSize:16.0]];
}


// oscSocketProtocol
-(void) didReceiveOscContent
{
    OscMsg *msg = [socket oscIn];
    NSLog(@"%@",msg);
    
    [socket sendOscMsg:msg];
    if ([msg.adress isEqualToString:@"miragebox/"])
    {
        ///////////////
        // remove object
        if ([msg.method isEqualToString:@"remove"])
        {
            NSLog(@"remove object");
            [self removeObject:[[msg.list objectAtIndex:0] intValue]];
        }
        /*
         ///////////////
         // remove ALL object
         if ([msg.method isEqualToString:@"removeAll"])
         {
         NSLog(@"remove object");
         [self removeAllObjects];
         }
         */
        ///////////////
        // set min and max
        if ([msg.method isEqualToString:@"setMinMax"])
        {
            NSLog(@"set min max %i",msg.list.count);
            float min = [[msg.list objectAtIndex:0] floatValue];
            float max = [[msg.list objectAtIndex:1] floatValue];
            int objId = [[msg.list objectAtIndex:2] intValue];
            [self setMinMaxValues:min max:max objId:objId];
        }
        
        ///////////////
        // add h slider
        if ([msg.method isEqualToString:@"addHSlider"])
        {
            NSLog(@"add slider");
            [self createHSlider:[[msg.list objectAtIndex:0] intValue] ];
        }
    }

}

-(void) isSendingOscContent
{
    
}
/* ****** ****** ****** ****** ****** ****** ****** ****** */
//
//  Objects
//
/* ****** ****** ****** ****** ****** ****** ****** ****** */

-(void) sendOscValue:(int) objId value:(float) val
{
    // NSLog(@"id %i value %f",objId,val);
    
    OscMsg *msg = [[OscMsg alloc] initWithAdress:@"/mira/" method:@"val" objects:[NSNumber numberWithInt:objId], [NSNumber numberWithFloat:val],nil];
    [socket sendOscMsg:msg];
    
}

/* ****** ****** ****** ****** ****** ****** ****** ****** */
//
//  Factory
//
/* ****** ****** ****** ****** ****** ****** ****** ****** */
-(void) removeAllObjects
{
    for (GraphicObj *obj in objects)
        [obj removeFromSuperview];
    
    
    [objects removeAllObjects];
}

-(void) removeObject:(int) objId
{
    [[objects objectForKey:[NSString stringWithFormat:@"%i",objId]] removeFromSuperview];
    [objects removeObjectForKey:[NSString stringWithFormat:@"%i",objId]];
    /*
     {
     NSLog(@"object found %i",obj.objId);
     
     }
     */
}

-(void) createHSlider:(int) objId
{
    Hfader *fader = [[Hfader alloc] initWithFrame:CGRectMake(50,  90*(objCounter+1), H_fader_width,H_fader_height)] ;
    [fader setObjId:objId];
    [fader setDelegate:self];
    [objects setObject:fader forKey:[NSString stringWithFormat:@"%i",objId]];
    [self addSubview:fader];
    objCounter++;
    
    
}

-(void) setMinMaxValues:(float) min max:(float) max objId:(int) objId
{
    GraphicObj *obj = [objects objectForKey:[NSString stringWithFormat:@"%i",objId]];
    [obj.oscObject setMinMappedVal:min];
    [obj.oscObject setMaxMappedVal:max];
}



@end
