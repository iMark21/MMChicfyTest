//
//  MMMediaItem.m
//  MMChicfyTest
//
//  Created by Juan Miguel Marqués Morilla on 28/10/15.
//  Copyright © 2015 Juan Miguel Marqués Morilla. All rights reserved.
//

#import "MMMediaItem.h"

@implementation MMMediaItem

-(instancetype)initWithDictionary:(NSDictionary*)dictionary{
    
    
    if (self = [super init]) {
        
        [self setValuesWithDictionary:dictionary];
        
    }
    
    return self;
}

-(void)setValuesWithDictionary:(NSDictionary*)dictionary{
    
    self.urlImage = [dictionary valueForKeyPath:@"images.thumbnail.url"];
    self.numberLikes = [dictionary valueForKeyPath:@"likes.count"];
    self.username = [dictionary valueForKeyPath:@"user.username"];

    
}


@end
