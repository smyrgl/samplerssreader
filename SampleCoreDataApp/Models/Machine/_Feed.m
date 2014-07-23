// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Feed.m instead.

#import "_Feed.h"

const struct FeedAttributes FeedAttributes = {
	.author = @"author",
	.createdAt = @"createdAt",
	.feedDescription = @"feedDescription",
	.feedUrl = @"feedUrl",
	.link = @"link",
	.title = @"title",
	.updatedAt = @"updatedAt",
};

const struct FeedRelationships FeedRelationships = {
	.entries = @"entries",
};

const struct FeedFetchedProperties FeedFetchedProperties = {
};

@implementation FeedID
@end

@implementation _Feed

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Feed" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Feed";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Feed" inManagedObjectContext:moc_];
}

- (FeedID*)objectID {
	return (FeedID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic author;






@dynamic createdAt;






@dynamic feedDescription;






@dynamic feedUrl;






@dynamic link;






@dynamic title;






@dynamic updatedAt;






@dynamic entries;

	
- (NSMutableOrderedSet*)entriesSet {
	[self willAccessValueForKey:@"entries"];
  
	NSMutableOrderedSet *result = (NSMutableOrderedSet*)[self mutableOrderedSetValueForKey:@"entries"];
  
	[self didAccessValueForKey:@"entries"];
	return result;
}
	






@end
