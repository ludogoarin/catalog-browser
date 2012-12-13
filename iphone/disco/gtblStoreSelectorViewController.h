//
//  gtblStoreSelectorViewController.h
//  disco
//
//  Created by Ludo Goarin on 12/6/12.
//  Copyright (c) 2012 Ludo Goarin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface gtblStoreSelectorViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *storeListTable;

@end
