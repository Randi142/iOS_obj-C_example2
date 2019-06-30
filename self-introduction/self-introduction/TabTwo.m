//
//  TabTwo.m
//  self-introduction
//
//  Created by Lecturer on 26/6/2019.
//

#import "TabTwo.h"
#import "AppDelegate.h"

@interface TabTwo (){
    AppDelegate* appGlobal;
}

@end

@implementation TabTwo

- (void)viewDidLoad {
    [super viewDidLoad];
    
    appGlobal = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:appGlobal.globalImage]];
    
    MKCoordinateRegion Residence; //create a location
    Residence.center.latitude = 22.31056;
    Residence.center.longitude = 114.22278;
    Residence.span.latitudeDelta = 0.007;   //scale
    Residence.span.longitudeDelta = 0.007;
    [self.mapView setRegion:Residence];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void) viewWillAppear:(BOOL)animated{ //refresh tab bar view
    [super viewWillAppear:animated];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:appGlobal.globalImage]];
}

- (IBAction)location:(id)sender {
    
    if (self.locationSeg.selectedSegmentIndex == 0){
        
        _textLabel.text = @"The is my residence";
        
        MKCoordinateRegion Residence; //create a location
        Residence.center.latitude = 22.3121714;
        Residence.center.longitude = 114.2242763;
        Residence.span.latitudeDelta = 0.007;   //scale
        Residence.span.longitudeDelta = 0.007;
        [self.mapView setRegion:Residence];
    }
    
    if (self.locationSeg.selectedSegmentIndex == 1){
        
        _textLabel.text = @"This is my school";
        
        MKCoordinateRegion School; //create a location
        School.center.latitude = 22.3903303;
        School.center.longitude = 114.1958548;
        School.span.latitudeDelta = 0.007;   //scale
        School.span.longitudeDelta = 0.007;
        [self.mapView setRegion:School];
    }
    
    
    
}
- (IBAction)googleMap:(id)sender {      //pass the link to webView
    
    if (self.locationSeg.selectedSegmentIndex == 0){    //choice of segment -> residence
        NSURL *url = [NSURL URLWithString:@"https://goo.gl/maps/6DND14yXFFthrGJ19"];
        [[UIApplication sharedApplication]openURL:url options:@{} completionHandler:nil];
    }
    
    if (self.locationSeg.selectedSegmentIndex == 1){    //choice of segment -> school
        NSURL *url = [NSURL URLWithString:@"https://goo.gl/maps/FwGLUTJgr9wnyigt5"];
        [[UIApplication sharedApplication]openURL:url options:@{} completionHandler:nil];
    }
}

@end
