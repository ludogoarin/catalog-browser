//
//  GTBLProductReservation.h
//  disco
//
//  Created by Ludo Goarin on 12/18/12.
//  Copyright (c) 2012 Ludo Goarin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GTBLProductReservation : NSObject

@property NSDate *FetchTimeStamp;
@property NSNumber *ProductId;
@property int Quantity;
@property NSDate *RentalStart;
@property NSDate *RentalEnd;
@property NSString *RentalStartDayOfWeek;
@property NSString *RentalEndDayOfWeek;
@property int RentalTotalDays;
@property int RentalTotalHours;
@property int RentalTotalMinutes;
@property NSNumber *Price;
@property int Availability;
@property NSNumber *RateAmount;
@property NSString *RateTimeUnit;
@property NSNumber *RateUnitCount;
@property NSNumber *RatePerUnitCount;
@property BOOL IsValid;
@property int ReturnCode;
@property NSArray *Messages;

@end
