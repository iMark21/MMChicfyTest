//
//  ViewController.m
//  MMChicfyTest
//
//  Created by Juan Miguel Marqués Morilla on 28/10/15.
//  Copyright © 2015 Juan Miguel Marqués Morilla. All rights reserved.
//

#import "ViewController.h"
#import "MMAPI.h"
#import "MMMediaItem.h"
#import "MMMediaCollectionViewController.h"
#import <InstagramSimpleOAuth/InstagramSimpleOAuth.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    InstagramSimpleOAuthViewController
    *viewController = [[InstagramSimpleOAuthViewController alloc] initWithClientID:@"d89c44cbd9b84916a86cf2d09312fd21"
                                                                      clientSecret:@"31f7bf393d4a45c5aeb5c2bf0aa6f96e"
                                                                       callbackURL:[NSURL URLWithString:@"https://instagram.com/"]
                                                                        completion:^(InstagramLoginResponse *response, NSError *error) {
                                                                            NSLog(@"My Access Token is: %@", response.accessToken);
                                                                            
                                                                            if (response.accessToken) {
                                                                                
                                                                                
                                                                                [self dismissViewControllerAnimated:YES completion:^{
                                                                                    
                                                                                    MMMediaCollectionViewController *newView = [self.storyboard instantiateViewControllerWithIdentifier:@"MMMediaCollectionViewController"];
                                                                                    
                                                                                    
                                                                                    
                                                                                    newView.accesToken = response.accessToken;
                                                                                    [self.navigationController pushViewController:newView animated:YES];
                                                                                    
                                                                                }];
                                                                                
                                                                                
                                                                            }
                                                                            
                                                                        }];
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    
    navigationController.title = @"Instagram Login";
    
    [self presentViewController:navigationController
                       animated:YES
                     completion:nil];

}

-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
