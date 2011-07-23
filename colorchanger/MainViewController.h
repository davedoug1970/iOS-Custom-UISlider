//
//  MainViewController.h
//  colorchanger
//
//  Created by Douglas, David on 7/22/11.
//  Copyright 2011 Software Smoothie. All rights reserved.
//

#import "FlipsideViewController.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate> {

}

@property (nonatomic,retain) IBOutlet UILabel *valueLabel;

- (IBAction)showInfo:(id)sender;
- (IBAction)changedSlider:(UISlider *)slider;

@end
