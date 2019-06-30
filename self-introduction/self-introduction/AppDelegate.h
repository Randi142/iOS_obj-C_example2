//
//  AppDelegate.h
//  PageViewDemo
//
//  Created by abc on 18/02/15.
//  Copyright (c) 2015 com.TheAppGuruz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    @public AVAudioPlayer * GlobalAudioPlayer;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSString* globalImage;
@property (strong, nonatomic) NSString* globalMusic;
@property (strong, nonatomic) NSString* WebLink;


@end

