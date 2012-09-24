//
//  FirstViewController.m
//  Baseballapp
//
//  Created by matthew radke on 9/24/12.
//  Copyright (c) 2012 matthew radke. All rights reserved.
//

#import "FirstViewController.h"
#import "MasterViewController.h"
#import "Time.h"

@interface FirstViewController ()

@end

@implementation FirstViewController
@synthesize animation10;
@synthesize theQuestion;
@synthesize theScore;
@synthesize theLives;
@synthesize answerOne;
@synthesize answerTwo;
@synthesize answerThree;
@synthesize answerFour;
@synthesize theQuiz;
@synthesize timer;
@synthesize babeRuth;
@synthesize calRipken;
@synthesize yogiBera;
@synthesize georgeBrett;
@synthesize currentScore;
@synthesize currentScoreLabel;
@synthesize banner1, bannerIsVisible;
#define RANDOM_SEED() srandom(time(NULL))
#define RANDOM_INT(__MIN__, __MAX__) ((__MIN__) + random() % 56((__MAX__+1) - (__MIN__)))
- (void)bannerViewDidLoadAd:(ADBannerView *)abanner1 {
    if(!self.bannerIsVisible){
        [UIView beginAnimations:@"animatedAdBannerOn" context:NULL];
        banner1.frame = CGRectOffset(banner1. frame, 0.0, 50.0);
        [UIView commitAnimations];
        self.bannerIsVisible = YES;
    }
}
- (void)bannerView:(ADBannerView *)abanner {
    if(!self.bannerIsVisible){
        [UIView beginAnimations:@"animatedAdBannerOff" context:NULL];
        banner1.frame = CGRectOffset(banner1. frame, 0.0, -320.0);
        [UIView commitAnimations];
        self.bannerIsVisible = NO;
    }
}
- (IBAction)home:(id)sender
{
	MasterViewController *second =[[MasterViewController alloc] initWithNibName:nil bundle:nil];
    [self presentModalViewController:second animated:YES];
}
-(void)askQuestion
{
   
    [babeRuth setHidden:NO];
    [calRipkin setHidden:NO];
    [yogiBera setHidden:NO];
    [georgeBrett setHidden:NO];
    [answerOne setHidden:NO];
    [answerTwo setHidden:NO];
    [answerThree setHidden:NO];
    [answerFour setHidden:NO];
    
    questionLive = YES;
    
    time = 25.0;
    
   
    questionNumber = random() % 56;
    
    NSInteger row = 0;
    if (questionNumber == 1)
    {
        questionNumber = random() % 56;
    }
    else
    {
        questionNumber = random() % 56;
    }
    
  
    NSArray *question = [theQuiz objectAtIndex:questionNumber];
    NSString *activeQuestion = [question objectAtIndex:0];
    [answerOne setTitle:[question objectAtIndex:row+1] forState:UIControlStateNormal];
    [answerTwo setTitle:[question objectAtIndex:row+2] forState:UIControlStateNormal];
    [answerThree setTitle:[question objectAtIndex:row+3] forState:UIControlStateNormal];
    [answerFour setTitle:[question objectAtIndex:row+4] forState:UIControlStateNormal];
    rightAnswer = [[question objectAtIndex:row+5] intValue];
    theQuestion.text = activeQuestion;
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
    [activeQuestion release];
    
}
-(void)updateScore
{
    
    questionLive = NO;
    
    [timer invalidate];
    
    
    [babeRuth setHidden:YES];
    [calRipkin setHidden:YES];
    [yogiBera setHidden:YES];
    [georgeBrett setHidden:YES];
    [answerOne setHidden:YES];
    [answerTwo setHidden:YES];
    [answerThree setHidden:YES];
    [answerFour setHidden:YES];
    NSString *scoreUpdate = [[NSString alloc] initWithFormat:@"Score: %d", Score];
    theScore.text = scoreUpdate;
    currentScoreLabel.text = scoreUpdate;
    
    [scoreUpdate release];
    
    
    NSInteger endOfQuiz = [theQuiz count];
    if((((questionNumber - 1) * 6) + 6) == endOfQuiz)
    {
        if( Score > 0)
            
        {
            
            NSString *finishingStatement = [[NSString alloc] initWithFormat:@"That's game!\nNice going You should be in the Majors \nYou scored %i!", Score];
            theQuestion.text = finishingStatement;
            [finishingStatement release];
            
        }
        else
        {
            NSString *finishingStatement = [[NSString alloc] initWithFormat:@"That's game!\nWow. You're terrible! \nYou scored %i.", Score];
            theQuestion.text = finishingStatement;
            [finishingStatement release];
            
        }
        
        theLives.text = @"";
       
        restartGame = YES;
        [answerOne setHidden:NO];
        [answerOne setTitle:@"Restart the game" forState:UIControlStateNormal];
    }
    else
    {
       
        time = 7.0;
        
       
        timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
    }
}

