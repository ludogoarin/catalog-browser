//
//  GTBLCategoryListViewController.m
//  disco
//
//  Created by Ludo Goarin on 12/6/12.
//  Copyright (c) 2012 Ludo Goarin. All rights reserved.
//

#import "CategoryListViewController.h"
#import "GTBLServiceHandler.h"
#import "GTBLStore.h"
#import "GTBLCategory.h"
#import "CollectionViewCell.h"
#import "URLImageCached.h"
#import "GTBLAppBase.h"


@interface CategoryListViewController ()
{
    NSMutableArray *_categories;
    GTBLStore *_store;
}

@end

@implementation CategoryListViewController
@synthesize arrRecords;

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
    
    NSLog(@"current key: %@", _currentApiKey);
    
    _categories = [NSMutableArray array];
    blockSelf_ = self;
    
    self.arrRecords = [[NSMutableArray alloc] init];
    noOfItemsInSection = 3;

    self.title = @"Categories";
    
    GTBLStore *store = [GTBLAppBase getStoreFromCache:_currentApiKey];
    
    if(store != nil){
        [self fetchedStoreLocation:store];
    } else {
    [GTBLServiceHandler getStoreLocation: _currentApiKey
                        callBackDelegate: self
                        callBackSelector: @selector(fetchedStoreLocation:)];
    }
    
}



#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return (int)([_currentStore.Categories count] / noOfItemsInSection);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return noOfItemsInSection;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"categoryItem" forIndexPath:indexPath];
    GTBLCategory *cellCategory = [_currentStore.Categories objectAtIndex:indexPath.section * noOfItemsInSection + indexPath.row];
    
    NSString *noImgUrl = @"http://www.getable.com/content/images/catalog/no-photo_400x300.png";
    NSString *imgUrl = cellCategory.ImageUrl.length > 0 ? cellCategory.ImageUrl : noImgUrl;
    
    [URLImageCached loadImageWithURL:imgUrl withLoadCompleteHandler:[self setImageBlock:cell.imgCategory]];

    return cell;
}


-(URLImageLoadCompleteHandler)setImageBlock:(UIImageView *) img{
    return [^void(UIImage *loadedImage, NSString *url) {
        img.image = loadedImage;
    } copy];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
}

-(void)fetchedStoreLocation:(GTBLStore *)store
{
    // set global variable for current store
    _currentStore = store;
    
    // add in collection of stores    
    NSEnumerator *e = [_cachedStores objectEnumerator];
    
    BOOL storeInCache = NO;
    int found = 0;

    id item;
    while (item = [e nextObject]) {
        NSNumber *itemId = ((GTBLStore*)item).BusinessLocationId;
        NSNumber *fetchedId = store.BusinessLocationId;
        if ([itemId isEqualToNumber:fetchedId]){
            storeInCache = YES;
            found = 1;
            NSLog(@"found!");
        }
    };
    
    if(!storeInCache){
        if (!_cachedStores) {
            _cachedStores = [[NSMutableArray alloc] init];
        }
        [_cachedStores addObject:store];
        NSLog(@"added to cache");
    } else {
        NSLog(@"not added to cache");
    }
    
    
    /*
    while (item = [e nextObject]) {
        if (!_cachedStores) {
            _cachedStores = [[NSMutableArray alloc] init];
        }
        // do something with item
        [_cachedStores addObject:store];
        //[_cachedStores insertObject:store atIndex:[_cachedStores count]];
    };
     */
    
    self.title = store.BusinessName;
    
    // set categories count
    noOfItems = [store.Categories count];
    
    // add to collection view
}

-(void)fetchedCategoryProducts:(NSData *)responseData {
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showCategory"]) {
        UICollectionViewCell *cell  = (UICollectionViewCell *)sender;
        
        
        NSIndexPath *selectedIndexPath = [self.collectionView indexPathForCell:cell];
        NSUInteger selectedRow = selectedIndexPath.row;
        NSUInteger selectedSection = selectedIndexPath.section;
        //UITableViewCell *selectedCell = [self.storeListTable cellForRowAtIndexPath:selectedIndexPath];
        
        int index = noOfItemsInSection * selectedSection + selectedRow;
        GTBLCategory *selectedItem = _currentStore.Categories[index];
        NSString *itemName = selectedItem.Title;
        NSLog(@"selected: %@", itemName);
        _currentCategory = selectedItem;
        _currentCategoryId = selectedItem.CategoryId;
    }
}


@end
