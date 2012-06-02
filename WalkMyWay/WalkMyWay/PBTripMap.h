//
//  PBTripMap.h
//  WalkMyWay
//
//  Created by Philip Blackwell on 2/06/12.
//  Copyright (c) 2012 Cordelta. All rights reserved.
//

#import <MapKit/MapKit.h>
#import "Trip.h"
#import "TripMap.h"
#import "WayPoint.h"
#import "Route.h"

@interface PBTripMap : NSObject <MKOverlay>
{
    
    MKMapPoint *stops;
    MKMapPoint *points;
    NSUInteger pointCount;
    NSUInteger stopCount;
    
    MKMapRect boundingMapRect;
    
    Trip *trip;
}

- (id)initWithTrip:(Trip *)t;

@property (readonly) MKMapPoint *stops;
@property (readonly) MKMapPoint *points;
@property (readonly) NSUInteger pointCount;
@property (readonly) NSUInteger stopCount;

- (MKCoordinateRegion) region;

@end