-(void)countDown
{
   
    if(questionLive==YES)
    {
        time = time - 1;
        theLives.text = [NSString stringWithFormat:@"Time remaining: %i!", time];
        
        if(time == 0)
        {
            
            questionLive = NO;
            theQuestion.text = @"Sorry, you ran out of time!";
            Score = Score - 10;
            currentScore = currentScore - 10;
            [timer invalidate];
            [self updateScore];
        }
    }
  
    else
    {
        time = time - 1;
        theLives.text = [NSString stringWithFormat:@"Next question in...%i!", time];
        
        if(time == 0)
        {
            [timer invalidate];
            theLives.text = @"";
            [self askQuestion];
        }
    }
    if(time < 0)
    {
        [timer invalidate];
    }
}
- (IBAction)buttonOne
{
    if(questionNumber == 0){
        [answerTwo setHidden:NO];
        [answerThree setHidden:NO];
        [answerFour setHidden:NO];
        [self askQuestion];
    }
    else
    {
        NSInteger theAnswerValue = 1;
        [self checkAnswer:(int)theAnswerValue];
        if(restartGame==YES)
        {
        }
    }
}

- (IBAction)buttonTwo
{
    NSInteger theAnswerValue = 2;
    [self checkAnswer:(int)theAnswerValue];
}

- (IBAction)buttonThree
{
    NSInteger theAnswerValue = 3;
    [self checkAnswer:(int)theAnswerValue];
}

- (IBAction)buttonFour
{
    NSInteger theAnswerValue = 4;
    [self checkAnswer:(int)theAnswerValue];
}

