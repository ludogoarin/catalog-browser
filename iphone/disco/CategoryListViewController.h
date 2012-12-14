//
//  GTBLCategoryListViewController.h
//  disco
//
//  Created by Ludo Goarin on 12/6/12.
//  Copyright (c) 2012 Ludo Goarin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GTBLStore.h"

@interface CategoryListViewController : UICollectionViewController
{
    NSMutableArray *arrRecords;
    int noOfItemsInSection;
    int noOfItems;
    
    NSString *curLoadingURL_;
    __block id blockSelf_;
}

@property (nonatomic, retain) NSMutableArray *arrRecords;
-(void)fetchedStoreLocation:(GTBLStore *)store;
-(void)fetchedCategoryProducts:(NSData *)responseData;

@end



