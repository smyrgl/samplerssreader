// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to EntryCategory.h instead.

#import <CoreData/CoreData.h>


extern const struct EntryCategoryAttributes {
	__unsafe_unretained NSString *tag;
} EntryCategoryAttributes;

extern const struct EntryCategoryRelationships {
	__unsafe_unretained NSString *entries;
} EntryCategoryRelationships;

extern const struct EntryCategoryFetchedProperties {
} EntryCategoryFetchedProperties;

@class Entry;



@interface EntryCategoryID : NSManagedObjectID {}
@end

@interface _EntryCategory : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (EntryCategoryID*)objectID;





@property (nonatomic, strong) NSString* tag;



//- (BOOL)validateTag:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *entries;

- (NSMutableSet*)entriesSet;





@end

@interface _EntryCategory (CoreDataGeneratedAccessors)

- (void)addEntries:(NSSet*)value_;
- (void)removeEntries:(NSSet*)value_;
- (void)addEntriesObject:(Entry*)value_;
- (void)removeEntriesObject:(Entry*)value_;

@end

@interface _EntryCategory (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveTag;
- (void)setPrimitiveTag:(NSString*)value;





- (NSMutableSet*)primitiveEntries;
- (void)setPrimitiveEntries:(NSMutableSet*)value;


@end
