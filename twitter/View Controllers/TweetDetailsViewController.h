//
//  TweetDetailsViewController.h
//  twitter
//
//  Created by Felianne Teng on 6/29/21.
//  Copyright © 2021 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"

NS_ASSUME_NONNULL_BEGIN

@interface TweetDetailsViewController : UIViewController

@property (strong, nonatomic) Tweet *tweet;

@end

NS_ASSUME_NONNULL_END
