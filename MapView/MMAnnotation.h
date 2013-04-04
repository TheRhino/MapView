//
//  MMAnnotation.h
//  MapView
//
//  Created by RHINO on 2/25/13.
//  Copyright (c) 2013 RHINO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MMAnnotation : NSObject <MKAnnotation>

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *subtitle;
//Struct is a container of primitives
//Structs don't have methods
@property (assign, nonatomic) CLLocationCoordinate2D coordinate;

@end
