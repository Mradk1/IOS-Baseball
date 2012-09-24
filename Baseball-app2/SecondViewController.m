//
//  SecondViewController.m
//  Baseballapp
//
//  Created by matthew radke on 9/24/12.
//  Copyright (c) 2012 matthew radke. All rights reserved.
//

#import "SecondViewController.h"
#import <Twitter/Twitter.h>
#import "MasterViewController.h"

@interface SecondViewController ()

@end
@implementation SecondViewController
@synthesize animation9;
@synthesize imageView;
- (IBAction)home:(id)sender
{
	MasterViewController *second =[[MasterViewController alloc] initWithNibName:nil bundle:nil];
	[self presentModalViewController:second animated:YES];
}
- (IBAction)share:(id)sender
{
    UIGraphicsBeginImageContext(self.view.frame.size);
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    if ([TWTweetComposeViewController canSendTweet])
    {
        TWTweetComposeViewController *tweetSheet =
        [[TWTweetComposeViewController alloc] init];
        [tweetSheet setInitialText:@"Tweeting from AskMeMLB  !!!! : )"];
        [tweetSheet addImage:image];
        [self presentModalViewController:tweetSheet animated:YES];
    }
}



- (void) useCamera
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"ScreenShot"
                                                    message:@"Take a photo of your Face !!!"
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    [alert release];
    {
        
        if ([UIImagePickerController isSourceTypeAvailable:
             UIImagePickerControllerSourceTypeCamera])
        {
            UIImagePickerController *imagePicker =
            [[UIImagePickerController alloc] init];
            imagePicker.delegate = self;
            imagePicker.sourceType =
            UIImagePickerControllerSourceTypeCamera;
            imagePicker.mediaTypes = [NSArray arrayWithObjects:
                                      (NSString *) kUTTypeImage,
                                      nil];
            imagePicker.allowsEditing = NO;
            [self presentModalViewController:imagePicker
                                    animated:YES];
            [imagePicker release];
            newMedia = YES;
        }
    }
}
- (void) useCameraRoll
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"ScreenShot"
                                                    message:@"Take a photo of your Face !!!"
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    [alert release];
    {
        if ([UIImagePickerController isSourceTypeAvailable:
             UIImagePickerControllerSourceTypeSavedPhotosAlbum])
        {
            UIImagePickerController *imagePicker =
            [[UIImagePickerController alloc] init];
            imagePicker.delegate = self;
            imagePicker.sourceType =
            UIImagePickerControllerSourceTypePhotoLibrary;
            imagePicker.mediaTypes = [NSArray arrayWithObjects:
                                      (NSString *) kUTTypeImage,
                                      nil];
            imagePicker.allowsEditing = NO;
            [self presentModalViewController:imagePicker animated:YES];
            [imagePicker release];
            newMedia = NO;
        }
    }
}
-(void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSString *mediaType = [info
                           objectForKey:UIImagePickerControllerMediaType];
    [self dismissModalViewControllerAnimated:YES];
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage]) {
        UIImage *image = [info
                          objectForKey:UIImagePickerControllerOriginalImage];
        
        imageView.image = image;
        if (newMedia)
            UIImageWriteToSavedPhotosAlbum(image,
                                           self,
                                           @selector(image:finishedSavingWithError:contextInfo:),
                                           nil);
    }
    else if ([mediaType isEqualToString:(NSString *)kUTTypeMovie])
    {
	}
}
-(void)image:(UIImage *)image
finishedSavingWithError:(NSError *)error
 contextInfo:(void *)contextInfo
{
    if (error) {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle: @"Save failed"
                              message: @"Failed to save image"\
                              delegate: nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
        [alert show];
        [alert release];
    }
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissModalViewControllerAnimated:YES];
}
- (void)dealloc
{
    [imageView release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

#pragma mark - View lifecycle
- (void)viewDidLoad{
    
    [super viewDidLoad];
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
    animation9.animationImages = image;
    animation9.animationDuration = 0.37;
    animation9.animationRepeatCount = 0;
    
    [animation9 startAnimating];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.imageView = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
