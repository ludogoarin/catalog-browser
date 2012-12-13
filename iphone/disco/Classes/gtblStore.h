//
//  gtblStore.h
//  disco
//
//  Created by Ludo Goarin on 12/6/12.
//  Copyright (c) 2012 Ludo Goarin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface gtblStore : NSObject

@property NSDate *FetchTimeStamp;
@property NSString *LocationName;
@property NSDecimal *Longitude;
@property NSDecimal *Latitude;
@property NSString *ParentOrganizationName;
@property NSNumber *ParentOrganizationId;
@property NSString *BusinessName;
@property NSNumber *BusinessLocationId;
@property Boolean Claimed;
@property Boolean PhysicalLocation;
@property Boolean MailDelivery;
@property Boolean LocalDelivery;
@property NSString *Description;
@property NSString *WebsiteUrl;
@property NSString *Phone;
@property NSString *Currency;
@property NSString *TimeZoneId;
@property Boolean OnlineBookingEnabled;
@property NSNumber *OnlineBookingMethod;
@property NSString *City;
@property NSString *State;
@property NSString *StreetAddress;
@property NSString *StreetAddress2;
@property NSString *PostalCode;
@property NSString *Country;
@property NSString *WidgetAPIKey;
@property Boolean IsPayPalPrimaryGateway;
@property NSArray *Categories;
//@property BusinessExtendedProperties ExtendedProperties;

@end
