//
//  MMMediaItem.h
//  MMChicfyTest
//
//  Created by Juan Miguel Marqués Morilla on 28/10/15.
//  Copyright © 2015 Juan Miguel Marqués Morilla. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMMediaItem : NSObject

@property (nonatomic,strong) NSString *urlImage;
@property (nonatomic,strong) NSString *numberLikes;
@property (nonatomic,strong) NSString *username;


-(instancetype)initWithDictionary:(NSDictionary*)dictionary;

-(void)setValuesWithDictionary:(NSDictionary*)dictionary;

@end
