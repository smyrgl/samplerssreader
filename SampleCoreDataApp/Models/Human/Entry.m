#import "Entry.h"
#import "TGGoogleFeedApiClient.h"

@interface Entry ()

// Private interface goes here.

@end


@implementation Entry

#pragma mark - Defaults

- (void)awakeFromInsert {
  [super awakeFromInsert];
  [self setPrimitiveCreatedAt:[NSDate date]];
}

- (void)willSave {
  [super willSave];
  [self setPrimitiveUpdatedAt:[NSDate date]];
}

@end
