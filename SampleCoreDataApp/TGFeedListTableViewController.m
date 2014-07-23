//
//  TGFeedListTableViewController.m
//  SampleCoreDataApp
//
//  Created by John Tumminaro on 7/23/14.
//  Copyright (c) 2014 Tiny Little Gears. All rights reserved.
//

#import "TGFeedListTableViewController.h"
#import "Entry.h"
#import "Feed.h"
#import <TDBadgedCell/TDBadgedCell.h>
#import <SVProgressHUD/SVProgressHUD.h>
#import "TGEntriesListTableViewController.h"

@interface TGFeedListTableViewController () <NSFetchedResultsControllerDelegate, UIAlertViewDelegate>

@property(nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@property(nonatomic, strong) UIAlertView *feedAlertView;
@property(nonatomic, strong) UITextField *feedAlertViewInputField;
@property(nonatomic, strong) Feed *selectedFeed;

@property (nonatomic, strong) NSMutableIndexSet *deletedSectionIndexes;
@property (nonatomic, strong) NSMutableIndexSet *insertedSectionIndexes;
@property (nonatomic, strong) NSMutableArray *deletedRowIndexPaths;
@property (nonatomic, strong) NSMutableArray *insertedRowIndexPaths;
@property (nonatomic, strong) NSMutableArray *updatedRowIndexPaths;

@end

@implementation TGFeedListTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.feedAlertView =   [[UIAlertView alloc] initWithTitle:@"Enter Feed URL"
                                                       message:nil
                                                      delegate:self
                                             cancelButtonTitle:@"Cancel"
                                             otherButtonTitles:@"Add", nil];
  self.feedAlertView.alertViewStyle = UIAlertViewStylePlainTextInput;
  self.feedAlertViewInputField = [self.feedAlertView textFieldAtIndex:0];

}

- (void)viewWillAppear:(BOOL)animated {
  self.selectedFeed = nil;
  [Feed updateAllFeedsWithCompletion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)performFeedRefresh {
  UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc] init];
  [activityView setColor:[UIColor darkGrayColor]];
  [activityView startAnimating];
  UIBarButtonItem *spinnerButton = [[UIBarButtonItem alloc] initWithCustomView:activityView];
  UIBarButtonItem *currentButton = self.navigationItem.leftBarButtonItem;
  [self.navigationItem setLeftBarButtonItem:spinnerButton animated:YES];
  typeof(self) weakSelf = self;
  [Feed updateAllFeedsWithCompletion:^(BOOL success, NSError *error) {
    dispatch_async(dispatch_get_main_queue(), ^{
      [activityView stopAnimating];
      [weakSelf.navigationItem setLeftBarButtonItem:currentButton animated:YES];
    });
  }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return [[[self fetchedResultsController] sections] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  id <NSFetchedResultsSectionInfo> sectionInfo = [self.fetchedResultsController sections][section];
  return [sectionInfo numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  TDBadgedCell *cell = [tableView dequeueReusableCellWithIdentifier:@"feedCell" forIndexPath:indexPath];

  Feed *thisFeed = [self.fetchedResultsController objectAtIndexPath:indexPath];
  cell.textLabel.text = thisFeed.title;
  cell.detailTextLabel.text = [thisFeed.lastUpdate timeAgoSinceNow];
  cell.badgeString = [NSString stringWithFormat:@"%lu", (unsigned long)thisFeed.entries.count];

  return cell;
}

#pragma mark - Table View Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  [tableView deselectRowAtIndexPath:indexPath animated:YES];
  self.selectedFeed = [self.fetchedResultsController objectAtIndexPath:indexPath];
  [self performSegueWithIdentifier:@"pushEntries" sender:self];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
  TGEntriesListTableViewController *dest = segue.destinationViewController;
  dest.selectedFeed = self.selectedFeed;
}

#pragma mark - Fetched Results Controller

- (NSFetchedResultsController *)fetchedResultsController {
  if (_fetchedResultsController) {
    return _fetchedResultsController;
  }

  _fetchedResultsController = [Feed MR_fetchAllSortedBy:@"title"
                                              ascending:NO
                                          withPredicate:nil
                                                groupBy:nil
                                               delegate:self];

  return _fetchedResultsController;
}

- (IBAction)addNewFeed:(id)sender {
  [self.feedAlertView show];
}

- (IBAction)refreshFeeds:(id)sender {
  [self performFeedRefresh];
}

#pragma mark - Fetched Results Controller Delegate

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath
     forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath
{
  if (type == NSFetchedResultsChangeInsert) {
    if ([self.insertedSectionIndexes containsIndex:newIndexPath.section]) {
      // If we've already been told that we're adding a section for this inserted row we skip it since it will handled by the section insertion.
      return;
    }

    [self.insertedRowIndexPaths addObject:newIndexPath];
  } else if (type == NSFetchedResultsChangeDelete) {
    if ([self.deletedSectionIndexes containsIndex:indexPath.section]) {
      // If we've already been told that we're deleting a section for this deleted row we skip it since it will handled by the section deletion.
      return;
    }

    [self.deletedRowIndexPaths addObject:indexPath];
  } else if (type == NSFetchedResultsChangeMove) {
    if ([self.insertedSectionIndexes containsIndex:newIndexPath.section] == NO) {
      [self.insertedRowIndexPaths addObject:newIndexPath];
    }

    if ([self.deletedSectionIndexes containsIndex:indexPath.section] == NO) {
      [self.deletedRowIndexPaths addObject:indexPath];
    }
  } else if (type == NSFetchedResultsChangeUpdate) {
    [self.updatedRowIndexPaths addObject:indexPath];
  }
}

- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id )sectionInfo atIndex:(NSUInteger)sectionIndex
     forChangeType:(NSFetchedResultsChangeType)type
{
  switch (type) {
    case NSFetchedResultsChangeInsert:
      [self.insertedSectionIndexes addIndex:sectionIndex];
      break;
    case NSFetchedResultsChangeDelete:
      [self.deletedSectionIndexes addIndex:sectionIndex];
      break;
    default:
      ; // Shouldn't have a default
      break;
  }
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
  NSInteger totalChanges = [self.deletedSectionIndexes count] +
  [self.insertedSectionIndexes count] +
  [self.deletedRowIndexPaths count] +
  [self.insertedRowIndexPaths count] +
  [self.updatedRowIndexPaths count];
  if (totalChanges > 50) {
    [self.tableView reloadData];
    return;
  }

  [self.tableView beginUpdates];

  [self.tableView deleteSections:self.deletedSectionIndexes withRowAnimation:UITableViewRowAnimationAutomatic];
  [self.tableView insertSections:self.insertedSectionIndexes withRowAnimation:UITableViewRowAnimationAutomatic];

  [self.tableView deleteRowsAtIndexPaths:self.deletedRowIndexPaths withRowAnimation:UITableViewRowAnimationLeft];
  [self.tableView insertRowsAtIndexPaths:self.insertedRowIndexPaths withRowAnimation:UITableViewRowAnimationRight];
  [self.tableView reloadRowsAtIndexPaths:self.updatedRowIndexPaths withRowAnimation:UITableViewRowAnimationAutomatic];

  [self.tableView endUpdates];

  // nil out the collections so their ready for their next use.
  self.insertedSectionIndexes = nil;
  self.deletedSectionIndexes = nil;
  self.deletedRowIndexPaths = nil;
  self.insertedRowIndexPaths = nil;
  self.updatedRowIndexPaths = nil;
}


