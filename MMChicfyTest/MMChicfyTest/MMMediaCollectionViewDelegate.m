//
//  MMMediaCollectionViewDelegate.m
//  MMChicfyTest
//
//  Created by Juan Miguel Marqués Morilla on 28/10/15.
//  Copyright © 2015 Juan Miguel Marqués Morilla. All rights reserved.
//

#import "MMMediaCollectionViewDelegate.h"
#import "MMMediaItem.h"
#import "MMMediaCollectionViewCell.h"

@interface MMMediaCollectionViewDelegate ()

@end

@implementation MMMediaCollectionViewDelegate


-(instancetype)initWithCollectionView:(UICollectionView*)collectionView controller:(UIViewController*)controller{
    
    
    self = [super init];
    if (self) {
        
        self.controller = controller;
        self.collectionView = collectionView;
        
        [self.collectionView setDelegate:self];
        [self.collectionView setDataSource:self];

    }
    
    
    return self;
    
    
}


-(void)reloadData{
    
    [self.collectionView reloadData];
}

-(void)reloadDataWithItems:(NSArray*)items{
    
   
    if (items.count > 0) {
        
        NSMutableArray *mediaItems = [NSMutableArray new];
        
        for (id item in [items valueForKey:@"data"]) {
            
            
            if ([item isKindOfClass:[NSDictionary class]])
            {

                
                    MMMediaItem *photo = [[MMMediaItem alloc]initWithDictionary:item];
                    
                    [mediaItems addObject:photo];
            }
            
            
        }
        
        NSArray *sortedArray = [mediaItems sortedArrayUsingComparator:^NSComparisonResult(MMMediaItem *a, MMMediaItem *b) {
            return [b.numberLikes compare:a.numberLikes];
        }];
        
        self.items = sortedArray;
        [self.collectionView reloadData];

    }
}


#pragma mark UICollectionView delegate methods

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return [self.items count];
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
   
    CGFloat width =  (collectionView.bounds.size.width-30)/2;
    CGFloat height = (collectionView.bounds.size.width-30)/2;
    
    
    return CGSizeMake(width, height);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    MMMediaItem *photo = self.items[indexPath.row];
    
    MMMediaCollectionViewCell *cell = (MMMediaCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionCell" forIndexPath:indexPath];
    
    [cell setData:photo];
    
    return cell;
    
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
//    [[HTItemsLauncher sharedInstance] launchItem:[self.items objectAtIndex:indexPath.row] fromController:self.controller completition:^(id result, NSError *error) {
//        
//        
//    }];
//    for (id item in [JSONArray valueForKey:@"data"]) {
//        
//        if ([item isKindOfClass:[NSDictionary class]]) {
//            
//            dispatch_async(dispatch_get_main_queue(), ^{
//                
//                
//                
//                
//                MMMediaItem *photo = [[MMMediaItem alloc]initWithDictionary:item];
//                
//            });
//            
//        }
//        
//    }
    
}

@end
