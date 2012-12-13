//
//  gtblCategory.h
//  disco
//
//  Created by Ludo Goarin on 12/6/12.
//  Copyright (c) 2012 Ludo Goarin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface gtblCategory : NSObject

@property NSDate *FetchTimeStamp;
@property NSString *Title;
@property NSNumber *CategoryId;
@property NSString *ImageUrl;
@property NSArray *Products;

@end
