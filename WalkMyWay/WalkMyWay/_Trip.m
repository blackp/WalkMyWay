// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Trip.m instead.

#import "_Trip.h"

const struct TripAttributes TripAttributes = {
};

const struct TripRelationships TripRelationships = {
	.map = @"map",
	.route = @"route",
	.scheduledStops = @"scheduledStops",
	.service = @"service",
};

const struct TripFetchedProperties TripFetchedProperties = {
};

@implementation TripID
@end

@implementation _Trip

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Trip" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Trip";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Trip" inManagedObjectContext:moc_];
}

- (TripID*)objectID {
	return (TripID*)[super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic map;

	

@dynamic route;

	

@dynamic scheduledStops;

	
- (NSMutableSet*)scheduledStopsSet {
	[self willAccessValueForKey:@"scheduledStops"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"scheduledStops"];
  
	[self didAccessValueForKey:@"scheduledStops"];
	return result;
}
	

@dynamic service;

	






@end
