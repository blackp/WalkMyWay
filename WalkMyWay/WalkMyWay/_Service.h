// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Service.h instead.

#import <CoreData/CoreData.h>


extern const struct ServiceAttributes {
	__unsafe_unretained NSString *fridays;
	__unsafe_unretained NSString *mondays;
	__unsafe_unretained NSString *saturdays;
	__unsafe_unretained NSString *sundays;
	__unsafe_unretained NSString *thursdays;
	__unsafe_unretained NSString *tuesdays;
	__unsafe_unretained NSString *wednesdays;
} ServiceAttributes;

extern const struct ServiceRelationships {
	__unsafe_unretained NSString *exceptions;
	__unsafe_unretained NSString *trips;
} ServiceRelationships;

extern const struct ServiceFetchedProperties {
} ServiceFetchedProperties;

@class ServiceException;
@class Trip;









@interface ServiceID : NSManagedObjectID {}
@end

@interface _Service : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (ServiceID*)objectID;




@property (nonatomic, strong) NSNumber* fridays;


@property BOOL fridaysValue;
- (BOOL)fridaysValue;
- (void)setFridaysValue:(BOOL)value_;

//- (BOOL)validateFridays:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSNumber* mondays;


@property BOOL mondaysValue;
- (BOOL)mondaysValue;
- (void)setMondaysValue:(BOOL)value_;

//- (BOOL)validateMondays:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSNumber* saturdays;


@property BOOL saturdaysValue;
- (BOOL)saturdaysValue;
- (void)setSaturdaysValue:(BOOL)value_;

//- (BOOL)validateSaturdays:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSNumber* sundays;


@property BOOL sundaysValue;
- (BOOL)sundaysValue;
- (void)setSundaysValue:(BOOL)value_;

//- (BOOL)validateSundays:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSNumber* thursdays;


@property BOOL thursdaysValue;
- (BOOL)thursdaysValue;
- (void)setThursdaysValue:(BOOL)value_;

//- (BOOL)validateThursdays:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSNumber* tuesdays;


@property BOOL tuesdaysValue;
- (BOOL)tuesdaysValue;
- (void)setTuesdaysValue:(BOOL)value_;

//- (BOOL)validateTuesdays:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSNumber* wednesdays;


@property BOOL wednesdaysValue;
- (BOOL)wednesdaysValue;
- (void)setWednesdaysValue:(BOOL)value_;

//- (BOOL)validateWednesdays:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet* exceptions;

- (NSMutableSet*)exceptionsSet;




@property (nonatomic, strong) NSSet* trips;

- (NSMutableSet*)tripsSet;





@end

@interface _Service (CoreDataGeneratedAccessors)

- (void)addExceptions:(NSSet*)value_;
- (void)removeExceptions:(NSSet*)value_;
- (void)addExceptionsObject:(ServiceException*)value_;
- (void)removeExceptionsObject:(ServiceException*)value_;

- (void)addTrips:(NSSet*)value_;
- (void)removeTrips:(NSSet*)value_;
- (void)addTripsObject:(Trip*)value_;
- (void)removeTripsObject:(Trip*)value_;

@end

@interface _Service (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveFridays;
- (void)setPrimitiveFridays:(NSNumber*)value;

- (BOOL)primitiveFridaysValue;
- (void)setPrimitiveFridaysValue:(BOOL)value_;




- (NSNumber*)primitiveMondays;
- (void)setPrimitiveMondays:(NSNumber*)value;

- (BOOL)primitiveMondaysValue;
- (void)setPrimitiveMondaysValue:(BOOL)value_;




- (NSNumber*)primitiveSaturdays;
- (void)setPrimitiveSaturdays:(NSNumber*)value;

- (BOOL)primitiveSaturdaysValue;
- (void)setPrimitiveSaturdaysValue:(BOOL)value_;




- (NSNumber*)primitiveSundays;
- (void)setPrimitiveSundays:(NSNumber*)value;

- (BOOL)primitiveSundaysValue;
- (void)setPrimitiveSundaysValue:(BOOL)value_;




- (NSNumber*)primitiveThursdays;
- (void)setPrimitiveThursdays:(NSNumber*)value;

- (BOOL)primitiveThursdaysValue;
- (void)setPrimitiveThursdaysValue:(BOOL)value_;




- (NSNumber*)primitiveTuesdays;
- (void)setPrimitiveTuesdays:(NSNumber*)value;

- (BOOL)primitiveTuesdaysValue;
- (void)setPrimitiveTuesdaysValue:(BOOL)value_;




- (NSNumber*)primitiveWednesdays;
- (void)setPrimitiveWednesdays:(NSNumber*)value;

- (BOOL)primitiveWednesdaysValue;
- (void)setPrimitiveWednesdaysValue:(BOOL)value_;





- (NSMutableSet*)primitiveExceptions;
- (void)setPrimitiveExceptions:(NSMutableSet*)value;



- (NSMutableSet*)primitiveTrips;
- (void)setPrimitiveTrips:(NSMutableSet*)value;


@end
