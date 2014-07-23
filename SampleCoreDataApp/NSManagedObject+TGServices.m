//
//  NSManagedObject+TGServices.m
//  SampleCoreDataApp
//
//  Created by John Tumminaro on 7/23/14.
//  Copyright (c) 2014 Tiny Little Gears. All rights reserved.
//

#import "NSManagedObject+TGServices.h"

@interface NSDate (TGServices)

+ (instancetype)dateFromInternetString:(NSString *)dateString;

@end

@implementation NSDate (TGServices)

+ (instancetype)dateFromInternetString:(NSString *)dateString
{
  // Setup Date & Formatter
  NSDate *date = nil;
  static NSDateFormatter *formatter = nil;
  if (!formatter) {
    NSLocale *en_US_POSIX = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:en_US_POSIX];
    [formatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
  }

  /*
   *  RFC3339
   */

  NSString *RFC3339String = [[NSString stringWithString:dateString] uppercaseString];
  RFC3339String = [RFC3339String stringByReplacingOccurrencesOfString:@"Z" withString:@"-0000"];

  // Remove colon in timezone as iOS 4+ NSDateFormatter breaks
  // See https://devforums.apple.com/thread/45837
  if (RFC3339String.length > 20) {
    RFC3339String = [RFC3339String stringByReplacingOccurrencesOfString:@":"
                                                             withString:@""
                                                                options:0
                                                                  range:NSMakeRange(20, RFC3339String.length-20)];
  }

  if (!date) { // 1996-12-19T16:39:57-0800
    [formatter setDateFormat:@"yyyy'-'MM'-'dd'T'HH':'mm':'ssZZZ"];
    date = [formatter dateFromString:RFC3339String];
  }
  if (!date) { // 1937-01-01T12:00:27.87+0020
    [formatter setDateFormat:@"yyyy'-'MM'-'dd'T'HH':'mm':'ss.SSSZZZ"];
    date = [formatter dateFromString:RFC3339String];
  }
  if (!date) { // 1937-01-01T12:00:27
    [formatter setDateFormat:@"yyyy'-'MM'-'dd'T'HH':'mm':'ss"];
    date = [formatter dateFromString:RFC3339String];
  }
  if (date) return date;

  /*
   *  RFC822
   */

  NSString *RFC822String = [[NSString stringWithString:dateString] uppercaseString];
  if (!date) { // Sun, 19 May 02 15:21:36 GMT
    [formatter setDateFormat:@"EEE, d MMM yy HH:mm:ss zzz"];
    date = [formatter dateFromString:RFC822String];
  }
  if (!date) { // Sun, 19 May 2002 15:21:36 GMT
    [formatter setDateFormat:@"EEE, d MMM yyyy HH:mm:ss zzz"];
    date = [formatter dateFromString:RFC822String];
  }
  if (!date) {  // Sun, 19 May 2002 15:21 GMT
    [formatter setDateFormat:@"EEE, d MMM yyyy HH:mm zzz"];
    date = [formatter dateFromString:RFC822String];
  }
  if (!date) {  // 19 May 2002 15:21:36 GMT
    [formatter setDateFormat:@"d MMM yyyy HH:mm:ss zzz"];
    date = [formatter dateFromString:RFC822String];
  }
  if (!date) {  // 19 May 2002 15:21 GMT
    [formatter setDateFormat:@"d MMM yyyy HH:mm zzz"];
    date = [formatter dateFromString:RFC822String];
  }
  if (!date) {  // 19 May 2002 15:21:36
    [formatter setDateFormat:@"d MMM yyyy HH:mm:ss"];
    date = [formatter dateFromString:RFC822String];
  }
  if (!date) {  // 19 May 2002 15:21
    [formatter setDateFormat:@"d MMM yyyy HH:mm"];
    date = [formatter dateFromString:RFC822String];
  }
  if (!date) {
    [formatter setDateFormat:@"MM/d/yyyy"];
    date = [formatter dateFromString:RFC822String];
  }
  if (date) return date;

  // Failed
  return nil;

}

@end

@implementation NSManagedObject (TGServices)

- (void)safeSetValuesForKeysWithDictionary:(NSDictionary *)keyedValues
{
  NSParameterAssert(keyedValues);
  NSDictionary *attributes = [[self entity] attributesByName];
  for (NSString *attribute in attributes) {
    id value = [keyedValues objectForKey:attribute];
    if (value == nil || value == [NSNull null]) {
      continue;
    }
    NSAttributeType attributeType = [[attributes objectForKey:attribute] attributeType];
    if ((attributeType == NSStringAttributeType) && ([value isKindOfClass:[NSNumber class]])) {
      value = [value stringValue];
    } else if (((attributeType == NSInteger16AttributeType) || (attributeType == NSInteger32AttributeType) || (attributeType == NSInteger64AttributeType) || (attributeType == NSBooleanAttributeType)) && ([value isKindOfClass:[NSString class]])) {
      value = [NSNumber numberWithInteger:[value integerValue]];
    } else if ((attributeType == NSFloatAttributeType) &&  ([value isKindOfClass:[NSString class]])) {
      value = [NSNumber numberWithDouble:[value doubleValue]];
    } else if ((attributeType == NSDateAttributeType) && ([value isKindOfClass:[NSString class]])) {
      value = [NSDate dateFromInternetString:value];
    }
    [self setValue:value forKey:attribute];
  }
}

@end
