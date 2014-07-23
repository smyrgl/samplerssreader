// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Media.h instead.

#import <CoreData/CoreData.h>


extern const struct MediaAttributes {
	__unsafe_unretained NSString *bitrate;
	__unsafe_unretained NSString *channels;
	__unsafe_unretained NSString *duration;
	__unsafe_unretained NSString *expression;
	__unsafe_unretained NSString *fileSize;
	__unsafe_unretained NSString *framerate;
	__unsafe_unretained NSString *height;
	__unsafe_unretained NSString *image;
	__unsafe_unretained NSString *isDefault;
	__unsafe_unretained NSString *lang;
	__unsafe_unretained NSString *medium;
	__unsafe_unretained NSString *samplingrate;
	__unsafe_unretained NSString *type;
	__unsafe_unretained NSString *url;
	__unsafe_unretained NSString *width;
} MediaAttributes;

extern const struct MediaRelationships {
	__unsafe_unretained NSString *entry;
} MediaRelationships;

extern const struct MediaFetchedProperties {
} MediaFetchedProperties;

@class Entry;

















@interface MediaID : NSManagedObjectID {}
@end

@interface _Media : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (MediaID*)objectID;





@property (nonatomic, strong) NSNumber* bitrate;



@property int32_t bitrateValue;
- (int32_t)bitrateValue;
- (void)setBitrateValue:(int32_t)value_;

//- (BOOL)validateBitrate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* channels;



@property int16_t channelsValue;
- (int16_t)channelsValue;
- (void)setChannelsValue:(int16_t)value_;

//- (BOOL)validateChannels:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* duration;



@property int32_t durationValue;
- (int32_t)durationValue;
- (void)setDurationValue:(int32_t)value_;

//- (BOOL)validateDuration:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* expression;



//- (BOOL)validateExpression:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* fileSize;



@property int32_t fileSizeValue;
- (int32_t)fileSizeValue;
- (void)setFileSizeValue:(int32_t)value_;

//- (BOOL)validateFileSize:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* framerate;



@property int32_t framerateValue;
- (int32_t)framerateValue;
- (void)setFramerateValue:(int32_t)value_;

//- (BOOL)validateFramerate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* height;



@property int32_t heightValue;
- (int32_t)heightValue;
- (void)setHeightValue:(int32_t)value_;

//- (BOOL)validateHeight:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSData* image;



//- (BOOL)validateImage:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* isDefault;



@property BOOL isDefaultValue;
- (BOOL)isDefaultValue;
- (void)setIsDefaultValue:(BOOL)value_;

//- (BOOL)validateIsDefault:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* lang;



//- (BOOL)validateLang:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* medium;



//- (BOOL)validateMedium:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* samplingrate;



@property float samplingrateValue;
- (float)samplingrateValue;
- (void)setSamplingrateValue:(float)value_;

//- (BOOL)validateSamplingrate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* type;



//- (BOOL)validateType:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* url;



//- (BOOL)validateUrl:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* width;



@property int32_t widthValue;
- (int32_t)widthValue;
- (void)setWidthValue:(int32_t)value_;

//- (BOOL)validateWidth:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) Entry *entry;

//- (BOOL)validateEntry:(id*)value_ error:(NSError**)error_;





@end

@interface _Media (CoreDataGeneratedAccessors)

@end

@interface _Media (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveBitrate;
- (void)setPrimitiveBitrate:(NSNumber*)value;

- (int32_t)primitiveBitrateValue;
- (void)setPrimitiveBitrateValue:(int32_t)value_;




- (NSNumber*)primitiveChannels;
- (void)setPrimitiveChannels:(NSNumber*)value;

- (int16_t)primitiveChannelsValue;
- (void)setPrimitiveChannelsValue:(int16_t)value_;




- (NSNumber*)primitiveDuration;
- (void)setPrimitiveDuration:(NSNumber*)value;

- (int32_t)primitiveDurationValue;
- (void)setPrimitiveDurationValue:(int32_t)value_;




- (NSString*)primitiveExpression;
- (void)setPrimitiveExpression:(NSString*)value;




- (NSNumber*)primitiveFileSize;
- (void)setPrimitiveFileSize:(NSNumber*)value;

- (int32_t)primitiveFileSizeValue;
- (void)setPrimitiveFileSizeValue:(int32_t)value_;




- (NSNumber*)primitiveFramerate;
- (void)setPrimitiveFramerate:(NSNumber*)value;

- (int32_t)primitiveFramerateValue;
- (void)setPrimitiveFramerateValue:(int32_t)value_;




- (NSNumber*)primitiveHeight;
- (void)setPrimitiveHeight:(NSNumber*)value;

- (int32_t)primitiveHeightValue;
- (void)setPrimitiveHeightValue:(int32_t)value_;




- (NSData*)primitiveImage;
- (void)setPrimitiveImage:(NSData*)value;




- (NSNumber*)primitiveIsDefault;
- (void)setPrimitiveIsDefault:(NSNumber*)value;

- (BOOL)primitiveIsDefaultValue;
- (void)setPrimitiveIsDefaultValue:(BOOL)value_;




- (NSString*)primitiveLang;
- (void)setPrimitiveLang:(NSString*)value;




- (NSString*)primitiveMedium;
- (void)setPrimitiveMedium:(NSString*)value;




- (NSNumber*)primitiveSamplingrate;
- (void)setPrimitiveSamplingrate:(NSNumber*)value;

- (float)primitiveSamplingrateValue;
- (void)setPrimitiveSamplingrateValue:(float)value_;




- (NSString*)primitiveType;
- (void)setPrimitiveType:(NSString*)value;




- (NSString*)primitiveUrl;
- (void)setPrimitiveUrl:(NSString*)value;




- (NSNumber*)primitiveWidth;
- (void)setPrimitiveWidth:(NSNumber*)value;

- (int32_t)primitiveWidthValue;
- (void)setPrimitiveWidthValue:(int32_t)value_;





- (Entry*)primitiveEntry;
- (void)setPrimitiveEntry:(Entry*)value;


@end
