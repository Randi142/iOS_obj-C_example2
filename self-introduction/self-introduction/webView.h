//
//  webView.h
//  self-introduction
//
//  Created by Lecturer on 26/6/2019.
//

#import <UIKit/UIKit.h>

@interface webView : UIViewController

@property (weak, nonatomic) IBOutlet UIWebView *browser;
- (IBAction)refresh:(id)sender;
- (IBAction)share:(id)sender;
- (IBAction)swipeDown:(id)sender;

@end
