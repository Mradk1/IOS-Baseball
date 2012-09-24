//
//  ThirdViewController.m
//  Baseballapp
//
//  Created by matthew radke on 9/24/12.
//  Copyright (c) 2012 matthew radke. All rights reserved.
//

#import "ThirdViewController.h"
#import "MasterViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController
@synthesize animation10;

- (IBAction)home:(id)sender
{
	MasterViewController *second =[[MasterViewController alloc] initWithNibName:nil bundle:nil];
	[self presentModalViewController:second animated:YES];
}
-(IBAction)Link3{
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/#!/AskMeMatty1"]];
}

- (void)viewDidLoad{
    NSArray *image =[NSArray arrayWithObjects:
                     [UIImage imageNamed:@"bALL1.tiff"],
                     [UIImage imageNamed:@"bALL2.tiff"],
                     [UIImage imageNamed:@"bALL3.tiff"],
                     [UIImage imageNamed:@"bALL4.tiff"],
                     [UIImage imageNamed:@"bALL5.tiff"],
                     [UIImage imageNamed:@"bALL6.tiff"],
                     [UIImage imageNamed:@"bALL7.tiff"],
                     [UIImage imageNamed:@"bALL8.tiff"],
                     [UIImage imageNamed:@"bALL9.tiff"],
                     [UIImage imageNamed:@"bALL10.tiff"],
                     [UIImage imageNamed:@"bALL1.tiff"],nil];
    animation10.animationImages = image;
    animation10.animationDuration = 0.37;
    animation10.animationRepeatCount = 0;
    
    [animation10 startAnimating];
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
