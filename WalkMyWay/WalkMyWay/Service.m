#import "Service.h"

@implementation Service

// Custom logic goes here.
- (BOOL)runsToday {

    NSDate *today = [NSDate date];
    unsigned units = NSWeekdayCalendarUnit;
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [calendar components:units fromDate:today];
    
    BOOL result;
    
    switch (components.weekday) {
        case 1:
            result = [self.sundays boolValue];
            break;
        case 2:
            result = [self.mondays boolValue];
            break;
        case 3:
            result = [self.tuesdays boolValue];
            break;
        case 4:
            result = [self.wednesdays boolValue];
            break;
        case 5:
            result = [self.thursdays boolValue];
            break;
        case 6:
            result = [self.fridays boolValue];
            break;
        case 7:
            result = [self.saturdays boolValue];
            break;
        default:
            NSLog(@"ERROR: Unexpected day of week: %d!", components.weekday);
            break;
    }
    
    // FIXME: Modify the result according to any service exceptions.
    
    return result;
}

@end
