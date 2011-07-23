//
//  SSColorSlider.m
//  colorchanger
//
//  Created by David Douglas on 7/22/11.
//  Copyright 2011 Software Solutions. All rights reserved.
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
    
    UIGraphicsBeginImageContext(CGSizeMake((self.frame.size.width * value) + 9,  self.frame.size.height/3));
    UIImage *colorSliderImg = [UIImage imageNamed:@"colorslider.png"];
    [colorSliderImg drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height/3)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [self setMinimumTrackImage:newImage forState:UIControlStateNormal];
    
    UIGraphicsBeginImageContext(CGSizeMake((self.frame.size.width * (1 - value)) + 9,  self.frame.size.height/3));
    [colorSliderImg drawInRect:CGRectMake(-(self.frame.size.width * value), 0, self.frame.size.width, self.frame.size.height/3)];
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [self setMaximumTrackImage:newImage forState:UIControlStateNormal];
}

@end
