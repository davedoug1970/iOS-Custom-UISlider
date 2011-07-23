//
//  MainViewController.m
//  colorchanger
//
//  Created by Douglas, David on 7/22/11.
//  Copyright 2011 Software Smoothie. All rights reserved.
//

#import "MainViewController.h"

@implementation MainViewController
@synthesize valueLabel;


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
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

- (IBAction)changedSlider:(UISlider *)slider
{
    [[self view] setBackgroundColor:[UIColor colorWithHue:([slider value]) saturation:.7 brightness:.7 alpha:1]];
    
    [[self valueLabel] setText:[NSString stringWithFormat:@"%f",([slider value])]];
    
    [[self view] setNeedsDisplay];
}

@end
