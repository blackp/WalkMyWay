// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Stop.h instead.

#import <CoreData/CoreData.h>


extern const struct StopAttributes {
	__unsafe_unretained NSString *latitude;
	__unsafe_unretained NSString *longitude;
	__unsafe_unretained NSString *name;
} StopAttributes;

extern const struct StopRelationships {
	__unsafe_unretained NSString *scheduledStops;
} StopRelationships;

extern const struct StopFetchedProperties {
} StopFetchedProperties;

@class ScheduledStop;





@interface StopID : NSManagedObjectID {}
@end

@interface _Stop : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (StopID*)objectID;




@property (nonatomic, strong) NSNumber* latitude;


@property float latitudeValue;
- (float)latitudeValue;
- (void)setLatitudeValue:(float)value_;

//- (BOOL)validateLatitude:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSNumber* longitude;


@property float longitudeValue;
- (float)longitudeValue;
- (void)setLongitudeValue:(float)value_;

//- (BOOL)validateLongitude:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* name;


//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet* scheduledStops;

- (NSMutableSet*)scheduledStopsSet;





@end

@interface _Stop (CoreDataGeneratedAccessors)

- (void)addScheduledStops:(NSSet*)value_;
- (void)removeScheduledStops:(NSSet*)value_;
- (void)addScheduledStopsObject:(ScheduledStop*)value_;
- (void)removeScheduledStopsObject:(ScheduledStop*)value_;

@end

@interface _Stop (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveLatitude;
- (void)setPrimitiveLatitude:(NSNumber*)value;

- (float)primitiveLatitudeValue;
- (void)setPrimitiveLatitudeValue:(float)value_;




- (NSNumber*)primitiveLongitude;
- (void)setPrimitiveLongitude:(NSNumber*)value;

- (float)primitiveLongitudeValue;
- (void)setPrimitiveLongitudeValue:(float)value_;




- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;





- (NSMutableSet*)primitiveScheduledStops;
- (void)setPrimitiveScheduledStops:(NSMutableSet*)value;


@end
