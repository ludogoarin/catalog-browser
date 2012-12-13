//
//  gtblAppBase.m
//  disco
//
//  Created by Ludo Goarin on 12/6/12.
//  Copyright (c) 2012 Ludo Goarin. All rights reserved.
//

#import "gtblAppBase.h"

@implementation gtblAppBase

-(gtblStore*)getStoreFromCache:(NSString*) apiKey{
    NSEnumerator *e = [_cachedStores objectEnumerator];
    id item;
    while (item = [e nextObject]) {
        gtblStore *store = ((gtblStore*)item);
        NSString *cacheItemApiKey = store.WidgetAPIKey;
        if ([cacheItemApiKey isEqualToString: apiKey]){
            return store;
        }
    };
    return nil;
}

-(NSArray*)getProductListByCategoryFromCache:(NSString*) apiKey categoryId:(NSNumber*) categoryId{
    gtblStore *store = [self getStoreFromCache:apiKey];
    
    if (!store) {
        return nil;
    } else {
        // find category in list
        NSEnumerator *e = [store.Categories objectEnumerator];
        id item;
        while (item = [e nextObject]) {
            gtblCategory *category = ((gtblCategory*)item);
            NSNumber *cacheItemId = category.CategoryId;
            if ([cacheItemId isEqualToNumber: categoryId]){
                return category.Products;
            }
        };
    }
    
    return nil;
}

@end

NSMutableArray *_cachedStores;
NSString *_currentApiKey;
gtblStore *_currentStore;
gtblCategory *_currentCategory;
gtblProduct *_currentProduct;
NSNumber *_currentCategoryId;