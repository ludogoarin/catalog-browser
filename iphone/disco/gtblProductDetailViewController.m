//
//  gtblProductDetailViewController.m
//  disco
//
//  Created by Ludo Goarin on 12/6/12.
//  Copyright (c) 2012 Ludo Goarin. All rights reserved.
//

#import "gtblProductDetailViewController.h"

@interface gtblProductDetailViewController ()

@end

@implementation gtblProductDetailViewController

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
    
    NSLog(@"loaded: product detail");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
