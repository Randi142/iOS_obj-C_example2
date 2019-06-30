//
//  musicPlayer.h
//  self-introduction
//
//  Created by Randi on 23/6/2019.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface musicPlayer : UIViewController <AVAudioPlayerDelegate>
- (IBAction)playPauseAudio:(id)sender;
- (IBAction)stopAudio:(id)sender;
- (IBAction)adjustVolume:(id)sender;
- (IBAction)progressSliderChanged:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *playPauseButton;
@property (weak, nonatomic) IBOutlet UISlider *VolumeSlider;
@property (weak, nonatomic) IBOutlet UISlider *progressSlider;
@property (weak, nonatomic) IBOutlet UILabel *currentTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *durationLabel;


@property (strong, nonatomic) AVAudioPlayer *audioPlayer;
@property (strong, nonatomic) NSTimer *sliderTimer;

- (NSString*)stringFromInterval:(NSTimeInterval)interval;
- (void) updateSlider;
- (IBAction)back:(id)sender;
- (IBAction)next:(id)sender;
- (IBAction)mode:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *modeButton;
@property (weak, nonatomic) IBOutlet UILabel *songName;

- (IBAction)swipeLeft:(id)sender;
- (IBAction)swipeRight:(id)sender;


@end
