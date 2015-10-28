//
//  MMMediaCollectionViewDelegate.h
//  MMChicfyTest
//
//  Created by Juan Miguel Marqués Morilla on 28/10/15.
//  Copyright © 2015 Juan Miguel Marqués Morilla. All rights reserved.
//

#import <Foundation/Foundation.h>
#import  <UIKit/UIKit.h>


@interface MMMediaCollectionViewDelegate : NSObject<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic,weak) UICollectionView *collectionView;
@property (nonatomic,weak) UIViewController *controller;

@property (nonatomic,strong) NSArray *items;

@property (nonatomic,strong) NSString *customGridCellClass;


-(instancetype)initWithCollectionView:(UICollectionView*)collectionView controller:(UIViewController*)controller;

-(void)reloadData;
-(void)reloadDataWithItems:(NSArray*)items;

@end
