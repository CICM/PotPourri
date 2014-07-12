//
//  constants.h
//  Mirage
//
//  Created by Manuel Deneu on 28/05/13.
//  Copyright (c) 2013 Manuel Deneu. All rights reserved.
//

#ifndef Mirage_constants_h
#define Mirage_constants_h


#define SLIDER_HEIGHT 140
#define SLIDER_WIDTH  20



typedef enum
{
    hFader,
    vFader,
    button,
    switche
}objType;


// tailles
#define grabber_size 15
#define H_fader_width 300
#define H_fader_height 45

#define V_fader_width 45
#define V_fader_height 300

#define button_width 45
#define button_height 45

#define switch_width 60
#define switch_height 30


// couleurs
#define blueIannix [UIColor colorWithRed:0 green:0.7304 blue:1 alpha:1]

// triggers
#define trigger_highLightedColor [UIColor colorWithWhite:1.0 alpha:0.8];
#define trigger_activeColor [UIColor colorWithRed:0 green:0.7304 blue:1 alpha:1];
#define trigger_inactiveColor [UIColor colorWithRed:1 green:1 blue:1 alpha:0.3593];




#endif
