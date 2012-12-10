//
//  gtblCategoryListViewController.h
//  disco
//
//  Created by Ludo Goarin on 12/6/12.
//  Copyright (c) 2012 Ludo Goarin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "gtblStore.h"

@interface gtblCategoryListViewController : UICollectionViewController

-(void)fetchedStoreLocation:(gtblStore *)store;
-(void)fetchedCategoryProducts:(NSData *)responseData;

@end
