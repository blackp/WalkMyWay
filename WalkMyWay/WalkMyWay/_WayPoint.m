// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to WayPoint.m instead.

#import "_WayPoint.h"

const struct WayPointAttributes WayPointAttributes = {
	.latitude = @"latitude",
	.longitude = @"longitude",
	.sequenceNumber = @"sequenceNumber",
};

const struct WayPointRelationships WayPointRelationships = {
	.map = @"map",
};

const struct WayPointFetchedProperties WayPointFetchedProperties = {
};

@implementation WayPointID
@end

@implementation _WayPoint

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"WayPoint" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"WayPoint";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"WayPoint" inManagedObjectContext:moc_];
}

- (WayPointID*)objectID {
	return (WayPointID*)[super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"latitudeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"latitude"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}
	if ([key isEqualToString:@"longitudeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"longitude"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}
	if ([key isEqualToString:@"sequenceNumberValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"sequenceNumber"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}

	return keyPaths;
}




@dynamic latitude;



- (float)latitudeValue {
	NSNumber *result = [self latitude];
	return [result floatValue];
}

- (void)setLatitudeValue:(float)value_ {
	[self setLatitude:[NSNumber numberWithFloat:value_]];
}

- (float)primitiveLatitudeValue {
	NSNumber *result = [self primitiveLatitude];
	return [result floatValue];
}

- (void)setPrimitiveLatitudeValue:(float)value_ {
	[self setPrimitiveLatitude:[NSNumber numberWithFloat:value_]];
}





@dynamic longitude;



- (float)longitudeValue {
	NSNumber *result = [self longitude];
	return [result floatValue];
}

- (void)setLongitudeValue:(float)value_ {
	[self setLongitude:[NSNumber numberWithFloat:value_]];
}

- (float)primitiveLongitudeValue {
	NSNumber *result = [self primitiveLongitude];
	return [result floatValue];
}

- (void)setPrimitiveLongitudeValue:(float)value_ {
	[self setPrimitiveLongitude:[NSNumber numberWithFloat:value_]];
}





@dynamic sequenceNumber;



- (int16_t)sequenceNumberValue {
	NSNumber *result = [self sequenceNumber];
	return [result shortValue];
}

- (void)setSequenceNumberValue:(int16_t)value_ {
	[self setSequenceNumber:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveSequenceNumberValue {
	NSNumber *result = [self primitiveSequenceNumber];
	return [result shortValue];
}

- (void)setPrimitiveSequenceNumberValue:(int16_t)value_ {
	[self setPrimitiveSequenceNumber:[NSNumber numberWithShort:value_]];
}





@dynamic map;

	






@end
