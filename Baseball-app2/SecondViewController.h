//
//  SecondViewController.h
//  Baseballapp
//
//  Created by matthew radke on 9/24/12.
//  Copyright (c) 2012 matthew radke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <GameKit/GameKit.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import <QuartzCore/QuartzCore.h>
#import <Twitter/Twitter.h>

@interface SecondViewController : UIViewController  <UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate> {
    
	
	
    UIImageView *animation9;
    UIImageView *imageView;
    BOOL newMedia;
    UIAlertView *objAlertView;
}
@property (nonatomic, retain) IBOutlet UIImageView *animation9;
@property (nonatomic, retain) IBOutlet UIImageView *imageView;
- (IBAction)useCamera;
- (IBAction)useCameraRoll;

-(IBAction)home:(id)sender;
-(IBAction)share:(id)sender;

@end
