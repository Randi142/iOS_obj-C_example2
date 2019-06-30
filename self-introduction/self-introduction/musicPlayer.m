//
//  musicPlayer.m
//  self-introduction
//
//  Created by Randi on 23/6/2019.
//

#import "musicPlayer.h"
#import "AppDelegate.h"

@interface musicPlayer (){
    AppDelegate* appGlobal;
    int musicControl;
    BOOL loop;
    NSArray *pic;
    NSArray *song;
}

@end

@implementation musicPlayer

- (void)viewDidLoad {
    [super viewDidLoad];
    appGlobal = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:appGlobal.globalImage]];
    
    musicControl = 0;
    pic = [NSArray arrayWithObjects:@"songPic1.png",@"songPic2.png",@"songPic3.png",nil];
    song = [NSArray arrayWithObjects:@"song1",@"song2",@"song3",nil];
    
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"bgm1" ofType:@"mp3"]];
    
    NSError *error;
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    _audioPlayer.numberOfLoops = -1;
    if (error){
        NSLog(@"Error: %@",error.localizedDescription);
    }
    else {
        self.audioPlayer.delegate = self;
        self.progressSlider.value = 0.0;
        self.VolumeSlider.value = 0.5;
        self.durationLabel.text = [self stringFromInterval:self.audioPlayer.duration];
    }
    
    if (self.audioPlayer.duration <= 3600){
        self.currentTimeLabel.text = [NSString stringWithFormat:@"00:00"];
    }
    else {
        self.currentTimeLabel.text = [NSString stringWithFormat:@"0:00:00"];
    }
    
    [self.currentTimeLabel sizeToFit];
    [self.audioPlayer prepareToPlay];
}

-(NSString *)stringFromInterval:(NSTimeInterval)interval{
    
    NSInteger ti = (NSInteger)interval;
    
    int sekunden = ti % 60;
    int minuten = (ti / 60) % 60;
    int stunden = (ti / 3600);
    
    if(ti <= 3600){
        return [NSString stringWithFormat:@"%02d:%02d",minuten,sekunden];
    }
    
    return [NSString stringWithFormat:@"%d:%02d:%02d",stunden,minuten,sekunden];
}

-(void)updateSlider{
    
    self.progressSlider.value = self.audioPlayer.currentTime;
    self.currentTimeLabel.text = [self stringFromInterval:self.audioPlayer.currentTime];
    
}

- (IBAction)back:(id)sender {
        [self.audioPlayer stop];
    if (musicControl == 0){
        musicControl = 2;
        NSString *music = [[NSBundle mainBundle]pathForResource:@"bgm3" ofType:@"mp3"];
        self.audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:music] error:NULL];
        [self.audioPlayer play];
    }
    else if (musicControl == 1){
        musicControl = 0;
        NSString *music = [[NSBundle mainBundle]pathForResource:@"bgm1" ofType:@"mp3"];
        self.audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:music] error:NULL];
        [self.audioPlayer play];
    }
    else if (musicControl == 2){
        musicControl = 1;
        NSString *music = [[NSBundle mainBundle]pathForResource:@"bgm2" ofType:@"mp3"];
        self.audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:music] error:NULL];
        [self.audioPlayer play];
    }
    _imageView.image = [UIImage imageNamed:pic[musicControl]];
    _songName.text = song [musicControl];
}

- (IBAction)next:(id)sender {
    [self.audioPlayer stop];
    if (musicControl == 0){
        musicControl++;
        NSString *music = [[NSBundle mainBundle]pathForResource:@"bgm2" ofType:@"mp3"];
        self.audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:music] error:NULL];
        [self.audioPlayer play];
    }
    else if (musicControl == 1){
        musicControl++;
        NSString *music = [[NSBundle mainBundle]pathForResource:@"bgm3" ofType:@"mp3"];
        self.audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:music] error:NULL];
        [self.audioPlayer play];
    }
    else if (musicControl == 2){
        musicControl = 0;
        NSString *music = [[NSBundle mainBundle]pathForResource:@"bgm1" ofType:@"mp3"];
        self.audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:music] error:NULL];
        [self.audioPlayer play];
    }
    _imageView.image = [UIImage imageNamed:pic[musicControl]];
    _songName.text = song [musicControl];
}

