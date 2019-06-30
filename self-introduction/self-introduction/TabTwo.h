//
//  TabTwo.h
//  self-introduction
//
//  Created by Lecturer on 26/6/2019.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface TabTwo : UIViewController

@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *locationSeg;
@property (weak, nonatomic) IBOutlet UILabel *textLabel;
- (IBAction)location:(id)sender;

@end
