//
//  MasterViewController.m
//  Baseballapp
//
//  Created by matthew radke on 9/24/12.
//  Copyright (c) 2012 matthew radke. All rights reserved.
//

#import "MasterViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"

@interface MasterViewController ()

@end


@implementation MasterViewController
@synthesize animation;
@synthesize banner, bannerIsVisible;

- (void)bannerViewDidLoadAd:(ADBannerView *)abanner {
    if(!self.bannerIsVisible){
        [UIView beginAnimations:@"animatedAdBannerOn" context:NULL];
        banner.frame = CGRectOffset(banner. frame, 0.0, 50.0);
        [UIView commitAnimations];
        self.bannerIsVisible = YES;
    }
}
- (void)bannerView:(ADBannerView *)abanner {
    if(!self.bannerIsVisible){
        [UIView beginAnimations:@"animatedAdBannerOff" context:NULL];
        banner.frame = CGRectOffset(banner. frame, 0.0, -320.0);
        [UIView commitAnimations];
        self.bannerIsVisible = NO;
    }
}

-(IBAction)view1:(id)sender
{
	FirstViewController *second =[[FirstViewController alloc] initWithNibName:nil bundle:nil];
	[self presentModalViewController:second animated:YES];
}
-(IBAction)view2:(id)sender
{
	SecondViewController *second =[[SecondViewController alloc] initWithNibName:nil bundle:nil];
	[self presentModalViewController:second animated:YES];
}
-(IBAction)view3:(id)sender
{
	ThirdViewController *second =[[ThirdViewController alloc] initWithNibName:nil bundle:nil];
	[self presentModalViewController:second animated:YES];
}
- (IBAction)Tweetthis:(id)sender {
    if([TWTweetComposeViewController canSendTweet]){
        NSLog(@"Twitter framework is available on the device");
        
        (NSClassFromString(@"TWTweetComposeViewController"));
        NSLog(@"Twitter framework is available on the device");
        
        TWTweetComposeViewController *twitterComposer = [[TWTweetComposeViewController alloc]init];
        [self presentModalViewController:twitterComposer animated:YES];
    }
}
-(IBAction)Link {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.facebook.com/pages/AskMeGames/340633016006061"]];
}
-(IBAction)askMe {
    sheet = [[UIActionSheet alloc] initWithTitle:@"AskMe Games"
                                        delegate:self
                               cancelButtonTitle:nil
                          destructiveButtonTitle:nil
                               otherButtonTitles:nil];
    sheet.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
    [sheet addButtonWithTitle:@"Woody"];
    [sheet addButtonWithTitle:@"AskMeMovies"];
    
    [sheet addButtonWithTitle:@"Cancel"];
    sheet.cancelButtonIndex = sheet.numberOfButtons-1;
    
    [sheet showInView:self.view];
    [sheet release];
}
- (void)willPresentActionSheet:(UIActionSheet *)actionSheet {
    [[actionSheet layer] setBackgroundColor:[UIColor blackColor].CGColor];
}
- (void)actionSheet:(UIActionSheet *)actionSheet
clickedButtonAtIndex:(NSInteger)buttonIndex {
	if (buttonIndex == actionSheet.cancelButtonIndex) { return; }
	switch (buttonIndex) {
		case 0:
		{
			NSLog(@"Woody Selected");
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://itunes.apple.com/us/app/woody-*the-whacky-tree/id530164612?mt=8"]];
			break;
		}
		case 1:
		{
			NSLog(@"AskMeMovies Selected");
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://itunes.apple.com/us/app/askmemovies*-are-you-film/id528142999?mt=8"]];
			break;
		}
	}
}
- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSLog(@"Button %d", buttonIndex);
}
- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

#pragma mark - View lifecycle

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
                     [UIImage imageNamed:@"bALL10.tiff"],nil];
    animation.animationImages = image;
    animation.animationDuration = 0.35;
    animation.animationRepeatCount = 0;
    
    [animation startAnimating];
    [super viewDidLoad];
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
@end
