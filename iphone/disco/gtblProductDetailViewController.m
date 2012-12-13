//
//  gtblProductDetailViewController.m
//  disco
//
//  Created by Ludo Goarin on 12/6/12.
//  Copyright (c) 2012 Ludo Goarin. All rights reserved.
//

#import "gtblProductDetailViewController.h"
#import "gtblAppBase.h"

@interface gtblProductDetailViewController ()

@end

@implementation gtblProductDetailViewController



- (void)configureView
{
    // Update the user interface for the detail item.
    
    if (_currentProduct) {
        NSLog(@"loaded: product detail: %@", _currentProduct.Name);

        
        NSURL * imageURL = [NSURL URLWithString:_currentProduct.Picture_thumbnail];
        NSData * imageData = [NSData dataWithContentsOfURL:imageURL];
        UIImage * image = [UIImage imageWithData:imageData];
        
        self.detailDescriptionLabel.text = _currentProduct.Name;
        NSString *descr = _currentProduct.Description;
        self.detailDescriptionText.text = descr != ( NSString *) [ NSNull null ] ? descr : @"No product description";
        self.detailRate.text = [NSString stringWithFormat:@"$%@ per %@-%@", _currentProduct.Rate, _currentProduct.RateUnitCount, _currentProduct.RateUnit];

        UIImageView *productImgView = [[UIImageView alloc] initWithImage:image];
        [self.view addSubview:productImgView];
        
        // format image
        productImgView.center = CGPointMake(150, 80);
    }
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
