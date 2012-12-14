//
//  GTBLProductListViewController.m
//  disco
//
//  Created by Ludo Goarin on 12/6/12.
//  Copyright (c) 2012 Ludo Goarin. All rights reserved.
//

#import "ProductListViewController.h"
#import "GTBLServiceHandler.h"
#import "GTBLStore.h"
#import "GTBLCategory.h"
#import "GTBLProduct.h"
#import "CollectionViewCell.h"
#import "URLImageCached.h"
#import "GTBLAppBase.h"

@interface ProductListViewController ()

@end

@implementation ProductListViewController

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
    
    NSLog(@"loaded: product list");
    NSArray *products = [GTBLAppBase getProductListByCategoryFromCache:_currentApiKey categoryId: _currentCategoryId];
    
    if(products != nil){
        [self fetchedCategoryProducts:products];
    } else {
        [GTBLServiceHandler getStoreCategoryProducts:_currentApiKey categoryId:_currentCategoryId
                            callBackDelegate: self
                            callBackSelector: @selector(fetchedCategoryProducts:)];
    }
}


-(void)fetchedCategoryProducts:(NSArray *)products
{        
    self.title = _currentCategory.Title;
    _currentCategory.Products = products;
    
    // set categories count
    noOfItems = [products count];
    
    // add to collection view
    int i = 0;
    for (i = 0; i < noOfItems; i++) {
        // do something with item
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    };

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_currentCategory.Products count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"productItem" forIndexPath:indexPath];
    
    GTBLProduct *item = _currentCategory.Products[indexPath.row];
    cell.textLabel.text = item.Name;
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showProduct"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        _currentProduct = _currentCategory.Products[indexPath.row];;
        //[[segue destinationViewController] setDetailItem:object];
    }
}


@end
