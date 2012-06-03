//
//  PBWalkableStops.h
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
#import "Stop.h"
#import "ScheduledStop.h"

@interface PBWalkableStops : NSObject <MKOverlay>
{
    
    NSArray *scheduledStops;
    MKMapPoint *points;
    MKMapPoint *_stopsEasy;
    MKMapPoint *_stopsMedium;
    MKMapPoint *_stopsHard;
    NSUInteger pointCount;
    NSUInteger _stopsCountEasy;
    NSUInteger _stopsCountMedium;
    NSUInteger _stopsCountHard;
    
    BOOL _dirty;
    MKMapRect boundingMapRect;
    
    Trip *trip;
}

- (id)initWithTrip:(Trip *)t;

@property (nonatomic) CLLocation *currentLocation;
@property (nonatomic) CLLocationSpeed velocity;

- (MKMapPoint *)stopsEasy;
- (MKMapPoint *)stopsMedium;
- (MKMapPoint *)stopsHard;
- (NSUInteger) stopCountEasy;
- (NSUInteger) stopCountMedium;
- (NSUInteger) stopCountHard;

- (MKCoordinateRegion) region;

@end
