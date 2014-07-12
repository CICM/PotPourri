//
//  OscMsg.h
//  DaemiaTest
//
//  Created by Manuel Deneu on 31/12/12.
//  Copyright (c) 2012 Manuel Deneu. All rights reserved.
//
//
//  L'objet comporte donc 3 propriétées:
//  - La liste des paramètres passsé en OSC dans une NSArray
//  - l'adresse  : NSString
//  - la méthode : NSString
//
// Le typage des variables n'est pas explicité, dans le cas de nombre, il s'agit d'un NSNumber, dans le cas d'une chaine de caractères, un NSString
// Il est possible de faire la différence int/float avec :
//  
// integer
//    if((strcmp([(NSNumber*)value objCType], @encode(int))) == 0)
//
// float
//     if((strcmp([(NSNumber*)value objCType], @encode(float))) == 0)



#import <Foundation/Foundation.h>

@interface OscMsg : NSObject <NSCopying>

@property(nonatomic, retain) NSString* adress;
@property(nonatomic, retain) NSString* method;
@property(nonatomic, retain) NSMutableArray* list;


-(id) init;
-(id) initWithAdress:(NSString *)_adress method:(NSString *)_method objects:(id) firstObj, ...;

-(id) copyWithZone: (NSZone *) zone;


-(NSString *)description;

@end
