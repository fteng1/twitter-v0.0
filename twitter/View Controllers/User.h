//
//  User.h
//  twitter
//
//  Created by Felianne Teng on 6/28/21.
//  Copyright © 2021 Emerson Malca. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface User : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *screenName;
@property (nonatomic, strong) NSString *profilePicture;
@property (nonatomic, assign) NSInteger numTweets;
@property (nonatomic, assign) NSInteger numFollowing;
@property (nonatomic, assign) NSInteger numFollowers;
@property (nonatomic, strong) NSString *tagline;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
