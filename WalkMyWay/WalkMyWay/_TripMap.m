// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to TripMap.m instead.

#import "_TripMap.h"

const struct TripMapAttributes TripMapAttributes = {
};

const struct TripMapRelationships TripMapRelationships = {
	.points = @"points",
	.trips = @"trips",
};

const struct TripMapFetchedProperties TripMapFetchedProperties = {
};

@implementation TripMapID
@end

@implementation _TripMap

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"TripMap" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"TripMap";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"TripMap" inManagedObjectContext:moc_];
}

- (TripMapID*)objectID {
	return (TripMapID*)[super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic points;

	
- (NSMutableSet*)pointsSet {
	[self willAccessValueForKey:@"points"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"points"];
  
	[self didAccessValueForKey:@"points"];
	return result;
}
	

@dynamic trips;

	
- (NSMutableSet*)tripsSet {
	[self willAccessValueForKey:@"trips"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"trips"];
  
	[self didAccessValueForKey:@"trips"];
	return result;
}
	






@end
