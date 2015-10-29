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
#import "MMMediaDetailViewController.h"

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
        
        if (self.mediaItems== nil) {
            self.mediaItems = [NSMutableArray new];
        }
        
        for (id item in [items valueForKey:@"data"]) {
            
            
            if ([item isKindOfClass:[NSDictionary class]])
            {

                
                    MMMediaItem *photo = [[MMMediaItem alloc]initWithDictionary:item];
                    
                    [self.mediaItems addObject:photo];
            }
            
            
        }
        
        NSArray *sortedArray = [self.mediaItems sortedArrayUsingComparator:^NSComparisonResult(MMMediaItem *a, MMMediaItem *b) {
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
    
    //MMMediaItem *media = media;
    
  
    MMMediaItem *media = [self.items objectAtIndex:indexPath.row];
    
    MMMediaDetailViewController *view = [[MMMediaDetailViewController alloc] initWithNibName:nil bundle:nil];
    
    view.mediaItem = media;
    
    
    [self.controller.navigationController pushViewController:view animated:YES];
    
}

@end
