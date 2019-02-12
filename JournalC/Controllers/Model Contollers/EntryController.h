//
//  EntryController.h
//  JournalC
//
//  Created by Ben Huggins on 2/11/19.
//  Copyright © 2019 User. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entry.h"

NS_ASSUME_NONNULL_BEGIN

@interface EntryController : NSObject

// array for entries
@property (nonatomic, strong) NSMutableArray *entries;


//singleton
+ (EntryController *)sharedController;

// add entry method declaration
- (void)addEntry:(Entry *)entry;
- (void)removeEntry:(Entry *)entry;
- (void)updateEntry:(Entry *)entry withTitle:(NSString *)title bodyText:(NSString *)bodyText;
- (void)saveToPersistentStorage;
- (void)loadFromPersistentStorage;

@end

NS_ASSUME_NONNULL_END
