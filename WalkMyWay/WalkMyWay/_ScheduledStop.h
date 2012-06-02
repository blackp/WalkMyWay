// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ScheduledStop.h instead.

#import <CoreData/CoreData.h>


extern const struct ScheduledStopAttributes {
	__unsafe_unretained NSString *arrivalTime;
	__unsafe_unretained NSString *departureTime;
	__unsafe_unretained NSString *sequenceNumber;
} ScheduledStopAttributes;

extern const struct ScheduledStopRelationships {
	__unsafe_unretained NSString *stop;
	__unsafe_unretained NSString *trip;
} ScheduledStopRelationships;

extern const struct ScheduledStopFetchedProperties {
} ScheduledStopFetchedProperties;

@class Stop;
@class Trip;





@interface ScheduledStopID : NSManagedObjectID {}
@end

@interface _ScheduledStop : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (ScheduledStopID*)objectID;




@property (nonatomic, strong) NSString* arrivalTime;


//- (BOOL)validateArrivalTime:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* departureTime;


//- (BOOL)validateDepartureTime:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSNumber* sequenceNumber;


@property int16_t sequenceNumberValue;
- (int16_t)sequenceNumberValue;
- (void)setSequenceNumberValue:(int16_t)value_;

//- (BOOL)validateSequenceNumber:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) Stop* stop;

//- (BOOL)validateStop:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) Trip* trip;

//- (BOOL)validateTrip:(id*)value_ error:(NSError**)error_;





@end

@interface _ScheduledStop (CoreDataGeneratedAccessors)

@end

@interface _ScheduledStop (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveArrivalTime;
- (void)setPrimitiveArrivalTime:(NSString*)value;




- (NSString*)primitiveDepartureTime;
- (void)setPrimitiveDepartureTime:(NSString*)value;




- (NSNumber*)primitiveSequenceNumber;
- (void)setPrimitiveSequenceNumber:(NSNumber*)value;

- (int16_t)primitiveSequenceNumberValue;
- (void)setPrimitiveSequenceNumberValue:(int16_t)value_;





- (Stop*)primitiveStop;
- (void)setPrimitiveStop:(Stop*)value;



- (Trip*)primitiveTrip;
- (void)setPrimitiveTrip:(Trip*)value;


@end
