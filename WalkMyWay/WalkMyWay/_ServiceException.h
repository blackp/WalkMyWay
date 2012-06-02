// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ServiceException.h instead.

#import <CoreData/CoreData.h>


extern const struct ServiceExceptionAttributes {
	__unsafe_unretained NSString *date;
	__unsafe_unretained NSString *inclusion;
} ServiceExceptionAttributes;

extern const struct ServiceExceptionRelationships {
	__unsafe_unretained NSString *service;
} ServiceExceptionRelationships;

extern const struct ServiceExceptionFetchedProperties {
} ServiceExceptionFetchedProperties;

@class Service;




@interface ServiceExceptionID : NSManagedObjectID {}
@end

@interface _ServiceException : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (ServiceExceptionID*)objectID;




@property (nonatomic, strong) NSDate* date;


//- (BOOL)validateDate:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSNumber* inclusion;


@property BOOL inclusionValue;
- (BOOL)inclusionValue;
- (void)setInclusionValue:(BOOL)value_;

//- (BOOL)validateInclusion:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) Service* service;

//- (BOOL)validateService:(id*)value_ error:(NSError**)error_;





@end

@interface _ServiceException (CoreDataGeneratedAccessors)

@end

@interface _ServiceException (CoreDataGeneratedPrimitiveAccessors)


- (NSDate*)primitiveDate;
- (void)setPrimitiveDate:(NSDate*)value;




- (NSNumber*)primitiveInclusion;
- (void)setPrimitiveInclusion:(NSNumber*)value;

- (BOOL)primitiveInclusionValue;
- (void)setPrimitiveInclusionValue:(BOOL)value_;





- (Service*)primitiveService;
- (void)setPrimitiveService:(Service*)value;


@end
