//
//  gtblProductListViewController.h
//  disco
//
//  Created by Ludo Goarin on 12/6/12.
//  Copyright (c) 2012 Ludo Goarin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "gtblCategory.h"
#import "gtblProduct.h"

@interface gtblProductListViewController : UITableViewController
{
    int noOfItemsInSection;
    int noOfItems;
}

@property gtblCategory *category;

@end
