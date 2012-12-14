//
//  GTBLProductDetailViewController.m
//  disco
//
//  Created by Ludo Goarin on 12/6/12.
//  Copyright (c) 2012 Ludo Goarin. All rights reserved.
//

#import "ProductDetailViewController.h"
#import "GTBLAppBase.h"
#import "URLImageCached.h"

@interface ProductDetailViewController ()

@end

@implementation ProductDetailViewController



- (void)configureView
{
    // Update the user interface for the detail item.
    
    if (_currentProduct) {
        NSLog(@"loaded: product detail: %@", _currentProduct.Name);

        NSString *imageURL = _currentProduct.Picture_thumbnail;
        
        self.detailDescriptionLabel.text = _currentProduct.Name;

        self.detailRate.text = [NSString stringWithFormat:@"$%@ per %@-%@", _currentProduct.Rate, _currentProduct.RateUnitCount, _currentProduct.RateUnit];
        
        NSString *noImgUrl = @"http://www.getable.com/content/images/catalog/no-photo_400x300.png";
        NSString *imgUrl = imageURL.length > 0 ? imageURL : noImgUrl;
        
        [URLImageCached loadImageWithURL:imgUrl withLoadCompleteHandler:[self setImageBlock:self.detailProductImg]];
        
        // buttons
        [self.detailBookStart addTarget:self action:@selector(bookStartButtonTouch:) forControlEvents: UIControlEventTouchDown];
    }
}
         
-(void)bookStartButtonTouch:(UIButton *)sender {
    
    int height = 255;
    
    //create new view
    UIView * newView = [[UIView alloc] initWithFrame:CGRectMake(0, 200, 320, height)];
    newView.backgroundColor = [UIColor colorWithWhite:1 alpha:1];
    //add toolbar
    
    UIToolbar * toolbar = [[UIToolbar alloc] initWithFrame: CGRectMake(0, 0, 320, 40)];
    toolbar.barStyle = UIBarStyleBlack;
    //add button
    
    UIBarButtonItem *infoButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:nil action:@selector(dismissCustom:)];
    toolbar.items = [NSArray arrayWithObjects:infoButtonItem, nil];
    //add date picker
    
    UIDatePicker *datePicker = [[UIDatePicker alloc] init];
    datePicker.datePickerMode = UIDatePickerModeDateAndTime ;
    datePicker.hidden = NO;
    datePicker.date = [NSDate date];
    datePicker.frame = CGRectMake(0, 40, 320, 250);
    [datePicker addTarget:self action:nil/*@selector(changeDateInLabel:)*/ forControlEvents:UIControlEventValueChanged];
    [newView addSubview:datePicker];
    //add popup view
    
    [newView addSubview:toolbar];
    [self.view addSubview:newView];
    //animate it onto the screen
    
    CGRect temp = newView.frame;
    temp.origin.y = CGRectGetMaxY(self.view.bounds);
    newView.frame = temp;
    [UIView beginAnimations:nil context:nil];
    temp.origin.y -= height;
    newView.frame = temp;
    [UIView commitAnimations];
    
}

-(URLImageLoadCompleteHandler)setImageBlock:(UIImageView *) img{
    return [^void(UIImage *loadedImage, NSString *url) {
        img.image = loadedImage;
    } copy];
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
