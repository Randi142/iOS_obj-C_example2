//
//  DetailViewController.h
//  self-introduction
//
//  Created by Randi on 22/6/2019.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AudioToolbox/AudioToolbox.h>

@interface DetailViewController : UIViewController{
        SystemSoundID soundID;
}

@property (strong, nonatomic) IBOutlet UILabel *TitleLabel;

@property (strong, nonatomic) IBOutlet UILabel *DescriptionLabel;

@property (strong, nonatomic) IBOutlet UIImageView *ImageView;

@property (strong, nonatomic) NSArray *DetailModal;

@property (nonatomic, strong) MPMoviePlayerController *moviePlayerController;

- (IBAction)playMoive:(id)sender;
- (IBAction)share:(id)sender;

- (IBAction)meowButton:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *meow;

- (IBAction)wiki:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *labelOne;

- (IBAction)Filter:(id)sender;

@property (weak, nonatomic) IBOutlet UISwitch *FilterSwitch;

@property (weak, nonatomic) IBOutlet UISegmentedControl *FilterSeg;
- (IBAction)FilterControl:(id)sender;


@end
