#import "Feed.h"
#import "TGGoogleFeedApiClient.h"
#import "Entry.h"
#import "EntryCategory.h"

@interface Feed ()

// Private interface goes here.

@end


@implementation Feed

+ (void)createNewFeedWithURLString:(NSString *)url
                    withCompletion:(void(^)(Feed *newFeed, NSError *error))block {
  [[TGGoogleFeedApiClient sharedClient] GET:@"load"
                                 parameters:@{@"q": url}
                                    success:^(NSURLSessionDataTask *task, id responseObject) {
                                      NSDictionary *feedDict = [responseObject valueForKeyPath:@"responseData.feed"];
                                      if ([[responseObject valueForKey:@"responseStatus"] isEqualToNumber:@400] || !feedDict) {
                                        if (block) {
                                          NSError *noFeedError = [NSError errorWithDomain:@"com.tinylittlegears.sampleapp"
                                                                                     code:400
                                                                                 userInfo:nil];
                                          block(nil, noFeedError);
                                        }
                                      } else {
                                        Feed *createdFeed = [Feed newFeedWithDictionary:feedDict];
                                        if (createdFeed) {
                                          if (block) {
                                            block(createdFeed, nil);
                                          }
                                        } else {
                                          if (block) {
                                            NSError *unknownError = [NSError errorWithDomain:@"com.tinylittlegears.sampleapp"
                                                                                        code:500
                                                                                    userInfo:nil];
                                            block(nil, unknownError);
                                          }
                                        }
                                      }
                                    }
                                    failure:^(NSURLSessionDataTask *task, NSError *error) {
                                      if (block) {
                                        block(nil, error);
                                      }
                                    }];

}

- (void)updateFeedWithCompletion:(void(^)(BOOL success, NSError *error))block {
  [Feed createNewFeedWithURLString:self.link
                    withCompletion:^(Feed *newFeed, NSError *error) {
                      if (block) {
                        if (newFeed) {
                          block(YES, nil);
                        } else {
                          block(NO, error);
                        }
                      }
                    }];
}

#pragma mark - Object Mapping

+ (Feed *)newFeedWithDictionary:(NSDictionary *)dictionary {
  if (!dictionary[@"link"]) {
    return nil;
  }
  Feed *newFeed = [Feed MR_findFirstByAttribute:@"link" withValue:dictionary[@"link"]];
  if (!newFeed) {
    newFeed = [Feed MR_createEntity];
  }
  [newFeed safeSetValuesForKeysWithDictionary:dictionary];
  newFeed.feedDescription = dictionary[@"description"];

  for (NSDictionary *entryDict in dictionary[@"entries"]) {
    Entry *newEntry = [Entry MR_findFirstWithPredicate:[NSPredicate predicateWithFormat:@"feed == %@ AND link == %@", newFeed, entryDict[@"link"]]];
    if (!newEntry) {
      newEntry = [Entry MR_createEntity];
      newEntry.feed = newFeed;
    }
    [newEntry safeSetValuesForKeysWithDictionary:entryDict];
    for (NSString *categoryTag in entryDict[@"categories"]) {
      EntryCategory *category = [EntryCategory MR_findFirstByAttribute:@"tag" withValue:categoryTag];
      if (!category) {
        category = [EntryCategory MR_createEntity];
        category.tag = categoryTag;
      }
      [category addEntriesObject:newEntry];
    }
  }

  [[NSManagedObjectContext MR_defaultContext] MR_saveOnlySelfAndWait];

  return newFeed;
}

- (NSDate *)lastUpdate {
  return [self latestEntry].publishedDate;
}

- (Entry *)latestEntry {
  NSArray *sortedArray = [self.entries sortedArrayUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"publishedDate" ascending:NO]]];
  return [sortedArray firstObject];
}

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
