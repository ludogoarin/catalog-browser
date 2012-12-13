//
//  gtblAppBase.h
//  disco
//
//  Created by Ludo Goarin on 12/6/12.
//  Copyright (c) 2012 Ludo Goarin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "gtblStore.h"
#import "gtblCategory.h"
#import "gtblProduct.h"

extern NSMutableArray *_cachedStores;
extern NSString *_currentApiKey;
extern gtblStore *_currentStore;
extern gtblCategory *_currentCategory;
extern gtblProduct *_currentProduct;
extern NSNumber *_currentCategoryId;

@interface gtblAppBase

-(gtblStore*)getStoreFromCache:(NSString*) apiKey;
-(NSArray*)getProductListByCategoryFromCache:(NSString*) apiKey categoryId:(NSNumber*) categoryId;

@end
