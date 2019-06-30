//
//  DetailViewController.m
//  self-introduction
//
//  Created by Randi on 22/6/2019.
//

#import "DetailViewController.h"
#import "AppDelegate.h"

@interface DetailViewController (){
    AppDelegate* appGlobal;
}

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    appGlobal = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    _TitleLabel.text = _DetailModal[0];
    _DescriptionLabel.text = _DetailModal[1];
    _ImageView.image = [UIImage imageNamed:_DetailModal[2]];
    
    NSLog(@"The Array of DetailModal: %@, %@, %@", _DetailModal[0], _DetailModal[1], _DetailModal[2]);
    
    self.navigationItem.title = _DetailModal[0];
    
    NSURL *soundURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Cat" ofType:@"wav"]]; //sound ID
    AudioServicesCreateSystemSoundID((__bridge CFURLRef) soundURL, &soundID);
    
     self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:appGlobal.globalImage]];
    
    UIImage *image = [UIImage imageNamed:@"logo.jpg"];
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    
    _FilterSeg.enabled = NO;
    [ _FilterSeg setSelectedSegmentIndex:-1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)playMoive:(id)sender{
    
    NSString *movieName = _DetailModal[3];
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:movieName ofType:@"mp4"];
    
    NSURL *videoURL = [NSURL fileURLWithPath:filePath];
    
    self.moviePlayerController = [[MPMoviePlayerController alloc]initWithContentURL:videoURL];
    self.moviePlayerController.controlStyle = MPMovieControlStyleDefault;
    self.moviePlayerController.shouldAutoplay = YES;
    
    //    [super viewDidAppear:animated];
    
    [self.view addSubview:self.moviePlayerController.view];
    
    [self.moviePlayerController setFullscreen:YES animated:YES];
    
}

- (IBAction)share:(id)sender {
    
    NSString *title = _DetailModal[0];
    NSString *description = _DetailModal[1];
    UIImage *image = [UIImage imageNamed:_DetailModal[2]];
    
    UIActivityViewController *controller =
    [[UIActivityViewController alloc]
     initWithActivityItems:@[title, description, image]
     applicationActivities:nil];
    
    [self presentViewController:controller animated:YES completion:nil];

}

- (IBAction)meowButton:(id)sender {
    self.meow.hidden = NO;
    AudioServicesPlaySystemSound(soundID);
    [NSTimer scheduledTimerWithTimeInterval:1.3 target:self  selector:@selector (hideLabel) userInfo:nil repeats:NO];
    // meow label allows to appear 1.3s
}

-(void)hideLabel{
    self.meow.hidden = YES;
}


- (IBAction)wiki:(id)sender {
    if ([_labelOne.text isEqualToString:@"Ragdoll"])
        [appGlobal setWebLink:@"https://en.wikipedia.org/wiki/Ragdoll"];
    if ([_labelOne.text isEqualToString:@"American shorthair"])
        [appGlobal setWebLink:@"https://en.wikipedia.org/wiki/American_Shorthair"];
    if ([_labelOne.text isEqualToString:@"American curl"])
        [appGlobal setWebLink:@"https://en.wikipedia.org/wiki/American_Curl"];
}

- (void) viewWillAppear:(BOOL)animated{ //refresh tab bar view
    [super viewWillAppear:animated];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:appGlobal.globalImage]];
}
- (IBAction)Filter:(id)sender {
    if(_FilterSwitch.on == YES){
        _FilterSeg.enabled = YES;
    }
    if(_FilterSwitch.on == NO){
        _FilterSeg.enabled = NO;
        [ _FilterSeg setSelectedSegmentIndex:-1];
        if ([_labelOne.text isEqualToString:@"Ragdoll"]){
            _ImageView.image = [UIImage imageNamed:@"ragdoll.png"];
        }
        if ([_labelOne.text isEqualToString:@"American shorthair"]){
            _ImageView.image = [UIImage imageNamed:@"shorthair.png"];
        }
        if ([_labelOne.text isEqualToString:@"American curl"]){
            _ImageView.image = [UIImage imageNamed:@"curl.png"];
        }
    }
}


