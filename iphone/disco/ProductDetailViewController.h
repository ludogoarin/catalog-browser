//
//  GTBLProductDetailViewController.h
//  disco
//
//  Created by Ludo Goarin on 12/6/12.
//  Copyright (c) 2012 Ludo Goarin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GTBLProduct.h"

@interface ProductDetailViewController : UIViewController

@property GTBLProduct *detailItem;
@property UIView *datePickerView;
@property UIDatePicker *startDatePicker;
@property UIDatePicker *endDatePicker;

@property (weak, nonatomic) IBOutlet UIView *detailBookingView;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (weak, nonatomic) IBOutlet UIImageView *detailProductImg;
@property (weak, nonatomic) IBOutlet UILabel *detailRate;
@property (weak, nonatomic) IBOutlet UIButton *detailBookStart;
@property (weak, nonatomic) IBOutlet UIButton *detailBookEnd;
@property (weak, nonatomic) IBOutlet UIButton *detailGetPricing;
@property (weak, nonatomic) IBOutlet UILabel *detailPricingResult;
@property (weak, nonatomic) IBOutlet UILabel *detailRentalDuration;

@end
