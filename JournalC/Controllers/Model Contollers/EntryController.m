//
//  EntryController.m
//  JournalC
//
//  Created by Ben Huggins on 2/11/19.
//  Copyright © 2019 User. All rights reserved.
//

#import "EntryController.h"

@implementation EntryController

//singleton
+ (EntryController *)sharedController
{
    static EntryController *sharedController = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedController = [[EntryController alloc] init];
        sharedController.entries = [NSMutableArray new];
        [sharedController loadFromPersistentStorage];
    });
   
    return sharedController;
}


    -(void)addEntry:(Entry *)entry;
    
    {
        [self.entries addObject:entry];
        [self saveToPersistentStorage];
        
    }
- (void)removeEntry:(Entry *)entry
{
    [self.entries removeObject:entry];
    [self saveToPersistentStorage];
}

- (void)updateEntry:(Entry *)entry withTitle:(NSString *)title bodyText:(NSString *)bodyText
{
    entry.title = title;
    entry.bodyText = bodyText;
    [self saveToPersistentStorage];
    
}

// save to persistent storage
- (void)saveToPersistentStorage
{
    NSMutableArray *entryDictionaries = [NSMutableArray new];
    
    for (Entry *entry in self.entries) {
        [entryDictionaries addObject:entry.dictionaryRepresentation];
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:entryDictionaries forKey:@"Entries"];
}

- (void)loadFromPersistentStorage
{
    NSArray *entryDictionaries = [[NSUserDefaults standardUserDefaults] objectForKey:@"Entries"];
    for (NSDictionary *dictionary in entryDictionaries) {
        Entry *entry = [[Entry new] initWithDictionary:dictionary];
        [self addEntry:entry];
    }
    
}




@end
