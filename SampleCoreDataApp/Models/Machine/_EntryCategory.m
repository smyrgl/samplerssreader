// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to EntryCategory.m instead.

#import "_EntryCategory.h"

const struct EntryCategoryAttributes EntryCategoryAttributes = {
	.tag = @"tag",
};

const struct EntryCategoryRelationships EntryCategoryRelationships = {
	.entries = @"entries",
};

const struct EntryCategoryFetchedProperties EntryCategoryFetchedProperties = {
};

@implementation EntryCategoryID
@end

@implementation _EntryCategory

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"EntryCategory" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"EntryCategory";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"EntryCategory" inManagedObjectContext:moc_];
}

- (EntryCategoryID*)objectID {
	return (EntryCategoryID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic tag;






@dynamic entries;

	
- (NSMutableSet*)entriesSet {
	[self willAccessValueForKey:@"entries"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"entries"];
  
	[self didAccessValueForKey:@"entries"];
	return result;
}
	






@end
