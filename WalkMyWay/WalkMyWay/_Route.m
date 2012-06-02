// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Route.m instead.

#import "_Route.h"

const struct RouteAttributes RouteAttributes = {
	.name = @"name",
};

const struct RouteRelationships RouteRelationships = {
	.trips = @"trips",
};

const struct RouteFetchedProperties RouteFetchedProperties = {
};

@implementation RouteID
@end

@implementation _Route

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Route" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Route";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Route" inManagedObjectContext:moc_];
}

- (RouteID*)objectID {
	return (RouteID*)[super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic name;






@dynamic trips;

	
- (NSMutableSet*)tripsSet {
	[self willAccessValueForKey:@"trips"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"trips"];
  
	[self didAccessValueForKey:@"trips"];
	return result;
}
	






@end
