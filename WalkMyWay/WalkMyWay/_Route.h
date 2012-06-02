// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Route.h instead.

#import <CoreData/CoreData.h>


extern const struct RouteAttributes {
	__unsafe_unretained NSString *name;
} RouteAttributes;

extern const struct RouteRelationships {
	__unsafe_unretained NSString *trips;
} RouteRelationships;

extern const struct RouteFetchedProperties {
} RouteFetchedProperties;

@class Trip;



@interface RouteID : NSManagedObjectID {}
@end

@interface _Route : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (RouteID*)objectID;




@property (nonatomic, strong) NSString* name;


//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet* trips;

- (NSMutableSet*)tripsSet;





@end

@interface _Route (CoreDataGeneratedAccessors)

- (void)addTrips:(NSSet*)value_;
- (void)removeTrips:(NSSet*)value_;
- (void)addTripsObject:(Trip*)value_;
- (void)removeTripsObject:(Trip*)value_;

@end

@interface _Route (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;





- (NSMutableSet*)primitiveTrips;
- (void)setPrimitiveTrips:(NSMutableSet*)value;


@end
