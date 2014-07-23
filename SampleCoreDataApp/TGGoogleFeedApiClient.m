//
//  TGGoogleFeedApiClient.m
//  SampleCoreDataApp
//
//  Created by John Tumminaro on 7/22/14.
//  Copyright (c) 2014 Tiny Little Gears. All rights reserved.
//

#import "TGGoogleFeedApiClient.h"
#import "SystemServices.h"
#import "Feed.h"

@interface TGGoogleFeedApiClient ()

@property(nonatomic, strong) NSProgress *syncProgress;
@property(nonatomic, strong) NSError *syncError;
@property(nonatomic, copy) void (^syncCompletion)(BOOL success, NSError *error);

@end

@implementation TGGoogleFeedApiClient

+ (instancetype)sharedClient
{
  static TGGoogleFeedApiClient *_sharedClient = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    _sharedClient = [[TGGoogleFeedApiClient alloc] init];
  });

  return _sharedClient;
}

- (instancetype)init {
  self = [super initWithBaseURL:
             [NSURL URLWithString:@"https://ajax.googleapis.com/ajax/services/feed/"]];
  if (self) {

  }

  return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context {
  if (self.syncProgress.totalUnitCount == self.syncProgress.completedUnitCount) {
    if (self.syncCompletion) {
      self.syncCompletion(YES, nil);
    }
  }
}

- (void)unregisterObserver {
  @try {
    [self.syncProgress removeObserver:self forKeyPath:@"completedUnitCount"];
  }
  @catch (NSException *exception) {}
  @finally {}
}

- (void)dealloc {
  [self unregisterObserver];
}

- (NSURLSessionDataTask *)GET:(NSString *)URLString
                   parameters:(id)parameters
                      success:(void (^)(NSURLSessionDataTask *, id))success
                      failure:(void (^)(NSURLSessionDataTask *, NSError *))failure {
  NSMutableDictionary *newParams = [NSMutableDictionary dictionaryWithDictionary:parameters];
  [newParams setObject:[[SystemServices sharedServices] externalIPAddress]  forKey:@"userip"];
  [newParams setObject:@-1 forKey:@"num"];
  [newParams setObject:@"1.0" forKey:@"v"];

  return [super GET:URLString parameters:newParams success:success failure:failure];
}

- (void)updateAllFeedsWithCompletion:(void(^)(BOOL success, NSError *error))block {
  self.syncProgress = [NSProgress progressWithTotalUnitCount:[Feed MR_countOfEntities]];
  self.syncCompletion = block;
  self.syncError = nil;
  [self.syncProgress addObserver:self
                      forKeyPath:@"completedUnitCount"
                         options:NSKeyValueObservingOptionInitial
                         context:NULL];
  __weak typeof(self) weakSelf = self;
  self.syncProgress.cancellationHandler = ^void(void){
    weakSelf.syncCompletion(NO, weakSelf.syncError);
  };
  for (Feed *aFeed in [Feed MR_findAll]) {
    [self.syncProgress becomeCurrentWithPendingUnitCount:1];
    [aFeed updateFeedWithCompletion:^(BOOL success, NSError *error) {
      if (success) {
        dispatch_async(dispatch_get_main_queue(), ^{
          [weakSelf.syncProgress resignCurrent];
        });
      } else {
        weakSelf.syncError = error;
        [weakSelf.syncProgress cancel];
      }
    }];
  }
}


@end
