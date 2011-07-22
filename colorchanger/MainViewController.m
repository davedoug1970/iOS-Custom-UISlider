//
//  MainViewController.m
//  colorchanger
//
//  Created by Douglas, David on 7/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MainViewController.h"

@implementation MainViewController
@synthesize valueLabel,customSlider,testImage;


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (![self customSlider])
    {
        CGRect frame = CGRectMake(19, 341, 282, 17);
        [self setCustomSlider:[[UISlider alloc] initWithFrame:frame]];
        [customSlider addTarget:self action:@selector(changedSlider1:) forControlEvents:UIControlEventValueChanged];
        
        [customSlider setMinimumValue:0];
        [customSlider setMaximumValue:.99999];
        [customSlider setContinuous:YES];
        [customSlider setValue:.50];
        [customSlider setThumbImage: [UIImage imageNamed:@"marker.png"] forState:UIControlStateNormal];
        [customSlider setThumbImage: [UIImage imageNamed:@"marker.png"] forState:UIControlStateSelected];
        [customSlider setThumbImage: [UIImage imageNamed:@"marker.png"] forState:UIControlStateHighlighted];
        [customSlider setBackgroundColor:[UIColor clearColor]];
        
        [[self view] addSubview:customSlider];
    }
    
    UIGraphicsBeginImageContext(CGSizeMake((282 * [customSlider value]),  9));
    UIImage *colorSliderImg = [UIImage imageNamed:@"colorslider.png"];
    [colorSliderImg drawInRect:CGRectMake(0, 0, 282, 9)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [customSlider setMinimumTrackImage:newImage forState:UIControlStateNormal];
    
    UIGraphicsBeginImageContext(CGSizeMake((282 * (1 - [customSlider value])),  9));
    [colorSliderImg drawInRect:CGRectMake(-(282 * [customSlider value]), 0, 282, 9)];
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [customSlider setMaximumTrackImage:newImage forState:UIControlStateNormal];
    [[self testImage] setImage:newImage];
}


- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller
{
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)showInfo:(id)sender
{    
    FlipsideViewController *controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideView" bundle:nil];
    controller.delegate = self;
    
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:controller animated:YES];
    
    [controller release];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload
{
    [self setValueLabel:nil];
    
    [super viewDidUnload];

    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)dealloc
{
    [valueLabel release];
    [super dealloc];
}

- (IBAction)changedSlider1:(UISlider *)slider
{
    [[self view] setBackgroundColor:[UIColor colorWithHue:[slider value] saturation:.7 brightness:.7 alpha:1]];
    
    [[self valueLabel] setText:[NSString stringWithFormat:@"%f",[slider value]]];
    
    UIGraphicsBeginImageContext(CGSizeMake((282 * [customSlider value]),  9));
    UIImage *colorSliderImg = [UIImage imageNamed:@"colorslider.png"];
    [colorSliderImg drawInRect:CGRectMake(0, 0, 282, 9)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [customSlider setMinimumTrackImage:newImage forState:UIControlStateNormal];
    
    UIGraphicsBeginImageContext(CGSizeMake((282 * (1 - [customSlider value])),  9));
    [colorSliderImg drawInRect:CGRectMake(-(282 * [customSlider value]), 0, 282, 9)];
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [customSlider setMaximumTrackImage:newImage forState:UIControlStateNormal];
    
    [[self view] setNeedsDisplay];
}

- (IBAction)changedSlider2:(UISlider *)slider
{
    [[self view] setBackgroundColor:[UIColor colorWithHue:([slider value]/255) saturation:.7 brightness:.7 alpha:1]];
    
    [[self valueLabel] setText:[NSString stringWithFormat:@"%f",([slider value]/255)]];
    
    [[self view] setNeedsDisplay];
}

@end
