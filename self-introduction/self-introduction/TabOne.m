//
//  TabOne.m
//  self-introduction
//
//  Created by Randi on 22/6/2019.
//
#define IMAGE_COUNT 90
#import "AppDelegate.h"
#import "TabOne.h"

@interface TabOne (){
    int profilePicSeq;
    BOOL pause;
    int backgroundInt;
    AppDelegate* appGlobal;
}

@end

@implementation TabOne
@synthesize animationView;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    appGlobal = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    pause = true;   //play bgm in default

    profilePicSeq = 1;
    NSMutableArray *images = [[NSMutableArray alloc] initWithCapacity:IMAGE_COUNT];
    int i;
    for (i=1; i<=IMAGE_COUNT; i++) {
        [images addObject:[UIImage imageNamed:[NSString stringWithFormat:@"cat_ (%d).png",i]]];
    }
    animationView.animationImages = [NSArray arrayWithArray:images];
    animationView.animationDuration = 0;
    [animationView startAnimating];
    [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(stopAnimation) userInfo:nil repeats:NO];
    _animationBackground.image = [UIImage imageNamed:@"animationWP.png"];
    
//    _name.hidden = YES;
//    _student.hidden = YES;
//    _profilePic.hidden = YES;
//    _homeButton.hidden = YES;
    _settingView.hidden = YES;
//    _settingButton.hidden = YES;
//    _musicButton.hidden = YES;
//    _gitButton.hidden = YES;
    
    [_name setAlpha:0.0];
    [_student setAlpha:0.0];
    [_profilePic setAlpha:0.0];
    [_homeButton setAlpha:0.0];
    [_settingButton setAlpha:0.0];
    [_musicButton setAlpha:0.0];
    [_gitButton setAlpha:0.0];
    
    [_backgroundImageSeg setSelectedSegmentIndex:0];
    [_themeSeg setSelectedSegmentIndex:2];
    [_musicSeg setSelectedSegmentIndex:0];
    
    [appGlobal setGlobalImage:@"Background1.jpg"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:appGlobal.globalImage]];
    _settingView.layer.cornerRadius = 60;
    backgroundInt = 0;
    
    UITabBarController* Tcontroller =(UITabBarController*)self.tabBarController;
    Tcontroller.tabBar.barTintColor=[UIColor whiteColor];
    
    
    
    UIImage *image = [UIImage imageNamed:@"logo.jpg"];
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];

    

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)stopAnimation{
    [animationView stopAnimating];
    _animationBackground.image = [UIImage imageNamed:@""];
    
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:3.0];
    
    [_name setAlpha:1.0];
    [_student setAlpha:1.0];
    [_profilePic setAlpha:1.0];
    [_homeButton setAlpha:1.0];
    [_settingButton setAlpha:1.0];
    [_musicButton setAlpha:1.0];
    [_gitButton setAlpha:1.0];
    
    [UIView commitAnimations];
//    _name.hidden = NO;
//    _student.hidden = NO;
//    _profilePic.hidden = NO;
//    _homeButton.hidden = NO;
//    _settingButton.hidden = NO;
//    _musicButton.hidden = NO;
//    _gitButton.hidden = NO;
}

