//
//  MMAPI.m
//  MMChicfyTest
//
//  Created by Juan Miguel Marqués Morilla on 28/10/15.
//  Copyright © 2015 Juan Miguel Marqués Morilla. All rights reserved.
//

#import "MMAPI.h"
#import <InstagramSimpleOAuth/InstagramSimpleOAuth.h>

@implementation MMAPI

+(instancetype)sharedInstance{
    
    static dispatch_once_t once;
    static id sharedInstance;
    
    dispatch_once(&once, ^{
        sharedInstance = [self new];
    });
    
    return sharedInstance;
    
}

- (void)JSONArray:(NSURL *) url completionBlock:(void (^)(NSArray *JSONArray, NSError *error)) block {
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url
                                             cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData
                                         timeoutInterval:30.0];
    
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        
        NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        
        if(jsonArray) {
            block(jsonArray, nil);
            
        } else {
            NSError *error = [NSError errorWithDomain:@"plist_download_error" code:1
                                             userInfo:[NSDictionary dictionaryWithObject:@"Can't fetch data" forKey:NSLocalizedDescriptionKey]];
            block(nil, error);
        }
        
        
        
    }];
    
}

- (void)JSONArraycompletionBlock:(void (^)(NSArray *JSONArray, NSError *error)) block {
    
    
    
    

    
    


}

@end
