//
//  GTBLProductListViewController.h
//  disco
//
//  Created by Ludo Goarin on 12/6/12.
//  Copyright (c) 2012 Ludo Goarin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GTBLCategory.h"
#import "GTBLProduct.h"

@interface ProductListViewController : UITableViewController
{
    int noOfItemsInSection;
    int noOfItems;
}

@property GTBLCategory *category;

@end
