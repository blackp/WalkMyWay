#import "_Trip.h"
#import "Stop.h"
#import "ScheduledStop.h"
#import <MapKit/MapKit.h>


@interface Trip : _Trip {}
// Custom logic goes here.

- (Stop *)finalStop;
- (Stop *)closestStopTo:(CLLocation *) location;
- (ScheduledStop *)scheduledStopFor:(Stop *) stop;
@end
