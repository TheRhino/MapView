//
//  MMViewController.h
//  MapView
//
//  Created by RHINO on 2/25/13.
//  Copyright (c) 2013 RHINO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMCLController.h"
#import <CoreLocation/CoreLocation.h>
#import "MMAnnotation.h"

@interface MMViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate>

{
    //GPS variables
    CLLocationManager *missLocationManager;
}

-(void) locationUpdate:(CLLocation *)location;
-(void) locationError:(NSError *)error;

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation;

@end
