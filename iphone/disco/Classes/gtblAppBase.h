//
//  GTBLAppBase.h
//  disco
//
//  Created by Ludo Goarin on 12/6/12.
//  Copyright (c) 2012 Ludo Goarin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

#import "GTBLStore.h"
#import "GTBLCategory.h"
#import "GTBLProduct.h"
#import "GTBLProductReservation.h"

extern NSMutableArray *_cachedStores;
extern NSString *_currentApiKey;
extern GTBLStore *_currentStore;
extern GTBLCategory *_currentCategory;
extern GTBLProduct *_currentProduct;
extern NSNumber *_currentCategoryId;

@interface GTBLAppBase

-(GTBLStore*)getStoreFromCache:(NSString*) apiKey;
-(NSArray*)getProductListByCategoryFromCache:(NSString*) apiKey categoryId:(NSNumber*) categoryId;
-(UIColor*)RGB:(int)red green:(int)green blue:(int)blue;

@end
