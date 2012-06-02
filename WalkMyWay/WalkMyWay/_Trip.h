// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Trip.h instead.

#import <CoreData/CoreData.h>


extern const struct TripAttributes {
} TripAttributes;

extern const struct TripRelationships {
	__unsafe_unretained NSString *map;
	__unsafe_unretained NSString *route;
	__unsafe_unretained NSString *scheduledStops;
	__unsafe_unretained NSString *service;
} TripRelationships;

extern const struct TripFetchedProperties {
} TripFetchedProperties;

@class TripMap;
@class Route;
@class ScheduledStop;
@class Service;


@interface TripID : NSManagedObjectID {}
@end

@interface _Trip : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (TripID*)objectID;





@property (nonatomic, strong) TripMap* map;

//- (BOOL)validateMap:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) Route* route;

//- (BOOL)validateRoute:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSSet* scheduledStops;

- (NSMutableSet*)scheduledStopsSet;




@property (nonatomic, strong) Service* service;

//- (BOOL)validateService:(id*)value_ error:(NSError**)error_;





@end

@interface _Trip (CoreDataGeneratedAccessors)

- (void)addScheduledStops:(NSSet*)value_;
- (void)removeScheduledStops:(NSSet*)value_;
- (void)addScheduledStopsObject:(ScheduledStop*)value_;
- (void)removeScheduledStopsObject:(ScheduledStop*)value_;

@end

@interface _Trip (CoreDataGeneratedPrimitiveAccessors)



- (TripMap*)primitiveMap;
- (void)setPrimitiveMap:(TripMap*)value;



- (Route*)primitiveRoute;
- (void)setPrimitiveRoute:(Route*)value;



- (NSMutableSet*)primitiveScheduledStops;
- (void)setPrimitiveScheduledStops:(NSMutableSet*)value;



- (Service*)primitiveService;
- (void)setPrimitiveService:(Service*)value;


@end