- (IBAction)FilterControl:(id)sender {
    if (self.FilterSeg.selectedSegmentIndex == 0){
        
        if ([_labelOne.text isEqualToString:@"Ragdoll"]){
        
            NSURL *fileNameAndPath = [[NSBundle mainBundle] URLForResource:@"ragdoll" withExtension:@"png"];
            CIImage *beginImage = [CIImage imageWithContentsOfURL:fileNameAndPath];
            CIFilter *filter = [CIFilter filterWithName:@"CISepiaTone"keysAndValues: kCIInputImageKey, beginImage,
                                @"inputIntensity", @0.8, nil];
        
            CIImage *outputImage = [filter outputImage];
            CIContext *context = [CIContext contextWithOptions:nil];
            CGImageRef imageRef = [context createCGImage:outputImage fromRect:beginImage.extent];
            UIImage *filteredImage = [UIImage imageWithCGImage:imageRef];
            [self.ImageView setContentMode:UIViewContentModeScaleAspectFit];
            self.ImageView.image = filteredImage;
        
        }
        
        if ([_labelOne.text isEqualToString:@"American shorthair"]){
        
            NSURL *fileNameAndPath = [[NSBundle mainBundle] URLForResource:@"shorthair" withExtension:@"png"];
            CIImage *beginImage = [CIImage imageWithContentsOfURL:fileNameAndPath];
            CIFilter *filter = [CIFilter filterWithName:@"CISepiaTone"keysAndValues: kCIInputImageKey, beginImage,
                                @"inputIntensity", @0.8, nil];
        
            CIImage *outputImage = [filter outputImage];
            CIContext *context = [CIContext contextWithOptions:nil];
            CGImageRef imageRef = [context createCGImage:outputImage fromRect:beginImage.extent];
            UIImage *filteredImage = [UIImage imageWithCGImage:imageRef];
            [self.ImageView setContentMode:UIViewContentModeScaleAspectFit];
            self.ImageView.image = filteredImage;
        
        }
        
        if ([_labelOne.text isEqualToString:@"American curl"]){
        
            NSURL *fileNameAndPath = [[NSBundle mainBundle] URLForResource:@"curl" withExtension:@"png"];
            CIImage *beginImage = [CIImage imageWithContentsOfURL:fileNameAndPath];
            CIFilter *filter = [CIFilter filterWithName:@"CISepiaTone"keysAndValues: kCIInputImageKey, beginImage,
                                @"inputIntensity", @0.8, nil];
        
            CIImage *outputImage = [filter outputImage];
            CIContext *context = [CIContext contextWithOptions:nil];    //for aspect fit
            CGImageRef imageRef = [context createCGImage:outputImage fromRect:beginImage.extent];
            UIImage *filteredImage = [UIImage imageWithCGImage:imageRef];
            [self.ImageView setContentMode:UIViewContentModeScaleAspectFit];
            self.ImageView.image = filteredImage;
        
        }
        
    }
    //****************************************************
    if (self.FilterSeg.selectedSegmentIndex == 1){
        
        if ([_labelOne.text isEqualToString:@"Ragdoll"]){
            
            NSURL *fileNameAndPath = [[NSBundle mainBundle] URLForResource:@"ragdoll" withExtension:@"png"];
            CIImage *beginImage = [CIImage imageWithContentsOfURL:fileNameAndPath];
            CIFilter *filter = [CIFilter filterWithName:@"CILineOverlay"keysAndValues: kCIInputImageKey, beginImage,
                                nil];
            
            CIImage *outputImage = [filter outputImage];
            CIContext *context = [CIContext contextWithOptions:nil];
            CGImageRef imageRef = [context createCGImage:outputImage fromRect:beginImage.extent];
            UIImage *filteredImage = [UIImage imageWithCGImage:imageRef];
            [self.ImageView setContentMode:UIViewContentModeScaleAspectFit];
            self.ImageView.image = filteredImage;
            
        }
        
        if ([_labelOne.text isEqualToString:@"American shorthair"]){
            
            NSURL *fileNameAndPath = [[NSBundle mainBundle] URLForResource:@"shorthair" withExtension:@"png"];
            CIImage *beginImage = [CIImage imageWithContentsOfURL:fileNameAndPath];
            CIFilter *filter = [CIFilter filterWithName:@"CILineOverlay"keysAndValues: kCIInputImageKey, beginImage,
                                nil];
            
            CIImage *outputImage = [filter outputImage];
            CIContext *context = [CIContext contextWithOptions:nil];
            CGImageRef imageRef = [context createCGImage:outputImage fromRect:beginImage.extent];
            UIImage *filteredImage = [UIImage imageWithCGImage:imageRef];
            [self.ImageView setContentMode:UIViewContentModeScaleAspectFit];
            self.ImageView.image = filteredImage;
            
        }
        
        if ([_labelOne.text isEqualToString:@"American curl"]){
            
            NSURL *fileNameAndPath = [[NSBundle mainBundle] URLForResource:@"curl" withExtension:@"png"];
            CIImage *beginImage = [CIImage imageWithContentsOfURL:fileNameAndPath];
            CIFilter *filter = [CIFilter filterWithName:@"CILineOverlay"keysAndValues: kCIInputImageKey, beginImage,
                                nil];
            
            CIImage *outputImage = [filter outputImage];
            CIContext *context = [CIContext contextWithOptions:nil];    //for aspect fit
            CGImageRef imageRef = [context createCGImage:outputImage fromRect:beginImage.extent];
            UIImage *filteredImage = [UIImage imageWithCGImage:imageRef];
            [self.ImageView setContentMode:UIViewContentModeScaleAspectFit];
            self.ImageView.image = filteredImage;
            
        }

    }
    //****************************************************
    if (self.FilterSeg.selectedSegmentIndex == 2){
        
        if ([_labelOne.text isEqualToString:@"Ragdoll"]){
            
            NSURL *fileNameAndPath = [[NSBundle mainBundle] URLForResource:@"ragdoll" withExtension:@"png"];
            CIImage *beginImage = [CIImage imageWithContentsOfURL:fileNameAndPath];
            CIFilter *filter = [CIFilter filterWithName:@"CIPhotoEffectProcess"
                                          keysAndValues: kCIInputImageKey, beginImage,nil];
            
            CIImage *outputImage = [filter outputImage];
            CIContext *context = [CIContext contextWithOptions:nil];
            CGImageRef imageRef = [context createCGImage:outputImage fromRect:beginImage.extent];
            UIImage *filteredImage = [UIImage imageWithCGImage:imageRef];
            [self.ImageView setContentMode:UIViewContentModeScaleAspectFit];
            self.ImageView.image = filteredImage;
            
        }
        
        if ([_labelOne.text isEqualToString:@"American shorthair"]){
            
            NSURL *fileNameAndPath = [[NSBundle mainBundle] URLForResource:@"shorthair" withExtension:@"png"];
            CIImage *beginImage = [CIImage imageWithContentsOfURL:fileNameAndPath];
            CIFilter *filter = [CIFilter filterWithName:@"CIPhotoEffectProcess"
                                          keysAndValues: kCIInputImageKey, beginImage,nil];
            
            CIImage *outputImage = [filter outputImage];
            CIContext *context = [CIContext contextWithOptions:nil];
            CGImageRef imageRef = [context createCGImage:outputImage fromRect:beginImage.extent];
            UIImage *filteredImage = [UIImage imageWithCGImage:imageRef];
            [self.ImageView setContentMode:UIViewContentModeScaleAspectFit];
            self.ImageView.image = filteredImage;
            
        }
        
        if ([_labelOne.text isEqualToString:@"American curl"]){
            
            NSURL *fileNameAndPath = [[NSBundle mainBundle] URLForResource:@"curl" withExtension:@"png"];
            CIImage *beginImage = [CIImage imageWithContentsOfURL:fileNameAndPath];
            CIFilter *filter = [CIFilter filterWithName:@"CIPhotoEffectProcess"
                                          keysAndValues: kCIInputImageKey, beginImage,nil];
            
            CIImage *outputImage = [filter outputImage];
            CIContext *context = [CIContext contextWithOptions:nil];    //for aspect fit
            CGImageRef imageRef = [context createCGImage:outputImage fromRect:beginImage.extent];
            UIImage *filteredImage = [UIImage imageWithCGImage:imageRef];
            [self.ImageView setContentMode:UIViewContentModeScaleAspectFit];
            self.ImageView.image = filteredImage;
            
        }
    }
}
@end
