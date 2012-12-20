//
//  GTBLProductDetailViewController.m
//  disco
//
//  Created by Ludo Goarin on 12/6/12.
//  Copyright (c) 2012 Ludo Goarin. All rights reserved.
//

#import "ProductDetailViewController.h"
#import "GTBLAppBase.h"
#import "GTBLServiceHandler.h"
#import "URLImageCached.h"
#import "UIColor-util.h"

@interface ProductDetailViewController ()

@end

@implementation ProductDetailViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)configureView {
    // Update the user interface for the detail item.
    
    if (_currentProduct) {
        NSLog(@"loaded: product detail: %@", _currentProduct.Name);
        
        // style booking fields container view
        self.detailBookingView.layer.borderColor = [[UIColor colorWithRed:0.8f green:0.8f blue:0.8f alpha:1.0f] CGColor];
        self.detailBookingView.layer.borderWidth = 1.0f;
        self.detailBookingView.layer.cornerRadius = 6;

        NSString *imageURL = _currentProduct.Picture_thumbnail;
        
        self.detailDescriptionLabel.text = _currentProduct.Name;

        self.detailRate.text = [NSString stringWithFormat:@"$%@ per %@-%@", _currentProduct.Rate, _currentProduct.RateUnitCount, _currentProduct.RateUnit];
        
        NSString *noImgUrl = @"http://www.getable.com/content/images/catalog/no-photo_400x300.png";
        NSString *imgUrl = imageURL.length > 0 ? imageURL : noImgUrl;
        
        [URLImageCached loadImageWithURL:imgUrl withLoadCompleteHandler:[self setImageBlock:self.detailProductImg]];
        
        // buttons
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setLocale:[NSLocale currentLocale]];
        [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
        [dateFormatter setDateStyle:NSDateFormatterShortStyle];
        NSDate *now = [NSDate date];

        [self.detailBookStart setTitle:[dateFormatter stringFromDate:now] forState:UIControlStateNormal];
        [self.detailBookEnd setTitle:[dateFormatter stringFromDate:now] forState:UIControlStateNormal];

        [self.detailBookStart addTarget:self action:@selector(bookDatePickerButtonTouch:) forControlEvents: UIControlEventTouchUpInside];
        [self.detailBookEnd addTarget:self action:@selector(bookDatePickerButtonTouch:) forControlEvents: UIControlEventTouchUpInside];
        [self.detailGetPricing addTarget:self action:@selector(getPricingTouch:) forControlEvents:UIControlEventTouchUpInside];
    }
}
         
- (void)bookDatePickerButtonTouch:(UIButton *)sender {
    
    int height = 255;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    [dateFormatter setDateStyle:NSDateFormatterShortStyle];
    NSDate *startDate = [dateFormatter dateFromString:self.detailBookStart.titleLabel.text];
    NSDate *endDate = [dateFormatter dateFromString:self.detailBookEnd.titleLabel.text];
    
    //create new view
    UIView * newView = [[UIView alloc] initWithFrame:CGRectMake(0, 200, 320, height)];
    newView.backgroundColor = [UIColor colorWithWhite:1 alpha:1];
    
    //add toolbar
    UIToolbar * toolbar = [[UIToolbar alloc] initWithFrame: CGRectMake(0, 0, 320, 40)];
    toolbar.barStyle = UIBarStyleBlack;

    //add button
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                   style:UIBarButtonItemStyleDone
                                   target:self
                                   action:@selector(animateDatePickerOut:)
                                   ];
    
    
    // choose whatever width you need instead of 600
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 600, 23)];
    label.textAlignment = NSTextAlignmentLeft;
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor colorWithHexString:@"#FFFFFF"];
    label.font = [UIFont boldSystemFontOfSize:12.0];
    UIBarButtonItem *toolBarTitle = [[UIBarButtonItem alloc] initWithCustomView:label];

    toolbar.items = [NSArray arrayWithObjects:doneButton, toolBarTitle, nil];
    
    // add date picker
    UIDatePicker *datePicker = [[UIDatePicker alloc] init];
    datePicker.datePickerMode = UIDatePickerModeDateAndTime ;
    datePicker.hidden = NO;
    datePicker.minuteInterval = 15;
    datePicker.frame = CGRectMake(0, 40, 320, 250);
    
    // add event listener to date picker
    [datePicker addTarget:self
                action:@selector(selectDateTime:)
                forControlEvents:UIControlEventValueChanged];

    // add date picker at index 0
    [newView addSubview:datePicker];

    // add popup view at index 1
    [newView addSubview:toolbar];
    [self.view addSubview:newView];
    
    if(sender == self.detailBookStart) {
        label.text = @"Start date & time";
        self.startDatePicker = datePicker;
        datePicker.date = startDate;

    } else if (sender == self.detailBookEnd) {
        label.text = @"End date & time";
        self.endDatePicker = datePicker;
        datePicker.date = endDate;
    }
    
    //animate it onto the screen    
    [self animateDatePickerIn:newView];
}

