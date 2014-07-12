//
//  GenericObject.h
//  FreeOsc
//
//  Created by Manuel Deneu on 07/12/12.
//  Copyright (c) 2012 Manuel Deneu. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface GenericObject : NSObject
{

}


@property int mappedValDigits;  // nombre de chiffres significatifs de la valeur mappée
@property int valDigits;        // nombre de chiffres significatifs de la valeur
// régle : val=3 : on affiche 3 chiffres après la virgule
//         val=2 : 2 chiffres après, etc.

@property float minVal;
@property float maxVal;
@property float minMappedVal;
@property float maxMappedVal;


@property float value;
@property float mappedValue;

@property BOOL loopBackValue;

@property (nonatomic, retain) NSString *adress;




- (id)init;

@end
