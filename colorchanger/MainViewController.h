//
//  MainViewController.h
//  colorchanger
//
//  Created by Douglas, David on 7/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FlipsideViewController.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate> {

}

@property (nonatomic,retain) IBOutlet UILabel *valueLabel;
@property (nonatomic,retain) IBOutlet UISlider *customSlider;
@property (nonatomic,retain) IBOutlet UIImageView *testImage;

- (IBAction)showInfo:(id)sender;
- (IBAction)changedSlider1:(UISlider *)slider;
- (IBAction)changedSlider2:(UISlider *)slider;


@end
