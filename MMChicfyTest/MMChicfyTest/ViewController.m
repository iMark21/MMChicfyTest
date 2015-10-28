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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //https://api.instagram.com/v1/media/popular?access_token=ACCESS-TOKEN
    
    [[MMAPI sharedInstance]JSONArray:[NSURL URLWithString:@"https://api.instagram.com/v1/media/popular?access_token=177762900.d89c44c.8a6c90a3edf54040b080cfc8af6b4fe2"] completionBlock:^(NSArray *JSONArray, NSError *error) {
        
        for (id item in [JSONArray valueForKey:@"data"]) {
            
            if ([item isKindOfClass:[NSDictionary class]]) {
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    

                    MMMediaItem *photo = [[MMMediaItem alloc]initWithDictionary:item];
                    
                });
                
            }

        }
        
        
    }];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
