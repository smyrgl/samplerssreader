#import "_Feed.h"

@class Entry;

@interface Feed : _Feed {}

+ (void)createNewFeedWithURLString:(NSString *)url
                    withCompletion:(void(^)(Feed *newFeed, NSError *error))block;

- (void)updateFeedWithCompletion:(void(^)(BOOL success, NSError *error))block;

- (NSDate *)lastUpdate;
- (Entry *)latestEntry;

@end
