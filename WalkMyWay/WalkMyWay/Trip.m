#import "Trip.h"

@implementation Trip

// Custom logic goes here.

- (Stop *)finalStop 
{
    NSArray *scheduled = [self.scheduledStops allObjects];
    Stop *result;
    NSInteger lastScheduled = 0;
    
    for (NSInteger i = 0; i < scheduled.count; i += 1) {
        ScheduledStop *scheduledStop = [scheduled objectAtIndex:i];
        if (scheduledStop.sequenceNumberValue > lastScheduled) {
            lastScheduled = scheduledStop.sequenceNumberValue;
            result = scheduledStop.stop;
        }
    }
    
    return result;
}

- (Stop *)closestStopTo:(CLLocation *) location
{
    NSArray *scheduled = [self.scheduledStops allObjects];
    Stop *result;    
    CLLocationDistance minDistance = 10000;
    
    for (NSInteger i = 0; i < scheduled.count; i += 1) {
        ScheduledStop *scheduledStop = [scheduled objectAtIndex:i];
        Stop *stop = scheduledStop.stop;
        CLLocation *stopLocation = [[CLLocation alloc] initWithLatitude:stop.latitudeValue longitude:stop.longitudeValue];
        CLLocationDistance distance = [location distanceFromLocation:stopLocation];
        if (distance < minDistance) {
            minDistance = distance;
            result = stop;
        }
    }
    
    return result;

}

- (ScheduledStop *)scheduledStopFor:(Stop *) stop;
{
    NSArray *scheduled = [self.scheduledStops allObjects];
    
    for (NSInteger i = 0; i < scheduled.count; i += 1) {
        ScheduledStop *scheduledStop = [scheduled objectAtIndex:i];
        if (scheduledStop.stop == stop) {
            return scheduledStop;
        }
    }
    
    return nil;
}

@end
