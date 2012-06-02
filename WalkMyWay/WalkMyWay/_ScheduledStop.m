// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ScheduledStop.m instead.

#import "_ScheduledStop.h"

const struct ScheduledStopAttributes ScheduledStopAttributes = {
	.arrivalTime = @"arrivalTime",
	.departureTime = @"departureTime",
	.sequenceNumber = @"sequenceNumber",
};

const struct ScheduledStopRelationships ScheduledStopRelationships = {
	.stop = @"stop",
	.trip = @"trip",
};

const struct ScheduledStopFetchedProperties ScheduledStopFetchedProperties = {
};

@implementation ScheduledStopID
@end

@implementation _ScheduledStop

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"ScheduledStop" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"ScheduledStop";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"ScheduledStop" inManagedObjectContext:moc_];
}

- (ScheduledStopID*)objectID {
	return (ScheduledStopID*)[super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"sequenceNumberValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"sequenceNumber"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}

	return keyPaths;
}




@dynamic arrivalTime;






@dynamic departureTime;






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





@dynamic stop;

	

@dynamic trip;

	






@end
