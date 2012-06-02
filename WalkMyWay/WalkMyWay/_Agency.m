// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Agency.m instead.

#import "_Agency.h"

const struct AgencyAttributes AgencyAttributes = {
	.language = @"language",
	.name = @"name",
	.phoneNumber = @"phoneNumber",
	.timezone = @"timezone",
	.url = @"url",
};

const struct AgencyRelationships AgencyRelationships = {
};

const struct AgencyFetchedProperties AgencyFetchedProperties = {
};

@implementation AgencyID
@end

@implementation _Agency

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Agency" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Agency";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Agency" inManagedObjectContext:moc_];
}

- (AgencyID*)objectID {
	return (AgencyID*)[super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic language;






@dynamic name;






@dynamic phoneNumber;






@dynamic timezone;






@dynamic url;











@end
