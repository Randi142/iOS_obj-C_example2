//
//  TabThree.h
//  self-introduction
//
//  Created by Lecturer on 26/6/2019.
//

#import <UIKit/UIKit.h>

@interface TabThree : UIViewController{
    NSTimer *timer;
    
    int timeInt;
    int scoreInt;
    int gameMode;
}
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UIButton *startButton;
- (IBAction)startGame:(id)sender;

@end
