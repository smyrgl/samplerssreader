//
//  TGFeedListTableViewController.h
//  SampleCoreDataApp
//
//  Created by John Tumminaro on 7/23/14.
//  Copyright (c) 2014 Tiny Little Gears. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TGFeedListTableViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UIBarButtonItem *refreshButton;

- (IBAction)addNewFeed:(id)sender;
- (IBAction)refreshFeeds:(id)sender;

@end
