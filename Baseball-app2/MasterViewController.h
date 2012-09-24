//
//  MasterViewController.h
//  Baseballapp
//
//  Created by matthew radke on 9/24/12.
//  Copyright (c) 2012 matthew radke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <iAd/iAd.h>
#import <Twitter/Twitter.h>

@interface MasterViewController : UIViewController <ADBannerViewDelegate,UIActionSheetDelegate>{
    
    ADBannerView *banner;
    UIImageView *animation;
    UIAlertView *objAlertView;
    UIActionSheet *sheet;
    
}
@property (nonatomic, retain) IBOutlet UIImageView *animation;
@property (nonatomic, assign) BOOL bannerIsVisible;
@property (nonatomic, retain) ADBannerView *banner;

-(IBAction)Link;
-(IBAction)view1:(id)sender;
-(IBAction)view2:(id)sender;
-(IBAction)view3:(id)sender;
-(IBAction)Tweetthis:(id)sender;
-(IBAction)askMe;
@end