- (IBAction)mode:(id)sender {
    if (loop == true){
        _audioPlayer.numberOfLoops = 0;
        loop = false;
        [_modeButton setImage:[UIImage imageNamed:@"replay(1).png"] forState:UIControlStateNormal];
    }
    else if (loop == false){
        _audioPlayer.numberOfLoops = -1;
        loop = true;
        [_modeButton setImage:[UIImage imageNamed:@"replay.png"] forState:UIControlStateNormal];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)playPauseAudio:(id)sender {
    
    if (!self.audioPlayer.playing){
        self.progressSlider.maximumValue = self.audioPlayer.duration;
        
        self.sliderTimer =  [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateSlider) userInfo:nil repeats:YES];
        
        [self.progressSlider addTarget:self action:@selector(progressSliderChanged:) forControlEvents:UIControlEventValueChanged];
        
        [self.audioPlayer play];
        [_playPauseButton setImage:[UIImage imageNamed:@"pause.png"] forState:UIControlStateNormal];
        _imageView.image = [UIImage imageNamed:pic[musicControl]];
        _songName.text = song [musicControl];
    }
    else if (self.audioPlayer.playing){
        [self.audioPlayer pause];
        [_playPauseButton setImage:[UIImage imageNamed:@"play-button.png"] forState:UIControlStateNormal];
        _imageView.image = [UIImage imageNamed:pic[musicControl]];
        _songName.text = song [musicControl];
    }
}

- (IBAction)stopAudio:(id)sender {
    
    if (self.audioPlayer.isPlaying){
        [self.audioPlayer stop];
    }
    
    [self.audioPlayer setCurrentTime:0.0];
    [self.sliderTimer invalidate];
    self.progressSlider.value = 0.0;
    
    if (self.audioPlayer.duration <= 3600){
        self.currentTimeLabel.text = [NSString stringWithFormat:@"00:00"];
    }
    else {
        self.currentTimeLabel.text = [NSString stringWithFormat:@"0:00:00"];
    }
    
    [self.currentTimeLabel sizeToFit];
    [_playPauseButton setImage:[UIImage imageNamed:@"play-button.png"] forState:UIControlStateNormal];
    
}

- (IBAction)adjustVolume:(id)sender {
    
    if (self.audioPlayer != nil){
        self.audioPlayer.volume = self.VolumeSlider.value;
    }
}

- (IBAction)progressSliderChanged:(id)sender {
    
    [self.audioPlayer stop];
    [self.audioPlayer setCurrentTime:self.progressSlider.value];
    [self.audioPlayer prepareToPlay];
    [self.audioPlayer play];
    
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
    
    if (flag){
        [self stopAudio:nil];
    }
}

- (IBAction)swipeLeft:(id)sender {
    
    [self.audioPlayer stop];
    if (musicControl == 0){
        musicControl = 2;
        NSString *music = [[NSBundle mainBundle]pathForResource:@"bgm3" ofType:@"mp3"];
        self.audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:music] error:NULL];
        [self.audioPlayer play];
    }
    else if (musicControl == 1){
        musicControl = 0;
        NSString *music = [[NSBundle mainBundle]pathForResource:@"bgm1" ofType:@"mp3"];
        self.audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:music] error:NULL];
        [self.audioPlayer play];
    }
    else if (musicControl == 2){
        musicControl = 1;
        NSString *music = [[NSBundle mainBundle]pathForResource:@"bgm2" ofType:@"mp3"];
        self.audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:music] error:NULL];
        [self.audioPlayer play];
    }
    _imageView.image = [UIImage imageNamed:pic[musicControl]];
    _songName.text = song [musicControl];
}

- (IBAction)swipeRight:(id)sender {
    
    [self.audioPlayer stop];
    if (musicControl == 0){
        musicControl++;
        NSString *music = [[NSBundle mainBundle]pathForResource:@"bgm2" ofType:@"mp3"];
        self.audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:music] error:NULL];
        [self.audioPlayer play];
    }
    else if (musicControl == 1){
        musicControl++;
        NSString *music = [[NSBundle mainBundle]pathForResource:@"bgm3" ofType:@"mp3"];
        self.audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:music] error:NULL];
        [self.audioPlayer play];
    }
    else if (musicControl == 2){
        musicControl = 0;
        NSString *music = [[NSBundle mainBundle]pathForResource:@"bgm1" ofType:@"mp3"];
        self.audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:music] error:NULL];
        [self.audioPlayer play];
    }
    _imageView.image = [UIImage imageNamed:pic[musicControl]];
    _songName.text = song [musicControl];
}
@end
