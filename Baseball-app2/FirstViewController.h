//
//  FirstViewController.h
//  Baseballapp
//
//  Created by matthew radke on 9/24/12.
//  Copyright (c) 2012 matthew radke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <AVFoundation/AVAudioPlayer.h>
#import <iAd/iAd.h>
#import <Security/SecRandom.h>
@interface FirstViewController : UIViewController <UIActionSheetDelegate, AVAudioPlayerDelegate> {
    
    
    int64_t  currentScore;
    IBOutlet UILabel *currentScoreLabel;
    AVAudioPlayer *theAudio;
    UIImageView *animation10;
    ADBannerView *banner1;
    IBOutlet	UILabel		*theQuestion;
    IBOutlet	UILabel		*theScore;
    IBOutlet	UILabel		*theLives;
    IBOutlet	UIButton	*answerOne;
    IBOutlet	UIButton	*answerTwo;
    IBOutlet	UIButton	*answerThree;
    IBOutlet	UIButton	*answerFour;
    IBOutlet    UIImageView *babeRuth;
    IBOutlet    UIImageView *calRipkin;
    IBOutlet    UIImageView *yogiBera;
    IBOutlet    UIImageView *georgeBrett;
    NSInteger Score;
    NSInteger myLives;
    NSInteger questionNumber;
    NSInteger rightAnswer;
    NSInteger time;
    NSArray *theQuiz;
    NSTimer *timer;
    BOOL questionLive;
    BOOL restartGame;
}
@property (nonatomic, assign) BOOL bannerIsVisible;
@property (nonatomic, retain) ADBannerView *banner1;
@property (nonatomic, assign) int64_t currentScore;
@property (nonatomic, retain) UILabel *currentScoreLabel;
@property (retain, nonatomic) UILabel	*theQuestion;
@property (retain, nonatomic) UILabel	*theScore;
@property (retain, nonatomic) UILabel	*theLives;
@property (retain, nonatomic) UIButton	*answerOne;
@property (retain, nonatomic) UIButton	*answerTwo;
@property (retain, nonatomic) UIButton	*answerThree;
@property (retain, nonatomic) UIButton	*answerFour;
@property (retain, nonatomic) NSArray *theQuiz;
@property (retain, nonatomic) NSTimer *timer;
@property (retain, nonatomic) UIImageView	*babeRuth;
@property (retain, nonatomic) UIImageView	*calRipken;
@property (retain, nonatomic) UIImageView   *yogiBera;
@property (retain, nonatomic) UIImageView	*georgeBrett;
@property (nonatomic, retain) IBOutlet UIImageView *animation10;

-(IBAction)home:(id)sender;
-(IBAction)buttonOne;
-(IBAction)buttonTwo;
-(IBAction)buttonThree;
-(IBAction)buttonFour;
- (IBAction) increaseScore;
-(void)updateScore;
-(void)loadQuiz;
-(IBAction)StopAudio;
-(void)countDown;

@end
