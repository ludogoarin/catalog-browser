//
//  GTBLDataHelpers.h
//  disco
//
//  Created by Ludo Goarin on 12/6/12.
//  Copyright (c) 2012 Ludo Goarin. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GTBLStore.h"
#import "GTBLCategory.h"
#import "GTBLProduct.h"
#import "GTBLProductReservation.h"

@interface GTBLDataHelpers : NSObject

+(GTBLStore *)parseJsonToStore:(NSData *)data;
+(GTBLCategory *)parseJsonToCategory:(NSData *)data;
+(GTBLProduct *)parseJsonToProduct:(NSData *)data;
+(GTBLProductReservation *)parseJsonAvailabilityToProductReservation:(NSDictionary*)data;
+(NSArray *) parseJsonToCategories:(NSData *)data;
+(NSArray *) parseJsonToProducts:(NSData *)data;
+(NSArray *) parseRawJsonToProducts:(NSData *)data;
+(NSData *) cleanupJSON:(NSData *)data;

@end
