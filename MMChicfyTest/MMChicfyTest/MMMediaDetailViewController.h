//
//  MMMediaDetailViewController.h
//  MMChicfyTest
//
//  Created by Juan Miguel Marqués Morilla on 29/10/15.
//  Copyright © 2015 Juan Miguel Marqués Morilla. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMMediaItem.h"

@interface MMMediaDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (nonatomic,strong) MMMediaItem *mediaItem;

@end
