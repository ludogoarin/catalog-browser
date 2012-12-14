//
//  GTBLProduct.h
//  disco
//
//  Created by Ludo Goarin on 12/6/12.
//  Copyright (c) 2012 Ludo Goarin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GTBLProduct : NSObject

@property NSDate *FetchTimeStamp;
@property NSString *Name;
@property NSString *Description;
@property NSString *ShortDescription;
@property NSString *Picture;
@property NSString *Picture_thumbnail;
@property NSString *SKU;
@property NSNumber *BusinessProductId;
@property NSNumber *MarketplaceProductTypeId;

//lowest/display rate
@property NSNumber *Rate;
@property NSString *RateUnit;
@property NSString *RateUnitDisplayName;
@property NSString *RateCustomDisplayName;
@property NSNumber *RateUnitCount;
@property NSNumber *RateUnitMinimumQuantity;
@property NSString *MarketplaceUrl;

@property Boolean IsRetail;
@property Boolean IsFavorite;

//new properties for master/sub products
@property Boolean IsProductGroup;

// not implemented yet
//@property ProductWaiver Waiver;
//@property IEnumerable<ProductPricing> Rates;
//@property IEnumerable<BusinessCustomOption> CustomOptions;
//@property IEnumerable<ProductAttribute> ProductAttributes;
//@property IEnumerable<ProductListItem> SubProducts;

@property NSNumber *DepositAmount;

@end
