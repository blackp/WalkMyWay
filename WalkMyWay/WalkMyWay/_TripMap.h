// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to TripMap.h instead.

#import <CoreData/CoreData.h>


extern const struct TripMapAttributes {
} TripMapAttributes;

extern const struct TripMapRelationships {
	__unsafe_unretained NSString *points;
	__unsafe_unretained NSString *trips;
} TripMapRelationships;

extern const struct TripMapFetchedProperties {
} TripMapFetchedProperties;

@class WayPoint;
@class Trip;


@interface TripMapID : NSManagedObjectID {}
@end

@interface _TripMap : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (TripMapID*)objectID;





@property (nonatomic, strong) NSSet* points;

- (NSMutableSet*)pointsSet;




@property (nonatomic, strong) NSSet* trips;

- (NSMutableSet*)tripsSet;





@end

@interface _TripMap (CoreDataGeneratedAccessors)

- (void)addPoints:(NSSet*)value_;
- (void)removePoints:(NSSet*)value_;
- (void)addPointsObject:(WayPoint*)value_;
- (void)removePointsObject:(WayPoint*)value_;

- (void)addTrips:(NSSet*)value_;
- (void)removeTrips:(NSSet*)value_;
- (void)addTripsObject:(Trip*)value_;
- (void)removeTripsObject:(Trip*)value_;

@end

@interface _TripMap (CoreDataGeneratedPrimitiveAccessors)



- (NSMutableSet*)primitivePoints;
- (void)setPrimitivePoints:(NSMutableSet*)value;



- (NSMutableSet*)primitiveTrips;
- (void)setPrimitiveTrips:(NSMutableSet*)value;


@end
