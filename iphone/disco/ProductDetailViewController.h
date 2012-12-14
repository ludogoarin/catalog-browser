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
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (weak, nonatomic) IBOutlet UIImageView *detailProductImg;
@property (weak, nonatomic) IBOutlet UILabel *detailRate;
@property (weak, nonatomic) IBOutlet UIButton *detailBookStart;
@property (weak, nonatomic) IBOutlet UIButton *detailBookEnd;

@end
