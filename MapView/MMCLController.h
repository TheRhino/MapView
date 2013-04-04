//
//  MMCLController.h
//  MapView
//
//  Created by RHINO on 2/26/13.
//  Copyright (c) 2013 RHINO. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@protocol MMCLControllerDelegate <NSObject>
@required

-(void) locationUpdate:(CLLocation *)location;
-(void) locationError:(NSError *)error;

@end

@interface MMCLController : NSObject <CLLocationManagerDelegate>
{
    CLLocationManager *mrLocationManager;
    id delegate;
}

@property CLLocationManager *mrLocationManager;
@property id <MMCLControllerDelegate> delegate;

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation;

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error;

@end
