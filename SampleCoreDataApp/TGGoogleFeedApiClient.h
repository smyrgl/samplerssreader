//
//  TGGoogleFeedApiClient.h
//  SampleCoreDataApp
//
//  Created by John Tumminaro on 7/22/14.
//  Copyright (c) 2014 Tiny Little Gears. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface TGGoogleFeedApiClient : AFHTTPSessionManager

+ (instancetype)sharedClient;

@end
