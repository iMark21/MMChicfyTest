//
//  MMCustomAppearance.m
//  MMChicfyTest
//
//  Created by Juan Miguel Marqués Morilla on 28/10/15.
//  Copyright © 2015 Juan Miguel Marqués Morilla. All rights reserved.
//
#import "MMCustomAppearance.h"
#import <UIKit/UIKit.h>

@implementation MMCustomAppearance

+(instancetype)sharedInstance{
    
    
    static dispatch_once_t once;
    static id sharedInstance;
    
    dispatch_once(&once, ^{
        sharedInstance = [self new];
    });
    
    return sharedInstance;
    
}

-(void)applyAppearance{
    
    [self setupNavigationBarAppearance];
    
    [self setupTableViewAppearance];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];

}

-(void)setupNavigationBarAppearance{
    
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:15/255.0 green:117/255.0 blue:178/255.0 alpha:1.0]];
    
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName]];

}

-(void)setupTableViewAppearance{
    
    //
    [[UITableView appearance]setBackgroundColor:[UIColor lightGrayColor]];
    
}

@end
