//
//  TGEntriesListTableViewController.h
//  SampleCoreDataApp
//
//  Created by John Tumminaro on 7/23/14.
//  Copyright (c) 2014 Tiny Little Gears. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Feed;

@interface TGEntriesListTableViewController : UITableViewController

@property(nonatomic, weak) Feed *selectedFeed;

@end