- (IBAction)profilePicButton:(id)sender {

    if (profilePicSeq==1){
        [_profilePic setImage:[UIImage imageNamed:@"373.jpg"] forState:UIControlStateNormal];
        profilePicSeq++;
    }
    else if (profilePicSeq==2){
        [_profilePic setImage:[UIImage imageNamed:@"373(1).jpg"] forState:UIControlStateNormal];
        profilePicSeq++;
    }
    else if (profilePicSeq==3){
        [_profilePic setImage:[UIImage imageNamed:@"373(2).jpg"] forState:UIControlStateNormal];
        profilePicSeq = 1;
        UIAlertView*alert = [[UIAlertView alloc]initWithTitle:@"Alert"                                                  message:@"You press me too many times!!" delegate:nil cancelButtonTitle:@"OK"otherButtonTitles:nil];
        [alert show];
    }
    
    
}
- (IBAction)theme:(id)sender {
    
    if (self.themeSeg.selectedSegmentIndex == 0) {
        self.view.backgroundColor = [UIColor blackColor];
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
        _settingView.backgroundColor = [UIColor whiteColor];
        UITabBarController* Tcontroller =(UITabBarController*)self.tabBarController;
        Tcontroller.tabBar.barTintColor=[UIColor blackColor];
        [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
        self.backgroundImageSeg.enabled = NO;

    }
    if (self.themeSeg.selectedSegmentIndex == 1) {
        self.view.backgroundColor = [UIColor whiteColor];
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
        _settingView.backgroundColor = [UIColor grayColor];
        UITabBarController* Tcontroller =(UITabBarController*)self.tabBarController;
        Tcontroller.tabBar.barTintColor=[UIColor whiteColor];
        [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
        self.backgroundImageSeg.enabled = NO;
    }
    if (self.themeSeg.selectedSegmentIndex == 2) {
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
        _settingView.backgroundColor = [UIColor whiteColor];
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:appGlobal.globalImage]];
        [_backgroundImageSeg setSelectedSegmentIndex:backgroundInt];
        UITabBarController* Tcontroller =(UITabBarController*)self.tabBarController;
        Tcontroller.tabBar.barTintColor=[UIColor whiteColor];
        UIImage *image = [UIImage imageNamed:@"logo.jpg"];
        [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
        self.backgroundImageSeg.enabled = YES;
    }
    
}
- (IBAction)backgroundImage:(id)sender {
    
    
    
    if (self.backgroundImageSeg.selectedSegmentIndex == 0){
        [appGlobal setGlobalImage:@"Background1.jpg"];
        backgroundInt = 0;
    }
    if (self.backgroundImageSeg.selectedSegmentIndex == 1){
        [appGlobal setGlobalImage:@"Background2.jpg"];
        backgroundInt = 1;
    }
    if (self.backgroundImageSeg.selectedSegmentIndex == 2){
        [appGlobal setGlobalImage:@"Background3.jpg"];
        backgroundInt = 2;
    }
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:appGlobal.globalImage]];
    
}
- (IBAction)music:(id)sender {
    
    if (self.musicSeg.selectedSegmentIndex == 0){
        [appGlobal setGlobalMusic:@"bgm"];
    }
    if (self.musicSeg.selectedSegmentIndex == 1){
        [appGlobal setGlobalMusic:@"bgm2"];
    }
    if (self.musicSeg.selectedSegmentIndex == 2){
        [appGlobal setGlobalMusic:@"bgm3"];
    }
    [appGlobal->GlobalAudioPlayer stop];
    NSString *music = [[NSBundle mainBundle]pathForResource:appGlobal.globalMusic ofType:@"mp3"];  //play bgm in all controller
    appGlobal->GlobalAudioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:music] error:NULL]; //declare
    appGlobal->GlobalAudioPlayer.numberOfLoops = -1; //infinity loop
    [appGlobal->GlobalAudioPlayer play];
    
}
- (IBAction)mute:(id)sender {
    
    if (pause == true){
        pause = false;
        [appGlobal->GlobalAudioPlayer setVolume:0];
        [_muteImage setImage:[UIImage imageNamed:@"unmute.png"] forState:UIControlStateNormal];
    }
    else {
        pause = true;
        [appGlobal->GlobalAudioPlayer setVolume:1];
        [_muteImage setImage:[UIImage imageNamed:@"mute.png"] forState:UIControlStateNormal];
    }
    
}
- (IBAction)setting:(id)sender {
    
    if (self.settingView.hidden == YES) {
        self.settingView.hidden = NO;
    }
    else {
        self.settingView.hidden = YES;
    }
}
- (IBAction)musicPlayer:(id)sender {
    [appGlobal->GlobalAudioPlayer stop];
}

- (IBAction)wiki:(id)sender {   //pass the link to webView
    
    [appGlobal setWebLink:@"https://github.com/Randi142"];
    
}

- (void) viewWillAppear:(BOOL)animated{ //refresh tab bar view
    [super viewWillAppear:animated];
    [appGlobal->GlobalAudioPlayer play];
}
@end