-(void)checkAnswer:(int)theAnswerValue
{
    if(rightAnswer == theAnswerValue)
    {
        theQuestion.text = @"Wow You Are smart! Good work.";
        Score = Score + 10;
        currentScore = currentScore + 10;
        {
            NSArray *image =[NSArray arrayWithObjects:
                             [UIImage imageNamed:@"Runner1.tiff"],
                             [UIImage imageNamed:@"Runner2.tiff"],
                             [UIImage imageNamed:@"Runner3.tiff"],
                             [UIImage imageNamed:@"Runner4.tiff"],
                             [UIImage imageNamed:@"Runner5.tiff"],
                             [UIImage imageNamed:@"Runner6.tiff"],
                             [UIImage imageNamed:@"Runner7.tiff"],
                             [UIImage imageNamed:@"Runner8.tiff"],
                             [UIImage imageNamed:@"Runner9.tiff"],
                             [UIImage imageNamed:@"Runner10.tiff"],
                             [UIImage imageNamed:@"Runner11.tiff"],
                             [UIImage imageNamed:@"Runner12.1.tiff"],
                             [UIImage imageNamed:@"Runner12.2.tiff"],
                             [UIImage imageNamed:@"Runner12.3.tiff"],
                             [UIImage imageNamed:@"Runner12.4.tiff"],
                             [UIImage imageNamed:@"Runner12.5.tiff"],
                             [UIImage imageNamed:@"Runner12.6.tiff"],
                             [UIImage imageNamed:@"Runner12.tiff"],
                             [UIImage imageNamed:@"Runner13.tiff"],
                             [UIImage imageNamed:@"Runner14.tiff"],
                             [UIImage imageNamed:@"Runner15.tiff"],
                             [UIImage imageNamed:@"Runner16.tiff"],
                             [UIImage imageNamed:@"Runner17.tiff"],
                             [UIImage imageNamed:@"Runner18.tiff"],
                             [UIImage imageNamed:@"Runner19.tiff"],
                             [UIImage imageNamed:@"Runner20.tiff"],
                             [UIImage imageNamed:@"Runner21.tiff"],
                             [UIImage imageNamed:@"Runner22.tiff"],
                             [UIImage imageNamed:@"Runner23.tiff"],
                             [UIImage imageNamed:@"Runner24.tiff"],
                             [UIImage imageNamed:@"Runner25.tiff"], nil];
            animation10.animationImages = image;
            animation10.animationDuration = 3.25;
            animation10.animationRepeatCount = 1;
            
            [animation10 startAnimating];
            {
                NSString *path = [[NSBundle mainBundle] pathForResource:@"Cheering" ofType:@"mp3"];
                theAudio=[[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:NULL];
                theAudio.delegate=self;
                theAudio.volume = 0.01;
                theAudio.numberOfLoops = 0;
                [theAudio play];
                
            }
            
        }
    }
    else
    {
        theQuestion.text = @"Strike, you need to work alittle harder!";
        Score = Score - 10;
        currentScore = currentScore - 10;
        {
            NSString *path = [[NSBundle mainBundle] pathForResource:@"Booing" ofType:@"mp3"];
            theAudio=[[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:NULL];
            theAudio.delegate=self;
            theAudio.volume = 0.01;
            theAudio.numberOfLoops = 0;
            [theAudio play];
            
        }
    }
    [self updateScore];
    [self updatecurrentScore];
}

- (void) updatecurrentScore
{
    [self updateScore];
}
#pragma mark Action Methods
- (void) addTen;
{
	self.currentScore= self-> Score + 10;
	[self updatecurrentScore];
}


- (IBAction) increaseScore
{
    self.currentScore = self.currentScore + 0;
    currentScoreLabel.text = [NSString stringWithFormat: @"%lld", self.currentScore];
    
}
-(IBAction)StopAudio  {
    [theAudio stop];
}

- (void)dealloc {
	[theQuestion release];
	[theScore release];
	[theLives release];
	[answerOne release];
	[answerTwo release];
	[answerThree release];
	[answerFour release];
    [babeRuth release];
	[calRipkin release];
	[yogiBera release];
	[georgeBrett release];
	[theQuiz release];
	[timer release];
    [currentScoreLabel release];
    [theAudio release];
    [super dealloc];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

#pragma mark - View lifecycle

- (void)viewDidLoad{
    [super viewDidLoad];
    questionLive = NO;
    restartGame = NO;
    theQuestion.text = @"   Welcome to AskMeMLB Trivia! Think you know the Game better than your friends, huh? Lets see how Smart you are!";
    theScore.text = @"Score:0";
    currentScoreLabel.text =  @"Score:0";
    theLives.text = @"";
    questionNumber = 0;
    Score = 0;
    myLives = 0;
    [answerOne setTitle:@"Let's Play!" forState:UIControlStateNormal];
    [answerTwo setHidden:YES];
    [answerThree setHidden:YES];
    [answerFour setHidden:YES];
    [yogiBera setHidden:YES];
    [georgeBrett setHidden:YES];
    [babeRuth setHidden:YES];
    [self loadQuiz];
}



-(void)loadQuiz{
    
    NSArray *quizArray = [[NSArray alloc] initWithObjects:
                          
                          [NSArray arrayWithObjects: @" The New York Yankees have won the most World Series with 27. Which franchise has won the second most with 11?",@"RedSox", @"Cardinals", @"Dodgers", @"Reds", @"2",nil],
                          [NSArray arrayWithObjects:  @" Hypothetically what is the most hits a team can have in a 9 inning game without scoring a run?", @"9", @"27", @"45", @"54", @"4",
                           nil],
                          [NSArray arrayWithObjects:  @" Who is the only man to hit 60 or more home runs in 3 seasons?", @"Babe Ruth", @"Sammy Sosa", @"Barry Bonds", @"Mark McGwire", @"2",
                           nil],
                          [NSArray arrayWithObjects: @" Joe DiMaggio holds the record for consecutive game hitting streak. How many games is his streak?", @"56", @"44", @"63", @"52", @"1",
                           nil],
                          [NSArray arrayWithObjects: @" Which pitcher has the most losses in MLB history with 311?", @"Walter Johnson", @"Pud Galvin", @"Grover Cleveland Alexander", @"Cy Young", @"4",
                           nil],
                          [NSArray arrayWithObjects: @" Which pitcher recorded the most losses in a single season with 48?", @"Walter Johnson", @"Christy Mathewson", @"John Coleman", @"Cy Young", @"3",
                           nil],
                          [NSArray arrayWithObjects: @" Anthony Young holds the record for consecutive games lost. From May 6 1992 to July 24 1993 how many games in a row did he lose?", @"26", @"27", @"28", @"29", @"2",
                           nil],
                          [NSArray arrayWithObjects: @" On 4/23/1999 this man became the only man in MLB history to hit two grand-slams in the same inning off the same pitcher. Who accomplished this?", @"Mark McGwire", @"Sammy Sosa", @"Fernando Tatis", @"Alex Rodriguez", @"3",
                           nil],
                          [NSArray arrayWithObjects:@" Who has the highest career slugging percentage in MLB history?", @"Barry Bonds", @"Babe Ruth", @"Albert Pujols", @"Ted Williams", @"2",
                           nil],
                          [NSArray arrayWithObjects:@" Hank Aaron is second all-time in home runs with 755. How many season did he hit 50 or more home runs?", @"Zero", @"Two", @"Four", @"Six", @"1",
                           nil],
                          [NSArray arrayWithObjects:@" Who has the most career RBI?", @"Hank Aaron", @"Babe Ruth", @"Barry Bonds", @"Lou Gehrig", @"1",
                           nil],
                          [NSArray arrayWithObjects: @" Do the National and American Leagues use a different ball?", @"Yes", @"No", @"", @"", @"2",
                           nil],
                          [NSArray arrayWithObjects: @" How many balls are usually made available for use at the beginning of each major league game?", @"81", @"75", @"72", @"70", @"3",
                           nil],
                          [NSArray arrayWithObjects: @" Before a game an umpire removes the sheen from each new ball by rubbing it with river mud obtained from what location?", @"New York", @"New Jersey", @"Virgina", @"Texas", @"2",
                           nil],
                          [NSArray arrayWithObjects:@" The National Baseball Hall of Fame & Museum was created in what year", @"1935", @"1941", @"1933", @"1945", @"1",
                           nil],
                          [NSArray arrayWithObjects: @" Which teams played in the 1st World Series?", @"NewYork and Boston", @"Pittsburgh and New York", @"Pittsburgh and Boston", @"Baltimore and Boston", @"3",
                           nil],
                          [NSArray arrayWithObjects:@" What year was the first world Series played?", @"1910", @"1909", @"1901", @"1903", @"4",
                           nil],
                          [NSArray arrayWithObjects:@" Baltimore Orioleís shortstop Cal Ripken, Jr. played in how many strait games?", @"3,000", @"2,545", @"3,123", @"2,632", @"4",
                           nil],
                          [NSArray arrayWithObjects: @" Approximately how much does an official baseball weigh in Ounces?", @"7", @"9", @"5", @"3", @"3",
                           nil],
                          [NSArray arrayWithObjects: @" Approximately how big around is an official baseball?", @"9 Inches", @"5 Inches", @"3 Inches", @"7 Inches", @"1",
                           nil],
                          [NSArray arrayWithObjects: @" What is the maximum allowed length of a bat?", @"40 Inches", @"39 Inches",@"42 Inches", @"41 Inches", @"3",
                           nil],
                          [NSArray arrayWithObjects: @" The average life of a MLB is how many pitches?", @"9 to 10", @"5 to 6", @"4 to 5", @"6 to 7", @"4",
                           nil],
                          [NSArray arrayWithObjects:  @" Baseball stars from the National League and the American League played the first All-Star Game in what year?", @"1941", @"1933", @"1935", @"1940", @"2",
                           nil],
                          [NSArray arrayWithObjects: @" Was the first catcher to win the Rookie of the Year award?", @"Johnny Bench", @"Ivan Rodriguez", @"Yogi Berra", @"Jorge Posada", @"1",
                           nil],
                          [NSArray arrayWithObjects:  @" What clan consisting of Ray, Bob and Bret became the first three-generation family to play major league baseball?", @"Molina Family", @"Boone Family", @"Bonds Family", @"Feilder Family", @"2",
                           nil],
                          [NSArray arrayWithObjects: @" How many home run titles did Roger Maris win?", @"3", @"4", @"1", @"2", @"3",
                           nil],
                          [NSArray arrayWithObjects:  @" What player went the longest without a stolen base?", @"Frank Thomas", @"David Ortiz", @"Babe Ruth", @"Cecil Feilder", @"4",
                           nil],
                          [NSArray arrayWithObjects:  @" Who was the first hitter to reach 1,000 strikeouts?", @"Barry Bonds", @"Babe Ruth", @"Johnny Bench", @"Bobby Bonds", @"2",
                           nil],
                          [NSArray arrayWithObjects: @" Who is the only player to steal five bases in one game?", @"Jose Reyes", @"Tony Gwynn", @"Pete Rose", @"Ichiro Suzuki", @"2",
                           nil],
                          [NSArray arrayWithObjects: @" In what year was the first World Series played?", @"1900", @"1901", @"1902", @"1903", @"4",
                           nil],
                          [NSArray arrayWithObjects: @" What is the record for RBI in a season?", @"177", @"184", @"191", @"201", @"3",
                           nil],
                          [NSArray arrayWithObjects: @" What pitcher holds the record for most postseason wins with 19 ?", @"Bob Gibson", @"Andy Pettitte", @"Roger Clemens",  @"Tom Seaver", @"2",
                           nil],
                          [NSArray arrayWithObjects: @" Which of the following players did not win a triple crown ?", @"Babe Ruth", @"Ty Cobb", @"Ted Williams", @"Lou Gehrig", @"1",
                           nil],
                          [NSArray arrayWithObjects: @" Who is the oldest pitcher to throw  a complete game shutout? ", @"Nolan Ryan", @"Jamie Moyer", @"Phil Niekro", @"Cy Young",  @"2",
                           nil],
                          [NSArray arrayWithObjects: @" Which catcher caught the most no-hitters with 4 ?", @"Yogi Bera", @"Jason Varitek", @"Jorge Posada",  @" Roy Campanella", @"1",
                           nil],
                          [NSArray arrayWithObjects: @" Who has the longest game hitting streak by a rookie?", @"Benito Santiago", @"Joe Dimaggio", @"Derek Jeter", @"Nomar Garciaparra", @"1",
                           nil],
                          [NSArray arrayWithObjects:@" Which player scored the most runs in history?", @"Ty Cobb", @"Babe Ruth", @"Hank Aaron", @"Rickey Henderson", @"4",
                           nil],
                          [NSArray arrayWithObjects: @" Who has the most triples in history?",  @" Sam Crawford", @" Ty Cobb", @" Jose Reyes", @" Stan Musial", @"1",
                           nil],
                          [NSArray arrayWithObjects: @" Which of the following teams have not had a no-hitter?", @"San Diego Padres", @"New York Yankees", @"Boston Red Sox", @"Chicago White Sox", @"1",
                           nil],
                          [NSArray arrayWithObjects: @" Other than the Yankees, which franchise is the only one to have appeared in 4 straight World Series?", @"Giants", @"A’s", @"Tigers", @"Cardinals", @"1",
                           nil],
                          [NSArray arrayWithObjects: @" Which franchise holds the record for consecutive playoff appearances with 14?", @"Yankees", @"Cardinals", @"Braves", @"Athletics", @"3",
                           nil],
                          [NSArray arrayWithObjects: @" Which franchise holds the record for consecutive LCS appearances with 8?", @"Yankees", @"Braves", @"Cardinals", @"Tigers", @"2",
                           nil],
                          [NSArray arrayWithObjects: @" Who has the most grand-slams in major league history?", @"Babe Ruth", @"Hank Aaron", @"Lou Gehrig", @"Barry Bonds", @"3",
                           nil],
                          [NSArray arrayWithObjects: @" Who has the record for most grand-slams in a single season?", @"Lou Gehrig", @"Don Mattingly", @"Barry Bonds", @"Jackie Robinson", @"2",
                           nil],
                          [NSArray arrayWithObjects:@" What is the record for most rbi in a game?", @"7", @"8", @"12", @"15", @"3",
                           nil],
                          [NSArray arrayWithObjects:@" What is the record for most consecutive games with an RBI?", @"16", @"17", @"18", @"19", @"2",
                           nil],
                          [NSArray arrayWithObjects: @" How many times has a team been no-hit and still won the game?", @"0", @"1", @"2", @"3", @"2",
                           nil],
                          [NSArray arrayWithObjects: @" How many MVP awards has Derek Jeter won?", @"0", @"1", @"2", @"3", @"1",
                           nil],
                          [NSArray arrayWithObjects:@"In 1916 the Giants had the longest winning streak since 1900. How many games was their streak?", @"18", @"20", @"25", @"26", @"4",
                           nil],
                          [NSArray arrayWithObjects: @"Since 1900 what is the longest losing streak by a team?", @"23", @"24", @"25", @"26", @"1",
                           nil],
                          [NSArray arrayWithObjects: @"Since WWI how old was the youngest player to play in a MLB game?", @"15", @"16", @"17", @"18", @"1",
                           nil],
                          [NSArray arrayWithObjects:@"How many seasons did Lou Gehrig play every inning of every game?", @"1", @"4", @"8", @"10", @"1",
                           nil],
                          [NSArray arrayWithObjects: @"What ballpark was Pete Rose playing in when he broke Ty Cobb’s hit record?", @"Yankee Stadium", @"Wrigley Field", @"Riverfront Stadium", @"Candlestick Park", @"3",nil],
                          [NSArray arrayWithObjects:@"Who is second to Pete Rose in all time games played?", @"Ty Cobb", @"Carl Yastrzemski", @"Cal Ripken Jr", @"Hank Aaron", @"2",
                           nil],
                          [NSArray arrayWithObjects:@"Which franchise was the first to reach 10,000  losses?", @"Yankees", @"Phillies", @"Red Sox", @"Cubs", @"2",
                           nil],
                          [NSArray arrayWithObjects:@"What did Babe Ruth - Rogers Hornsby - Ted Williams and Willie Mays all do in their first career at-bat?", @"Strikeout", @"Walk", @"Double", @"Homer", @"1",
                           nil],
                          [NSArray arrayWithObjects:@"Whose single-season strokeout record did Nolan Ryan beat by one?", @"Walter Johnson", @"Bob Gibson", @"Sandy Koufax", @"Lefty Grove",@"3",
                           nil],
                          [NSArray arrayWithObjects:  @"What is the most innings a game has taken in MLB history?", @"25", @"26", @"27", @"28", @"2",
                           nil],
                          [NSArray arrayWithObjects:  @" How long was the shortest 9 inning game ever played?", @"50 min", @"51 min", @"60 min", @"61 min", @"2",
                           nil],
                          [NSArray arrayWithObjects:  @"How long was the longest 9 inning game ever played?", @"4 hr 30 min", @"4 hr 35 min", @"4 hr 40 min", @"4 hr 45 min", @"4",
                           nil],
                          [NSArray arrayWithObjects:  @"Who hold the record for striking out the most batters in a single game with 21?", @"Roger Clemens", @"Nolan Ryans", @"Dwight Gooden", @"Tom Cheney", @"4",
                           nil],
                          [NSArray arrayWithObjects: @"Which pitcher hold the record for most consecutive strikeouts with 10?", @"Tom Seaver", @"Nolan Ryan", @"Randy Johnson", @"Roger Clemens", @"1",
                           nil],
                          [NSArray arrayWithObjects:@"What is the most home runs in a game by a team?", @"8", @"10", @"12", @"14", @"2",
                           nil],
                          [NSArray arrayWithObjects: @"What player was intentionally walked the most times in their career?", @"Babe Ruth", @"Hank Aaron", @"Willie Mays", @"Barry Bonds", @"4",
                           nil],
                          [NSArray arrayWithObjects: @"Who has the record for consecutive scoreless innings pitched with 59?", @"Walter Johnson", @"Pedro Martinez", @"Orel Hershiser", @"Don Drysdale", @"3",
                           nil], nil];
    self.theQuiz = quizArray;
    [quizArray release];
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    self.currentScoreLabel = nil;
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
@end
