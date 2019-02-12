//
//  EntryDetailViewController.h
//  JournalC
//
//  Created by Ben Huggins on 2/11/19.
//  Copyright © 2019 User. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EntryController.h"

NS_ASSUME_NONNULL_BEGIN

@interface EntryDetailViewController : UIViewController

@property (nonatomic, strong) Entry *entry;

@end

NS_ASSUME_NONNULL_END
