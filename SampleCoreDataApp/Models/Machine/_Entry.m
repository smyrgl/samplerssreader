// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Entry.m instead.

#import "_Entry.h"

const struct EntryAttributes EntryAttributes = {
	.content = @"content",
	.contentSnippet = @"contentSnippet",
	.createdAt = @"createdAt",
	.link = @"link",
	.publishedDate = @"publishedDate",
	.title = @"title",
	.updatedAt = @"updatedAt",
};

const struct EntryRelationships EntryRelationships = {
	.categories = @"categories",
	.feed = @"feed",
	.media = @"media",
};

const struct EntryFetchedProperties EntryFetchedProperties = {
};

@implementation EntryID
@end

@implementation _Entry

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Entry" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Entry";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Entry" inManagedObjectContext:moc_];
}

- (EntryID*)objectID {
	return (EntryID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic content;






@dynamic contentSnippet;






@dynamic createdAt;






@dynamic link;






@dynamic publishedDate;






@dynamic title;






@dynamic updatedAt;






@dynamic categories;

	
- (NSMutableSet*)categoriesSet {
	[self willAccessValueForKey:@"categories"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"categories"];
  
	[self didAccessValueForKey:@"categories"];
	return result;
}
	

@dynamic feed;

	

@dynamic media;

	
- (NSMutableSet*)mediaSet {
	[self willAccessValueForKey:@"media"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"media"];
  
	[self didAccessValueForKey:@"media"];
	return result;
}
	






@end