#pragma mark - Alert View Delegate

- (BOOL)alertViewShouldEnableFirstOtherButton:(UIAlertView *)alertView {
  return self.feedAlertViewInputField.text.length > 0 ? YES : NO;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
  if (buttonIndex == 1) {
    [SVProgressHUD showWithStatus:@"Updating new feed..."];
    [Feed createNewFeedWithURLString:self.feedAlertViewInputField.text
                      withCompletion:^(Feed *newFeed, NSError *error) {
                        if (error) {
                          [SVProgressHUD showErrorWithStatus:error.localizedDescription];
                        } else {
                          [SVProgressHUD showSuccessWithStatus:@"Successfully updated feed!"];
                        }
                      }];
  }
}

#pragma mark - Overridden Getters

- (NSMutableIndexSet *)deletedSectionIndexes
{
  if (_deletedSectionIndexes == nil) {
    _deletedSectionIndexes = [[NSMutableIndexSet alloc] init];
  }

  return _deletedSectionIndexes;
}

- (NSMutableIndexSet *)insertedSectionIndexes
{
  if (_insertedSectionIndexes == nil) {
    _insertedSectionIndexes = [[NSMutableIndexSet alloc] init];
  }

  return _insertedSectionIndexes;
}

- (NSMutableArray *)deletedRowIndexPaths
{
  if (_deletedRowIndexPaths == nil) {
    _deletedRowIndexPaths = [[NSMutableArray alloc] init];
  }

  return _deletedRowIndexPaths;
}

- (NSMutableArray *)insertedRowIndexPaths
{
  if (_insertedRowIndexPaths == nil) {
    _insertedRowIndexPaths = [[NSMutableArray alloc] init];
  }

  return _insertedRowIndexPaths;
}

- (NSMutableArray *)updatedRowIndexPaths
{
  if (_updatedRowIndexPaths == nil) {
    _updatedRowIndexPaths = [[NSMutableArray alloc] init];
  }

  return _updatedRowIndexPaths;
}


@end
