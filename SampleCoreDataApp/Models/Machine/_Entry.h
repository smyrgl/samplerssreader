// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Entry.h instead.

#import <CoreData/CoreData.h>


extern const struct EntryAttributes {
	__unsafe_unretained NSString *content;
	__unsafe_unretained NSString *contentSnippet;
	__unsafe_unretained NSString *createdAt;
	__unsafe_unretained NSString *link;
	__unsafe_unretained NSString *publishedDate;
	__unsafe_unretained NSString *title;
	__unsafe_unretained NSString *updatedAt;
} EntryAttributes;

extern const struct EntryRelationships {
	__unsafe_unretained NSString *categories;
	__unsafe_unretained NSString *feed;
	__unsafe_unretained NSString *media;
} EntryRelationships;

extern const struct EntryFetchedProperties {
} EntryFetchedProperties;

@class EntryCategory;
@class Feed;
@class Media;









@interface EntryID : NSManagedObjectID {}
@end

@interface _Entry : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (EntryID*)objectID;





@property (nonatomic, strong) NSString* content;



//- (BOOL)validateContent:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* contentSnippet;



//- (BOOL)validateContentSnippet:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* createdAt;



//- (BOOL)validateCreatedAt:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* link;



//- (BOOL)validateLink:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* publishedDate;



//- (BOOL)validatePublishedDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* title;



//- (BOOL)validateTitle:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* updatedAt;



//- (BOOL)validateUpdatedAt:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *categories;

- (NSMutableSet*)categoriesSet;




@property (nonatomic, strong) Feed *feed;

//- (BOOL)validateFeed:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSSet *media;

- (NSMutableSet*)mediaSet;





@end

@interface _Entry (CoreDataGeneratedAccessors)

- (void)addCategories:(NSSet*)value_;
- (void)removeCategories:(NSSet*)value_;
- (void)addCategoriesObject:(EntryCategory*)value_;
- (void)removeCategoriesObject:(EntryCategory*)value_;

- (void)addMedia:(NSSet*)value_;
- (void)removeMedia:(NSSet*)value_;
- (void)addMediaObject:(Media*)value_;
- (void)removeMediaObject:(Media*)value_;

@end

@interface _Entry (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveContent;
- (void)setPrimitiveContent:(NSString*)value;




- (NSString*)primitiveContentSnippet;
- (void)setPrimitiveContentSnippet:(NSString*)value;




- (NSDate*)primitiveCreatedAt;
- (void)setPrimitiveCreatedAt:(NSDate*)value;




- (NSString*)primitiveLink;
- (void)setPrimitiveLink:(NSString*)value;




- (NSDate*)primitivePublishedDate;
- (void)setPrimitivePublishedDate:(NSDate*)value;




- (NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(NSString*)value;




- (NSDate*)primitiveUpdatedAt;
- (void)setPrimitiveUpdatedAt:(NSDate*)value;





- (NSMutableSet*)primitiveCategories;
- (void)setPrimitiveCategories:(NSMutableSet*)value;



- (Feed*)primitiveFeed;
- (void)setPrimitiveFeed:(Feed*)value;



- (NSMutableSet*)primitiveMedia;
- (void)setPrimitiveMedia:(NSMutableSet*)value;


@end
