//
//  TGGoogleFeedApiClient.m
//  SampleCoreDataApp
//
//  Created by John Tumminaro on 7/22/14.
//  Copyright (c) 2014 Tiny Little Gears. All rights reserved.
//

#import "TGGoogleFeedApiClient.h"
#import "SystemServices.h"

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


@end
