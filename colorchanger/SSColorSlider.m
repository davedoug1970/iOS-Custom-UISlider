//
//  SSColorSlider.m
//  Version 1.0
//
//  Created by David Douglas on 7/22/11.
//  Copyright 2011 Software Smoothie. All rights reserved.
//
//  Licensing (Zlib)
//  This software is provided 'as-is', without any express or implied
//  warranty.  In no event will the authors be held liable for any damages
//  arising from the use of this software.
//
//  Permission is granted to anyone to use this software for any purpose,
//  including commercial applications, and to alter it and redistribute it
//  freely, subject to the following restrictions:
//
//  1. The origin of this software must not be misrepresented; you must not
//  claim that you wrote the original software. If you use this software
//  in a product, an acknowledgment in the product documentation would be
//  appreciated but is not required.
//  2. Altered source versions must be plainly marked as such, and must not be
//  misrepresented as being the original software.
//  3. This notice may not be removed or altered from any source distribution.

//  As a side note on using this code, you might consider giving some credit to me by
//	1) linking my website from your app's website 
//	2) or crediting me inside the app's credits page 
//	3) or a tweet mentioning @davedoug1970
//	

#import "SSColorSlider.h"


@implementation SSColorSlider

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setMinimumValue:0];
        [self setMaximumValue:.99999];
        [self setContinuous:YES];
        [self setValue:.50];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setMinimumValue:.00001];
        [self setMaximumValue:.99999];
        [self setContinuous:YES];
        [self setValue:.50000];
    }
    return self;
}
- (void)setValue:(float)value animated:(BOOL)animated
{
    [super setValue:value animated:animated];
    
    UIGraphicsBeginImageContext(CGSizeMake((self.frame.size.width * value),  self.frame.size.height/3));
    UIImage *colorSliderImg = [UIImage imageNamed:@"colorslider.png"];
    [colorSliderImg drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height/3)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [self setMinimumTrackImage:newImage forState:UIControlStateNormal];
    
    UIGraphicsBeginImageContext(CGSizeMake((self.frame.size.width * (1 - value)),  self.frame.size.height/3));
    [colorSliderImg drawInRect:CGRectMake(-(self.frame.size.width * value), 0, self.frame.size.width, self.frame.size.height/3)];
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [self setMaximumTrackImage:newImage forState:UIControlStateNormal];
}

@end
