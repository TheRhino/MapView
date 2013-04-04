//
//  MMCLController.m
//  MapView
//
//  Created by RHINO on 2/26/13.
//  Copyright (c) 2013 RHINO. All rights reserved.
//

#import "MMCLController.h"

@implementation MMCLController

@synthesize mrLocationManager;
@synthesize delegate;

-(id)init
{
    self = [super init];
    if (self != nil)
    {
        self.mrLocationManager = [[CLLocationManager alloc]init];
        //Send location data to myself
        self.mrLocationManager.delegate = self;
    }
        return self;
}

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    [self.delegate locationUpdate:newLocation];
}

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error
{
    [self.delegate locationError:error];
}

@end
