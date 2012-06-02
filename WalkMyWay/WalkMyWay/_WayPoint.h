// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to WayPoint.h instead.

#import <CoreData/CoreData.h>


extern const struct WayPointAttributes {
	__unsafe_unretained NSString *latitude;
	__unsafe_unretained NSString *longitude;
	__unsafe_unretained NSString *sequenceNumber;
} WayPointAttributes;

extern const struct WayPointRelationships {
	__unsafe_unretained NSString *map;
} WayPointRelationships;

extern const struct WayPointFetchedProperties {
} WayPointFetchedProperties;

@class TripMap;





@interface WayPointID : NSManagedObjectID {}
@end

@interface _WayPoint : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (WayPointID*)objectID;




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




@property (nonatomic, strong) NSNumber* sequenceNumber;


@property int16_t sequenceNumberValue;
- (int16_t)sequenceNumberValue;
- (void)setSequenceNumberValue:(int16_t)value_;

//- (BOOL)validateSequenceNumber:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) TripMap* map;

//- (BOOL)validateMap:(id*)value_ error:(NSError**)error_;





@end

@interface _WayPoint (CoreDataGeneratedAccessors)

@end

@interface _WayPoint (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveLatitude;
- (void)setPrimitiveLatitude:(NSNumber*)value;

- (float)primitiveLatitudeValue;
- (void)setPrimitiveLatitudeValue:(float)value_;




- (NSNumber*)primitiveLongitude;
- (void)setPrimitiveLongitude:(NSNumber*)value;

- (float)primitiveLongitudeValue;
- (void)setPrimitiveLongitudeValue:(float)value_;




- (NSNumber*)primitiveSequenceNumber;
- (void)setPrimitiveSequenceNumber:(NSNumber*)value;

- (int16_t)primitiveSequenceNumberValue;
- (void)setPrimitiveSequenceNumberValue:(int16_t)value_;





- (TripMap*)primitiveMap;
- (void)setPrimitiveMap:(TripMap*)value;


@end
