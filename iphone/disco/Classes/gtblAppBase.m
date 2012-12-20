//
//  GTBLAppBase.m
//  disco
//
//  Created by Ludo Goarin on 12/6/12.
//  Copyright (c) 2012 Ludo Goarin. All rights reserved.
//

#import "GTBLAppBase.h"

@implementation GTBLAppBase

-(GTBLStore*)getStoreFromCache:(NSString*) apiKey{
    NSEnumerator *e = [_cachedStores objectEnumerator];
    id item;
    while (item = [e nextObject]) {
        GTBLStore *store = ((GTBLStore*)item);
        NSString *cacheItemApiKey = store.WidgetAPIKey;
        if ([cacheItemApiKey isEqualToString: [apiKey lowercaseString]]){
            return store;
        }
    };
    return nil;
}

-(NSArray*)getProductListByCategoryFromCache:(NSString*) apiKey categoryId:(NSNumber*) categoryId{
    GTBLStore *store = [self getStoreFromCache:apiKey];
    
    if (!store) {
        return nil;
    } else {
        // find category in list
        NSEnumerator *e = [store.Categories objectEnumerator];
        id item;
        while (item = [e nextObject]) {
            GTBLCategory *category = ((GTBLCategory*)item);
            NSNumber *cacheItemId = category.CategoryId;
            if ([cacheItemId isEqualToNumber: categoryId]){
                return category.Products;
            }
        };
    }
    
    return nil;
}

-(UIColor*)RGB:(int)red green:(int)green blue:(int)blue {
    return [[UIColor alloc] initWithRed:(red/255.f) green:(green/255.f) blue:(blue/255.f) alpha:1];
}

@end

NSMutableArray *_cachedStores;
NSString *_currentApiKey;
GTBLStore *_currentStore;
GTBLCategory *_currentCategory;
GTBLProduct *_currentProduct;
NSNumber *_currentCategoryId;