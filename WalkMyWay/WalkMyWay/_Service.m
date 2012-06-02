// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Service.m instead.

#import "_Service.h"

const struct ServiceAttributes ServiceAttributes = {
	.fridays = @"fridays",
	.mondays = @"mondays",
	.saturdays = @"saturdays",
	.sundays = @"sundays",
	.thursdays = @"thursdays",
	.tuesdays = @"tuesdays",
	.wednesdays = @"wednesdays",
};

const struct ServiceRelationships ServiceRelationships = {
	.exceptions = @"exceptions",
	.trips = @"trips",
};

const struct ServiceFetchedProperties ServiceFetchedProperties = {
};

@implementation ServiceID
@end

@implementation _Service

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Service" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Service";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Service" inManagedObjectContext:moc_];
}

- (ServiceID*)objectID {
	return (ServiceID*)[super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"fridaysValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"fridays"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}
	if ([key isEqualToString:@"mondaysValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"mondays"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}
	if ([key isEqualToString:@"saturdaysValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"saturdays"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}
	if ([key isEqualToString:@"sundaysValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"sundays"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}
	if ([key isEqualToString:@"thursdaysValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"thursdays"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}
	if ([key isEqualToString:@"tuesdaysValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"tuesdays"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}
	if ([key isEqualToString:@"wednesdaysValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"wednesdays"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}

	return keyPaths;
}




@dynamic fridays;



- (BOOL)fridaysValue {
	NSNumber *result = [self fridays];
	return [result boolValue];
}

- (void)setFridaysValue:(BOOL)value_ {
	[self setFridays:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveFridaysValue {
	NSNumber *result = [self primitiveFridays];
	return [result boolValue];
}

- (void)setPrimitiveFridaysValue:(BOOL)value_ {
	[self setPrimitiveFridays:[NSNumber numberWithBool:value_]];
}





@dynamic mondays;



- (BOOL)mondaysValue {
	NSNumber *result = [self mondays];
	return [result boolValue];
}

- (void)setMondaysValue:(BOOL)value_ {
	[self setMondays:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveMondaysValue {
	NSNumber *result = [self primitiveMondays];
	return [result boolValue];
}

- (void)setPrimitiveMondaysValue:(BOOL)value_ {
	[self setPrimitiveMondays:[NSNumber numberWithBool:value_]];
}





@dynamic saturdays;



- (BOOL)saturdaysValue {
	NSNumber *result = [self saturdays];
	return [result boolValue];
}

- (void)setSaturdaysValue:(BOOL)value_ {
	[self setSaturdays:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveSaturdaysValue {
	NSNumber *result = [self primitiveSaturdays];
	return [result boolValue];
}

- (void)setPrimitiveSaturdaysValue:(BOOL)value_ {
	[self setPrimitiveSaturdays:[NSNumber numberWithBool:value_]];
}





@dynamic sundays;



- (BOOL)sundaysValue {
	NSNumber *result = [self sundays];
	return [result boolValue];
}

- (void)setSundaysValue:(BOOL)value_ {
	[self setSundays:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveSundaysValue {
	NSNumber *result = [self primitiveSundays];
	return [result boolValue];
}

- (void)setPrimitiveSundaysValue:(BOOL)value_ {
	[self setPrimitiveSundays:[NSNumber numberWithBool:value_]];
}





@dynamic thursdays;



- (BOOL)thursdaysValue {
	NSNumber *result = [self thursdays];
	return [result boolValue];
}

- (void)setThursdaysValue:(BOOL)value_ {
	[self setThursdays:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveThursdaysValue {
	NSNumber *result = [self primitiveThursdays];
	return [result boolValue];
}

- (void)setPrimitiveThursdaysValue:(BOOL)value_ {
	[self setPrimitiveThursdays:[NSNumber numberWithBool:value_]];
}





@dynamic tuesdays;



- (BOOL)tuesdaysValue {
	NSNumber *result = [self tuesdays];
	return [result boolValue];
}

- (void)setTuesdaysValue:(BOOL)value_ {
	[self setTuesdays:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveTuesdaysValue {
	NSNumber *result = [self primitiveTuesdays];
	return [result boolValue];
}

- (void)setPrimitiveTuesdaysValue:(BOOL)value_ {
	[self setPrimitiveTuesdays:[NSNumber numberWithBool:value_]];
}





@dynamic wednesdays;



- (BOOL)wednesdaysValue {
	NSNumber *result = [self wednesdays];
	return [result boolValue];
}

- (void)setWednesdaysValue:(BOOL)value_ {
	[self setWednesdays:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveWednesdaysValue {
	NSNumber *result = [self primitiveWednesdays];
	return [result boolValue];
}

- (void)setPrimitiveWednesdaysValue:(BOOL)value_ {
	[self setPrimitiveWednesdays:[NSNumber numberWithBool:value_]];
}





@dynamic exceptions;

	
- (NSMutableSet*)exceptionsSet {
	[self willAccessValueForKey:@"exceptions"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"exceptions"];
  
	[self didAccessValueForKey:@"exceptions"];
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
