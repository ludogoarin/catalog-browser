//
//  gtblCategoryListViewController.m
//  disco
//
//  Created by Ludo Goarin on 12/6/12.
//  Copyright (c) 2012 Ludo Goarin. All rights reserved.
//

#import "gtblCategoryListViewController.h"
#import "gtblServiceHandler.h"
#import "gtblStore.h"

@interface gtblCategoryListViewController ()
{
    NSMutableArray *categories;
}

@end

@implementation gtblCategoryListViewController

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
    NSLog(@"loaded: category list");
    
    NSString *apiKey = @"7e8bec75-9829-4088-89b2-88d02f7d901c";
    [gtblServiceHandler getStoreLocation: apiKey
                        callBackDelegate: self
                        callBackSelector: @selector(fetchedStoreLocation:)];
}

-(void)fetchedStoreLocation:(gtblStore *)store
{
    NSLog(@"loaded data: %@", store);
    NSLog(@"Store name: %@", store.BusinessName);
    self.title = store.BusinessName;
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0,0,45,45)];
	label.textColor = [UIColor yellowColor];
	self.navigationItem.titleView = label;
}

-(void)fetchedCategoryProducts:(NSData *)responseData {
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
