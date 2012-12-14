//
//  GTBLStoreListItem.h
//  disco
//
//  Created by Ludo Goarin on 12/11/12.
//  Copyright (c) 2012 Ludo Goarin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GTBLStoreListItem : NSObject

@property NSString *LocationName;
@property NSDecimal *Longitude;
@property NSDecimal *Latitude;
@property NSString *ParentOrganizationName;
@property NSNumber *ParentOrganizationId;
@property NSString *BusinessName;
@property NSString *ApiKey;

@end
