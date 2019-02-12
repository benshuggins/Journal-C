//
//  EntryDetailViewController.m
//  JournalC
//
//  Created by Ben Huggins on 2/11/19.
//  Copyright © 2019 User. All rights reserved.
//

#import "EntryDetailViewController.h"
#import "Entry.h"
#import "EntryController.h"

@interface EntryDetailViewController ()

@property (weak, nonatomic) IBOutlet UITextField *entryTextField;
@property (weak, nonatomic) IBOutlet UITextView *bodyTextView;



@end

@implementation EntryDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self updateViews];
}

- (void)updateViews
{
    if (self.entry) {
        self.entryTextField.text = self.entry.title;
        self.bodyTextView.text = self.entry.bodyText;
    }
}


- (IBAction)saveButtonTapped:(id)sender
    
{
    if (self.entry) {
        [[EntryController sharedController] updateEntry:self.entry withTitle:self.entryTextField.text bodyText:_bodyTextView.text];
  
    } else {
        Entry *entry = [[Entry alloc] initWithName:self.entryTextField.text bodyText:_bodyTextView.text date:[NSDate date]];
       
        [[EntryController sharedController] addEntry:entry];
        
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)clearButtonTapped:(id)sender {
    
    {
        self.entryTextField.text = @"";
        self.bodyTextView.text = @"";
    }



}


@end
