//
//  PBTripMap.m
//  WalkMyWay
//
//  Created by Philip Blackwell on 2/06/12.
//  Copyright (c) 2012 Cordelta. All rights reserved.
//

#import "PBTripMap.h"

#define INITIAL_POINT_SPACE 1000
#define INITIAL_STOP_SPACE 30
#define MINIMUM_DELTA_METERS 10.0

@implementation PBTripMap

@synthesize points, pointCount, stopCount, stops;

- (id)initWithTrip:(Trip *)t
{
	self = [super init];
    if (self)
	{
        trip = t;
        NSLog(@"INIT with Trip: %@", trip.route.name);
        stopCount = [trip.scheduledStops count];
        NSArray *tripStops = [trip.scheduledStops allObjects];
        stops = malloc(sizeof(MKMapPoint) * stopCount);
        for (NSUInteger i = 0; i < stopCount; i += 1) {
            ScheduledStop *scheduledStop = [tripStops objectAtIndex:i];
            CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(scheduledStop.stop.latitudeValue, scheduledStop.stop.longitudeValue);
            stops[scheduledStop.sequenceNumberValue] = MKMapPointForCoordinate(coordinate);
        }
        
        double minX = stops[0].x;
        double maxX = stops[0].x;
        double minY = stops[0].y;
        double maxY = stops[0].y;
        
        pointCount = [trip.map.points count];
        NSArray *tripPoints = [trip.map.points allObjects];
        points = malloc(sizeof(MKMapPoint) * pointCount);
        for (NSUInteger i = 0; i < tripPoints.count; i += 1) {
            WayPoint *wayPoint = [tripPoints objectAtIndex:i];
            CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(wayPoint.latitudeValue, wayPoint.longitudeValue);
            MKMapPoint p = MKMapPointForCoordinate(coordinate);
            points[wayPoint.sequenceNumberValue] = p;
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
    return self;
}

- (void)dealloc
{
    free(points);
    free(stops);
}

- (CLLocationCoordinate2D)coordinate
{
    return MKCoordinateForMapPoint(points[0]);
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

@end
