//
//  gtblDataHelpers.h
//  disco
//
//  Created by Ludo Goarin on 12/6/12.
//  Copyright (c) 2012 Ludo Goarin. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "gtblStore.h"
#import "gtblCategory.h"
#import "gtblProduct.h"

@interface gtblDataHelpers : NSObject

+(gtblStore *)parseJsonToStore:(NSData *) data;
+(gtblCategory *)parseJsonToCategory:(NSData *) data;
+(gtblProduct *)parseJsonToProduct:(NSData *) data;
+(NSArray *) parseJsonToCategories:(NSData *) data;
+(NSArray *) parseJsonToProducts:(NSData *) data;
+(NSArray *) parseRawJsonToProducts:(NSData *)data;

@end
