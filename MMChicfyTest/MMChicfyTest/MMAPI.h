//
//  MMAPI.h
//  MMChicfyTest
//
//  Created by Juan Miguel Marqués Morilla on 28/10/15.
//  Copyright © 2015 Juan Miguel Marqués Morilla. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMAPI : NSObject

+(instancetype)sharedInstance;

- (void)JSONArray:(NSURL *) url completionBlock:(void (^)(NSArray *JSONArray, NSError *error)) block ;

@end
