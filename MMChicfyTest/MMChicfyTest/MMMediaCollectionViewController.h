//
//  MMMediaCollectionViewController.h
//  MMChicfyTest
//
//  Created by Juan Miguel Marqués Morilla on 28/10/15.
//  Copyright © 2015 Juan Miguel Marqués Morilla. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMMediaCollectionViewDelegate.h"

@interface MMMediaCollectionViewController : UIViewController

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic,strong) NSArray *mediaItems;

@property (nonatomic,strong) MMMediaCollectionViewDelegate *collectionViewDelegate;

@end
