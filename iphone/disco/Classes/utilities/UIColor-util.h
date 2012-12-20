//
//  UIColor-util.h
//  disco
//
//  Created by Ludo Goarin on 12/14/12.
//  Copyright (c) 2012 Ludo Goarin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIColor (util)
+ (UIColor *) colorWithHexString:(NSString *)hex;
+ (UIColor *) colorWithHexValue: (NSInteger) hex;
@end
