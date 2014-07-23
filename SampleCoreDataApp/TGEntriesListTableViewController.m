//
//  TGEntriesListTableViewController.m
//  SampleCoreDataApp
//
//  Created by John Tumminaro on 7/23/14.
//  Copyright (c) 2014 Tiny Little Gears. All rights reserved.
//

#import "TGEntriesListTableViewController.h"
#import "Feed.h"
#import "Entry.h"
#import "TGContentViewController.h"

@interface TGEntriesListTableViewController () <NSFetchedResultsControllerDelegate>

@property(nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@property (nonatomic, strong) NSMutableIndexSet *deletedSectionIndexes;
@property (nonatomic, strong) NSMutableIndexSet *insertedSectionIndexes;
@property (nonatomic, strong) NSMutableArray *deletedRowIndexPaths;
@property (nonatomic, strong) NSMutableArray *insertedRowIndexPaths;
@property (nonatomic, strong) NSMutableArray *updatedRowIndexPaths;

@property (nonatomic, strong) Entry *selectedEntry;

@end

@implementation TGEntriesListTableViewController

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
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  self.title = self.selectedFeed.title;
  self.selectedEntry = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"entryCell" forIndexPath:indexPath];

  Entry *entry = [self.fetchedResultsController objectAtIndexPath:indexPath];

  UILabel *timeAgoLabel = (UILabel *)[cell viewWithTag:1];
  UILabel *titleLabel = (UILabel *)[cell viewWithTag:2];
  UILabel *snippetLabel = (UILabel *)[cell viewWithTag:3];

  timeAgoLabel.text = entry.publishedDate.timeAgoSinceNow;
  titleLabel.text = entry.title;
  snippetLabel.text = entry.contentSnippet;
  
  return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  [tableView deselectRowAtIndexPath:indexPath animated:YES];
  self.selectedEntry = [self.fetchedResultsController objectAtIndexPath:indexPath];
  [self performSegueWithIdentifier:@"pushContent" sender:self];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
  TGContentViewController *dest = segue.destinationViewController;
  dest.selectedEntry = self.selectedEntry;
}

- (NSFetchedResultsController *)fetchedResultsController {
  if (_fetchedResultsController) {
    return _fetchedResultsController;
  }

  _fetchedResultsController = [Entry MR_fetchAllSortedBy:@"publishedDate"
                                               ascending:NO
                                           withPredicate:[NSPredicate predicateWithFormat:@"feed == %@", self.selectedFeed]
                                                 groupBy:nil
                                                delegate:self];
  return _fetchedResultsController;
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
