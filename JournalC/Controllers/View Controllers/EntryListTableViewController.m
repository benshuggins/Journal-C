//
//  EntryListTableViewController.m
//  JournalC
//
//  Created by Ben Huggins on 2/11/19.
//  Copyright © 2019 User. All rights reserved.
//

#import "Entry.h"
#import "EntryController.h"
#import "EntryDetailViewController.h"
#import "EntryListTableViewController.h"

@interface EntryListTableViewController ()

@end

@implementation EntryListTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
   // EntryController.sharedController.loadFromPersistentStorage;
 
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [[[EntryController sharedController] entries] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EntryCell" forIndexPath:indexPath];
    
    Entry *entry = [[EntryController sharedController] entries][indexPath.row];
    cell.textLabel.text = entry.title;
   
    
    return cell;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Entry *entry = [[EntryController sharedController] entries][indexPath.row];
        [[EntryController sharedController] removeEntry:entry];
        [tableView reloadData];
    }
}

#pragma mark - Navigation

//IIDOO
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"cellToDetailVC"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
       EntryDetailViewController *destinationVC = [segue destinationViewController];
        Entry *entry = [[EntryController sharedController] entries][indexPath.row];
        destinationVC.entry = entry;
    }
}

@end
