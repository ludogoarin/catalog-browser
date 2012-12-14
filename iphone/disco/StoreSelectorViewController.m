//
//  GTBLStoreSelectorViewController.m
//  disco
//
//  Created by Ludo Goarin on 12/6/12.
//  Copyright (c) 2012 Ludo Goarin. All rights reserved.
//

#import "StoreSelectorViewController.h"
#import "CategoryListViewController.h"
#import "GTBLServiceHandler.h"
#import "GTBLStore.h"
#import "GTBLStoreListItem.h"
#import "GTBLAppBase.h"

@interface StoreSelectorViewController ()
{
    NSMutableArray *_objects;
}
@end


@implementation StoreSelectorViewController

@synthesize storeListTable;

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
    
    NSLog(@"loaded: store selector");
    
    _objects = [[NSMutableArray alloc] init];

    // add SF Party
    GTBLStoreListItem *item1 = [[GTBLStoreListItem alloc] init];
    item1.ApiKey = @"7e8bec75-9829-4088-89b2-88d02f7d901c";
    item1.BusinessName = @"SF Party";
    [_objects addObject:item1];

    // add Getable Test Store
    GTBLStoreListItem *item2 = [[GTBLStoreListItem alloc] init];
    item2.ApiKey = @"3c686493-19ba-4203-aace-d4eced6495dc";
    item2.BusinessName = @"Getable Demos";
    [_objects addObject:item2];
    
    // add AAA Rents
    GTBLStoreListItem *item3 = [[GTBLStoreListItem alloc] init];
    item3.ApiKey = @"aab754e0-53dc-457d-86c7-498bf02c2609";
    item3.BusinessName = @"AAA Rentals";
    [_objects addObject:item3];    
    
    // add AAA Rents
    GTBLStoreListItem *item4 = [[GTBLStoreListItem alloc] init];
    item4.ApiKey = @"82f591bd-D7e1-42f5-8e0e-D96a5f2e1e7f";
    item4.BusinessName = @"Blazing Saddles";
    [_objects addObject:item4];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [_objects count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"storeItem";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    GTBLStoreListItem *cellObject = [_objects objectAtIndex:indexPath.section + indexPath.row];
    
    cell.textLabel.text = cellObject.BusinessName;
    // Configure the cell...
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:tableView.indexPathForSelectedRow animated:YES];
    NSLog(@"selected changed");
    // Navigation logic may go here. Create and push another view controller.
    
     //GTBLCategoryListViewController *storeViewController = [[GTBLCategoryListViewController alloc] init];
     // ...
     // Pass the selected object to the new view controller.
     //[self.navigationController pushViewController:storeViewController animated:YES];
     
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showStore"]) {
        UITableViewCell *cell  = (UITableViewCell *)sender;

        
        NSIndexPath *selectedIndexPath = [self.storeListTable indexPathForSelectedRow];
        NSUInteger selectedRow = selectedIndexPath.row;
        //NSUInteger selectedSection = selectedIndexPath.section;
        //UITableViewCell *selectedCell = [self.storeListTable cellForRowAtIndexPath:selectedIndexPath];
                
        int index = selectedRow;
        GTBLStoreListItem *selectedStoreItem = _objects[index];
        NSString *storeName = selectedStoreItem.BusinessName;
        NSLog(@"selected: %@", storeName);
        _currentApiKey = selectedStoreItem.ApiKey;
    }
}

@end
