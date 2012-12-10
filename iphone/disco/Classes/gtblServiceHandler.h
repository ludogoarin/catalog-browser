//
//  gtblServiceHandler.h
//  disco
//
//  Created by Ludo Goarin on 12/6/12.
//  Copyright (c) 2012 Ludo Goarin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface gtblServiceHandler : NSObject

+ (void) getStoreLocation:(NSString*)apiKey callBackDelegate:(id) callBackDelegate callBackSelector:(SEL) callBackSelector;
+ (void) getStoreLocationNSURL:(NSString*)apiKey;
+ (void) getStoreCategoryProducts:(NSString*)apiKey categoryId:(NSInteger)categoryId callBackDelegate:(id) callBackDelegate callBackSelector:(SEL) callBackSelector;

@end
