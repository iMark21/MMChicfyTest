//
//  MMMediaDetailViewController.m
//  MMChicfyTest
//
//  Created by Juan Miguel Marqués Morilla on 29/10/15.
//  Copyright © 2015 Juan Miguel Marqués Morilla. All rights reserved.
//

#import "MMMediaDetailViewController.h"
#import <SDWebImage/SDImageCache.h>
#import "UIImageView+WebCache.h"
#import "SVProgressHUD.h"

@interface MMMediaDetailViewController ()

@end

@implementation MMMediaDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:self.mediaItem.urlImageHD] placeholderImage:[UIImage imageNamed:@"placeholder.jpg"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        [SVProgressHUD dismiss];
    }];
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
