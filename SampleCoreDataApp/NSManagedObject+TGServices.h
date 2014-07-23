//
//  NSManagedObject+TGServices.h
//  SampleCoreDataApp
//
//  Created by John Tumminaro on 7/23/14.
//  Copyright (c) 2014 Tiny Little Gears. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObject (TGServices)

- (void)safeSetValuesForKeysWithDictionary:(NSDictionary *)keyedValues;

@end
