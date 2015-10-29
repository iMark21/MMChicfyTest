//
//  MMMediaCollectionViewController.m
//  MMChicfyTest
//
//  Created by Juan Miguel Marqués Morilla on 28/10/15.
//  Copyright © 2015 Juan Miguel Marqués Morilla. All rights reserved.
//

#import "MMMediaCollectionViewController.h"
#import "MMAPI.h"
#import "MMMediaItem.h"
#import "SVProgressHUD.h"
#import "UIScrollView+SVPullToRefresh.h"
#import "UIScrollView+SVInfiniteScrolling.h"
#import "MMMediaDetailViewController.h"

@interface MMMediaCollectionViewController ()

@end

@implementation MMMediaCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.collectionViewDelegate = [[MMMediaCollectionViewDelegate alloc] initWithCollectionView:self.collectionView controller:self];
    
    // Do any additional setup after loading the view from its nib.
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    __weak MMMediaCollectionViewController *weakSelf = self;
    
    
    [self.collectionView addInfiniteScrollingWithActionHandler:^{
        [weakSelf loadContent];
        [weakSelf.collectionView.infiniteScrollingView stopAnimating];
        
    }];

    
}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    [self setTitle:@"PHOTO GALLERY"];
    
    [self loadContent];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadContent{
    
    [SVProgressHUD showWithStatus:@"Cargando" maskType:SVProgressHUDMaskTypeGradient];
    [[MMAPI sharedInstance]JSONArray:[NSURL URLWithString:@"https://api.instagram.com/v1/media/popular?access_token=177762900.d89c44c.8a6c90a3edf54040b080cfc8af6b4fe2"] completionBlock:^(NSArray *JSONArray, NSError *error) {
 
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [self.collectionViewDelegate reloadDataWithItems:JSONArray];
            
            [SVProgressHUD dismiss];
        
        });
        
    }];

    
    
}



@end
