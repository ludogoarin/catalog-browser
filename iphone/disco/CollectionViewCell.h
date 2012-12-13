//
//  CollectionViewCell.h
//  CollectionView
//
//  Created by Yashesh Chauhan on 11/09/12.
//  Copyright (c) 2012 Yashesh Chauhan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewCell : UICollectionViewCell{
 
    IBOutlet UIImageView *imgCategory;
    IBOutlet UILabel     *lblTitle;
    
}
@property (weak, nonatomic) IBOutlet UIImageView *imgCategory;
@property (nonatomic, retain) IBOutlet UILabel     *lblTitle;

@end
