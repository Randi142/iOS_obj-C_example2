//
//  TabOne.h
//  self-introduction
//
//  Created by Randi on 22/6/2019.
//

#import <UIKit/UIKit.h>

@interface TabOne : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *animationView;
@property (weak, nonatomic) IBOutlet UIImageView *animationBackground;
@property (weak, nonatomic) IBOutlet UIButton *profilePic;
- (IBAction)profilePicButton:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *student;

@property (weak, nonatomic) IBOutlet UIButton *homeButton;

@property (weak, nonatomic) IBOutlet UISegmentedControl *themeSeg;
- (IBAction)theme:(id)sender;
@property (weak, nonatomic) IBOutlet UISegmentedControl *backgroundImageSeg;
- (IBAction)backgroundImage:(id)sender;
@property (weak, nonatomic) IBOutlet UISegmentedControl *musicSeg;
- (IBAction)music:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *muteImage;
- (IBAction)mute:(id)sender;

@property (weak, nonatomic) IBOutlet UIView *settingView;

- (IBAction)setting:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *settingButton;
@property (weak, nonatomic) IBOutlet UIButton *musicButton;
- (IBAction)musicPlayer:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *gitButton;

@end
