#import "ScheduledStop.h"

@implementation ScheduledStop

// Custom logic goes here.

- (NSTimeInterval) secondsUntilDeparture
{
    
    NSDate *now = [NSDate date];
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"HH:mm:ss"];
    NSDate *departureTime = [dateFormat dateFromString:self.departureTime]; 
    
    unsigned units = NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *nowComponents = [calendar components:units fromDate:now];
    NSDateComponents *departureComponents = [calendar components:units fromDate:departureTime];
    
    //NSLog(@"Now: %d-%d-%d", nowComponents.hour, nowComponents.minute, nowComponents.second);
    //NSLog(@"Departure: %@ %d-%d-%d", self.departureTime, departureComponents.hour, departureComponents.minute, departureComponents.second);

    NSTimeInterval t = (departureComponents.hour - nowComponents.hour) * 3600 + (departureComponents.minute - nowComponents.minute) * 60 + (departureComponents.second - nowComponents.second);
    //NSLog(@"%f", t);
    //return t;

    return 600;
}

@end
