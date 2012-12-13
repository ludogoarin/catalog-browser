//
//  gtblProductDetailViewController.h
//  disco
//
//  Created by Ludo Goarin on 12/6/12.
//  Copyright (c) 2012 Ludo Goarin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "gtblProduct.h"

@interface gtblProductDetailViewController : UIViewController

@property gtblProduct *detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (weak, nonatomic) IBOutlet UITextView *detailDescriptionText;
@property (weak, nonatomic) IBOutlet UILabel *detailRate;

@end
