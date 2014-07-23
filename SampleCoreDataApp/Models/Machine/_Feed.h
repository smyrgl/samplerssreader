// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Feed.h instead.

#import <CoreData/CoreData.h>


extern const struct FeedAttributes {
	__unsafe_unretained NSString *author;
	__unsafe_unretained NSString *createdAt;
	__unsafe_unretained NSString *feedDescription;
	__unsafe_unretained NSString *feedUrl;
	__unsafe_unretained NSString *link;
	__unsafe_unretained NSString *title;
	__unsafe_unretained NSString *updatedAt;
} FeedAttributes;

extern const struct FeedRelationships {
	__unsafe_unretained NSString *entries;
} FeedRelationships;

extern const struct FeedFetchedProperties {
} FeedFetchedProperties;

@class Entry;









@interface FeedID : NSManagedObjectID {}
@end

@interface _Feed : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (FeedID*)objectID;





@property (nonatomic, strong) NSString* author;



//- (BOOL)validateAuthor:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* createdAt;



//- (BOOL)validateCreatedAt:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* feedDescription;



//- (BOOL)validateFeedDescription:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* feedUrl;



//- (BOOL)validateFeedUrl:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* link;



//- (BOOL)validateLink:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* title;



//- (BOOL)validateTitle:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* updatedAt;



//- (BOOL)validateUpdatedAt:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSOrderedSet *entries;

- (NSMutableOrderedSet*)entriesSet;





@end

@interface _Feed (CoreDataGeneratedAccessors)

- (void)addEntries:(NSOrderedSet*)value_;
- (void)removeEntries:(NSOrderedSet*)value_;
- (void)addEntriesObject:(Entry*)value_;
- (void)removeEntriesObject:(Entry*)value_;

@end

@interface _Feed (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveAuthor;
- (void)setPrimitiveAuthor:(NSString*)value;




- (NSDate*)primitiveCreatedAt;
- (void)setPrimitiveCreatedAt:(NSDate*)value;




- (NSString*)primitiveFeedDescription;
- (void)setPrimitiveFeedDescription:(NSString*)value;




- (NSString*)primitiveFeedUrl;
- (void)setPrimitiveFeedUrl:(NSString*)value;




- (NSString*)primitiveLink;
- (void)setPrimitiveLink:(NSString*)value;




- (NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(NSString*)value;




- (NSDate*)primitiveUpdatedAt;
- (void)setPrimitiveUpdatedAt:(NSDate*)value;





- (NSMutableOrderedSet*)primitiveEntries;
- (void)setPrimitiveEntries:(NSMutableOrderedSet*)value;


@end
