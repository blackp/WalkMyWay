//
//  PBWalkableStops.m
//  WalkMyWay
//
//  Created by Philip Blackwell on 2/06/12.
//  Copyright (c) 2012 Cordelta. All rights reserved.
//

#import "PBWalkableStops.h"

#define INITIAL_POINT_SPACE 1000
#define INITIAL_STOP_SPACE 30
#define MINIMUM_DELTA_METERS 10.0

@implementation PBWalkableStops

@synthesize coordinate, currentLocation, velocity;

- (id)initWithTrip:(Trip *)t
{
	self = [super init];
    _dirty = TRUE;
    if (self)
	{
        trip = t;
                
        pointCount = [trip.scheduledStops count];
        scheduledStops = [trip.scheduledStops allObjects];
        points = malloc(sizeof(MKMapPoint) * pointCount);
        _stopsEasy = malloc(sizeof(MKMapPoint) * pointCount);
        _stopsMedium = malloc(sizeof(MKMapPoint) * pointCount);
        _stopsHard = malloc(sizeof(MKMapPoint) * pointCount);
        
        for (NSUInteger i = 0; i < scheduledStops.count; i += 1) {
            ScheduledStop *scheduledStop = [scheduledStops objectAtIndex:i];
            Stop *stop = scheduledStop.stop;
            CLLocationCoordinate2D c = CLLocationCoordinate2DMake(stop.latitudeValue, stop.longitudeValue);
            MKMapPoint p = MKMapPointForCoordinate(c);
            points[scheduledStop.sequenceNumberValue] = p;
        }

        double minX = points[0].x;
        double maxX = points[0].x;
        double minY = points[0].y;
        double maxY = points[0].y;
        
        for (NSUInteger i = 0; i < pointCount; i += 1) {
            MKMapPoint p = points[i];
            if (p.x > maxX) maxX = p.x;
            if (p.x < minX) minX = p.x;
            if (p.y > maxY) maxY = p.y;
            if (p.y < minY) minY = p.y;
        }
        
        // bite off up to 1/4 of the world to draw into.
        MKMapPoint origin = MKMapPointMake(minX, maxY);
        MKMapSize size = MKMapSizeMake(fabs(maxX - minX), fabs(maxY - minY));
        boundingMapRect = (MKMapRect) { origin, size };
    }
    self.velocity = 1.7;
    return self;
}

- (void)dealloc
{
    NSLog(@"We're Free!");
    free(points);
    scheduledStops = nil;
}

- (MKMapRect)boundingMapRect
{
    return boundingMapRect;
}

/**
 * A coordinate region (just) covering all the points.
 *
 */

- (MKCoordinateRegion) region;
{    
    return MKCoordinateRegionForMapRect(boundingMapRect);
}

- (NSTimeInterval) estimateTimeToBeatBusAtStop:(ScheduledStop *) scheduledStop
{
    Stop *stop = scheduledStop.stop;
    CLLocation *stopLocation = [[CLLocation alloc] initWithLatitude:stop.latitudeValue longitude:stop.longitudeValue];
    CLLocationDistance d = [stopLocation distanceFromLocation:currentLocation];
    NSTimeInterval busDeparts = [scheduledStop secondsUntilDeparture];
    NSTimeInterval weArrive = d / velocity;

    if (busDeparts - weArrive > -180) {
        NSLog(@"Might make it to '%@' (%.0fm) in %.0f seconds", stop.name, d, weArrive);
    }
    
    return busDeparts - weArrive;
}


- (void) setVelocity:(CLLocationSpeed)v
{
    _dirty = TRUE;
    velocity = v;
}

- (void) setCurrentLocation:(CLLocation *)newLocation
{
    _dirty = TRUE;
    currentLocation = newLocation;
}

- (void) gradeStops
{
    if (_dirty && currentLocation != nil) {
        ScheduledStop *scheduledStop;
        _stopsCountEasy = _stopsCountMedium = _stopsCountHard = 0;
        for (NSUInteger i = 0; i < pointCount; i += 1) {
            scheduledStop = [scheduledStops objectAtIndex:i];
            NSTimeInterval timeToBeatBus = [self estimateTimeToBeatBusAtStop:scheduledStop];
            if (timeToBeatBus > 300.0) {
                _stopsEasy[_stopsCountEasy] = points[scheduledStop.sequenceNumberValue];
                _stopsCountEasy += 1;
            } else if (timeToBeatBus > 0.0) {
                _stopsMedium[_stopsCountMedium] = points[scheduledStop.sequenceNumberValue];
                _stopsCountMedium += 1;
            } else if (timeToBeatBus > -180.0) {
                _stopsHard[_stopsCountHard] = points[scheduledStop.sequenceNumberValue];
                _stopsCountHard+= 1;
            }
        }
                
        _dirty = FALSE;
    }
}

- (MKMapPoint *)stopsEasy
{
    [self gradeStops];
    return _stopsEasy;
}

- (MKMapPoint *)stopsMedium
{
    [self gradeStops];
    return _stopsMedium;
}

- (MKMapPoint *)stopsHard
{
    [self gradeStops];
    return _stopsHard;
}
    
- (NSUInteger) stopCountEasy
{
    [self gradeStops];
    return _stopsCountEasy;
}

- (NSUInteger) stopCountMedium
{
    [self gradeStops];
    return _stopsCountMedium;
}

- (NSUInteger) stopCountHard
{
    [self gradeStops];
    return _stopsCountHard;
}

@end
