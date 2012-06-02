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

@end
