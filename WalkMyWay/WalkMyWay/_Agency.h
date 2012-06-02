// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Agency.h instead.

#import <CoreData/CoreData.h>


extern const struct AgencyAttributes {
	__unsafe_unretained NSString *language;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *phoneNumber;
	__unsafe_unretained NSString *timezone;
	__unsafe_unretained NSString *url;
} AgencyAttributes;

extern const struct AgencyRelationships {
} AgencyRelationships;

extern const struct AgencyFetchedProperties {
} AgencyFetchedProperties;








@interface AgencyID : NSManagedObjectID {}
@end

@interface _Agency : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (AgencyID*)objectID;




@property (nonatomic, strong) NSString* language;


//- (BOOL)validateLanguage:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* name;


//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* phoneNumber;


//- (BOOL)validatePhoneNumber:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* timezone;


//- (BOOL)validateTimezone:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* url;


//- (BOOL)validateUrl:(id*)value_ error:(NSError**)error_;






@end

@interface _Agency (CoreDataGeneratedAccessors)

@end

@interface _Agency (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveLanguage;
- (void)setPrimitiveLanguage:(NSString*)value;




- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




- (NSString*)primitivePhoneNumber;
- (void)setPrimitivePhoneNumber:(NSString*)value;




- (NSString*)primitiveTimezone;
- (void)setPrimitiveTimezone:(NSString*)value;




- (NSString*)primitiveUrl;
- (void)setPrimitiveUrl:(NSString*)value;




@end