- (void)selectDateTime:(UIDatePicker*)datePicker {
    
    NSDate *selDate = datePicker.date;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setLocale:[NSLocale currentLocale]];
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    [dateFormatter setDateStyle:NSDateFormatterShortStyle];
    //[dateFormatter setDateFormat:@"mm-dd-yyyy hh:mm zzz"];
    NSString *selDateString = [dateFormatter stringFromDate:selDate];
    
    if (datePicker == self.startDatePicker) {
        [self.detailBookStart setTitle:selDateString forState:UIControlStateNormal];
    } else if (datePicker == self.endDatePicker) {
        [self.detailBookEnd setTitle:selDateString forState:UIControlStateNormal];
    }
}

- (void)animateDatePickerIn:(UIView*)datePicker {
    CGRect temp = datePicker.frame;
    temp.origin.y = CGRectGetMaxY(self.view.bounds);
    datePicker.frame = temp;
    [UIView beginAnimations:nil context:nil];
    temp.origin.y -= datePicker.bounds.size.height;
    datePicker.frame = temp;
    [UIView commitAnimations];
    
    // set current date picker view
    self.datePickerView = datePicker;
}

- (void)animateDatePickerOut:(id)sender {
    UIView *view = self.datePickerView;
    CGRect temp = view.frame;
    [UIView beginAnimations:nil context:nil];
    temp.origin.y += CGRectGetMaxY(self.view.bounds);
    view.frame = temp;
    [UIView commitAnimations];
    
    [self selectDateTime:[view.subviews objectAtIndex:0]];
}

- (void)getPricingTouch:(id)sender {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    [dateFormatter setDateStyle:NSDateFormatterShortStyle];
    NSString *startDateString = self.detailBookStart.titleLabel.text;
    NSString *endDateString = self.detailBookEnd.titleLabel.text;
    NSDate *startDate = [dateFormatter dateFromString:startDateString];
    NSDate *endDate = [dateFormatter dateFromString:endDateString];
    NSTimeInterval rentalDuration = [endDate timeIntervalSinceDate:startDate];
    
    [GTBLServiceHandler getProductAvailability:_currentApiKey
                                     productId:_currentProduct.BusinessProductId
                                         start:startDateString
                                           end:endDateString
                                      quantity:1
                              callBackDelegate:self
                              callBackSelector:@selector(fetchedProductPricing:)];
}

- (void) fetchedProductPricing:(GTBLProductReservation*)pricing {
    self.detailPricingResult.text = [NSString stringWithFormat:@"$%@",
                                     pricing.Price
                                     ];
    self.detailRentalDuration.text = [NSString stringWithFormat:@"%d days, %d hrs, %d mins",
                                     pricing.RentalTotalDays,
                                     pricing.RentalTotalHours,
                                     pricing.RentalTotalMinutes
                                     ];
}

- (URLImageLoadCompleteHandler)setImageBlock:(UIImageView *) img{
    return [^void(UIImage *loadedImage, NSString *url) {
        img.image = loadedImage;
    } copy];
}


@end
