//
//  MMViewController.m
//  MapView
//
//  Created by RHINO on 2/25/13.
//  Copyright (c) 2013 RHINO. All rights reserved.
//

#import "MMViewController.h"
#import <MapKit/MapKit.h>
#import "MMAnnotation.h"

@interface MMViewController ()
{
    IBOutlet MKMapView *myMapView;
}

@end

@implementation MMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    CLLocationCoordinate2D mmCoordinate = {.latitude = 41.894032,
                                          .longitude = -87.634742};
    
    MKCoordinateSpan span = {.latitudeDelta = 0.02f,
                            .longitudeDelta = 0.02f};
    
    MKCoordinateRegion myRegion = {mmCoordinate, span};
    
    MMAnnotation *myAnnotation = [[MMAnnotation alloc] init];
    myAnnotation.title = @"MobileMakers";
    myAnnotation.coordinate = mmCoordinate;
    myAnnotation.subtitle = @"I am here!";
    
    [myMapView setRegion:myRegion];
    [myMapView addAnnotation:myAnnotation];
    
    MMCLController *myCLController = [[MMCLController alloc] init];
    NSLog(@"%@", myCLController);
    myCLController.delegate = self;
    [myCLController.mrLocationManager startUpdatingLocation];
    
}
-(void) locationUpdate:(CLLocation *)location
{
    NSLog(@"%@", [location description]);
}
-(void) locationError:(NSError *)error
{
    NSLog(@"%@", [error description]);
}

- (void)didReceiveMemoryWarning

{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)showDetail;
{
    NSLog(@"Striker rules!!!");
}

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    UIButton *detailButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    
    MKAnnotationView *annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:@"myAnnotation"];
    
    if (annotationView == nil) {
        annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"myAnnotataion"];
    }
    
    [detailButton addTarget:self
                     action:@selector(showDetail)
           forControlEvents:(UIControlEventTouchUpInside)];
    //pinView.pinColor = MKPinAnnotationColorGreen;
    //pinView.canShowCallout = YES;
    annotationView.canShowCallout = YES;
    annotationView.image = [UIImage imageNamed:@"burger.png"];
    annotationView.rightCalloutAccessoryView = detailButton;
    //annotationView.
    
    return annotationView;
}

@end
