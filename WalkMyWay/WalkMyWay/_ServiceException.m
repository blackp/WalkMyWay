// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ServiceException.m instead.

#import "_ServiceException.h"

const struct ServiceExceptionAttributes ServiceExceptionAttributes = {
	.date = @"date",
	.inclusion = @"inclusion",
};

const struct ServiceExceptionRelationships ServiceExceptionRelationships = {
	.service = @"service",
};

const struct ServiceExceptionFetchedProperties ServiceExceptionFetchedProperties = {
};

@implementation ServiceExceptionID
@end

@implementation _ServiceException

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"ServiceException" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"ServiceException";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"ServiceException" inManagedObjectContext:moc_];
}

- (ServiceExceptionID*)objectID {
	return (ServiceExceptionID*)[super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"inclusionValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"inclusion"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}

	return keyPaths;
}




@dynamic date;






@dynamic inclusion;



- (BOOL)inclusionValue {
	NSNumber *result = [self inclusion];
	return [result boolValue];
}

- (void)setInclusionValue:(BOOL)value_ {
	[self setInclusion:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveInclusionValue {
	NSNumber *result = [self primitiveInclusion];
	return [result boolValue];
}

- (void)setPrimitiveInclusionValue:(BOOL)value_ {
	[self setPrimitiveInclusion:[NSNumber numberWithBool:value_]];
}





@dynamic service;

	






@end
