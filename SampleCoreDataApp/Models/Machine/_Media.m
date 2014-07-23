// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Media.m instead.

#import "_Media.h"

const struct MediaAttributes MediaAttributes = {
	.bitrate = @"bitrate",
	.channels = @"channels",
	.duration = @"duration",
	.expression = @"expression",
	.fileSize = @"fileSize",
	.framerate = @"framerate",
	.height = @"height",
	.isDefault = @"isDefault",
	.lang = @"lang",
	.medium = @"medium",
	.samplingrate = @"samplingrate",
	.type = @"type",
	.url = @"url",
	.width = @"width",
};

const struct MediaRelationships MediaRelationships = {
	.entry = @"entry",
};

const struct MediaFetchedProperties MediaFetchedProperties = {
};

@implementation MediaID
@end

@implementation _Media

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Media" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Media";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Media" inManagedObjectContext:moc_];
}

- (MediaID*)objectID {
	return (MediaID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"bitrateValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"bitrate"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"channelsValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"channels"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"durationValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"duration"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"fileSizeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"fileSize"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"framerateValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"framerate"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"heightValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"height"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"isDefaultValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"isDefault"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"samplingrateValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"samplingrate"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"widthValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"width"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic bitrate;



- (int32_t)bitrateValue {
	NSNumber *result = [self bitrate];
	return [result intValue];
}

- (void)setBitrateValue:(int32_t)value_ {
	[self setBitrate:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveBitrateValue {
	NSNumber *result = [self primitiveBitrate];
	return [result intValue];
}

- (void)setPrimitiveBitrateValue:(int32_t)value_ {
	[self setPrimitiveBitrate:[NSNumber numberWithInt:value_]];
}





@dynamic channels;



- (int16_t)channelsValue {
	NSNumber *result = [self channels];
	return [result shortValue];
}

- (void)setChannelsValue:(int16_t)value_ {
	[self setChannels:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveChannelsValue {
	NSNumber *result = [self primitiveChannels];
	return [result shortValue];
}

- (void)setPrimitiveChannelsValue:(int16_t)value_ {
	[self setPrimitiveChannels:[NSNumber numberWithShort:value_]];
}





@dynamic duration;



- (int32_t)durationValue {
	NSNumber *result = [self duration];
	return [result intValue];
}

- (void)setDurationValue:(int32_t)value_ {
	[self setDuration:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveDurationValue {
	NSNumber *result = [self primitiveDuration];
	return [result intValue];
}

- (void)setPrimitiveDurationValue:(int32_t)value_ {
	[self setPrimitiveDuration:[NSNumber numberWithInt:value_]];
}





@dynamic expression;






@dynamic fileSize;



- (int32_t)fileSizeValue {
	NSNumber *result = [self fileSize];
	return [result intValue];
}

- (void)setFileSizeValue:(int32_t)value_ {
	[self setFileSize:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveFileSizeValue {
	NSNumber *result = [self primitiveFileSize];
	return [result intValue];
}

- (void)setPrimitiveFileSizeValue:(int32_t)value_ {
	[self setPrimitiveFileSize:[NSNumber numberWithInt:value_]];
}





@dynamic framerate;



- (int32_t)framerateValue {
	NSNumber *result = [self framerate];
	return [result intValue];
}

- (void)setFramerateValue:(int32_t)value_ {
	[self setFramerate:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveFramerateValue {
	NSNumber *result = [self primitiveFramerate];
	return [result intValue];
}

- (void)setPrimitiveFramerateValue:(int32_t)value_ {
	[self setPrimitiveFramerate:[NSNumber numberWithInt:value_]];
}





@dynamic height;



- (int32_t)heightValue {
	NSNumber *result = [self height];
	return [result intValue];
}

- (void)setHeightValue:(int32_t)value_ {
	[self setHeight:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveHeightValue {
	NSNumber *result = [self primitiveHeight];
	return [result intValue];
}

- (void)setPrimitiveHeightValue:(int32_t)value_ {
	[self setPrimitiveHeight:[NSNumber numberWithInt:value_]];
}





@dynamic isDefault;



- (BOOL)isDefaultValue {
	NSNumber *result = [self isDefault];
	return [result boolValue];
}

- (void)setIsDefaultValue:(BOOL)value_ {
	[self setIsDefault:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveIsDefaultValue {
	NSNumber *result = [self primitiveIsDefault];
	return [result boolValue];
}

- (void)setPrimitiveIsDefaultValue:(BOOL)value_ {
	[self setPrimitiveIsDefault:[NSNumber numberWithBool:value_]];
}





@dynamic lang;






@dynamic medium;






@dynamic samplingrate;



- (float)samplingrateValue {
	NSNumber *result = [self samplingrate];
	return [result floatValue];
}

- (void)setSamplingrateValue:(float)value_ {
	[self setSamplingrate:[NSNumber numberWithFloat:value_]];
}

- (float)primitiveSamplingrateValue {
	NSNumber *result = [self primitiveSamplingrate];
	return [result floatValue];
}

- (void)setPrimitiveSamplingrateValue:(float)value_ {
	[self setPrimitiveSamplingrate:[NSNumber numberWithFloat:value_]];
}





@dynamic type;






@dynamic url;






@dynamic width;



- (int32_t)widthValue {
	NSNumber *result = [self width];
	return [result intValue];
}

- (void)setWidthValue:(int32_t)value_ {
	[self setWidth:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveWidthValue {
	NSNumber *result = [self primitiveWidth];
	return [result intValue];
}

- (void)setPrimitiveWidthValue:(int32_t)value_ {
	[self setPrimitiveWidth:[NSNumber numberWithInt:value_]];
}





@dynamic entry;

	






@end
