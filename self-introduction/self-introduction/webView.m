//
//  webView.m
//  self-introduction
//
//  Created by Lecturer on 26/6/2019.
//

#import "webView.h"
#import "AppDelegate.h"

@interface webView (){
    AppDelegate* appGlobal;
    NSString *url ;
}

@end

@implementation webView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    appGlobal = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    
    NSLog(@"%@",appGlobal.WebLink);
    
    url = appGlobal.WebLink;    //recieve the link from other controller
    NSURL *pageurl = [NSURL URLWithString:url];
    NSURLRequest *requestObjurl = [NSURLRequest requestWithURL:pageurl];
    [_browser loadRequest:requestObjurl];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)refresh:(id)sender {
    [_browser reload];  //refresh website
}

- (IBAction)share:(id)sender {
    // share or copy link
    UIActivityViewController *controller =
    [[UIActivityViewController alloc]initWithActivityItems:@[url]applicationActivities:nil]; //url
    [self presentViewController:controller animated:YES completion:nil];
}

- (IBAction)swipeDown:(id)sender {
    [_browser reload];
}


@end
