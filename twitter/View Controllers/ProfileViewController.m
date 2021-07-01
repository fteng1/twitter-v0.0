//
//  ProfileViewController.m
//  twitter
//
//  Created by Felianne Teng on 6/30/21.
//  Copyright © 2021 Emerson Malca. All rights reserved.
//

#import "ProfileViewController.h"
#import "APIManager.h"

@interface ProfileViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *numTweetsLabel;
@property (weak, nonatomic) IBOutlet UILabel *numFollowingLabel;
@property (weak, nonatomic) IBOutlet UILabel *numFollowersLabel;
@property (nonatomic, strong) UIRefreshControl *refreshControl;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self refreshData];
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(refreshData) forControlEvents:UIControlEventValueChanged];
    [self.scrollView insertSubview:self.refreshControl atIndex:0];
}

- (void)refreshData {
    self.nameLabel.text = self.user.name;
    self.usernameLabel.text = [NSString stringWithFormat:@"@%@", self.user.screenName];
    self.descriptionLabel.text = self.user.tagline;
    self.numTweetsLabel.text = [NSString stringWithFormat:@"%ld", self.user.numTweets];
    self.numFollowingLabel.text = [NSString stringWithFormat:@"%ld", self.user.numFollowing];
    self.numFollowersLabel.text = [NSString stringWithFormat:@"%ld", self.user.numFollowers];
    
    // get profile image
    NSString *URLString = self.user.profilePicture;
    NSURL *url = [NSURL URLWithString:URLString];
    NSData *urlData = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:urlData];
    [self.profileImageView setImage:image];
    [self.refreshControl endRefreshing];
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"hello");
    [[APIManager shared] getUserData:^(NSDictionary *currentUser, NSError *error) {
        if (currentUser) {
            NSLog(@"😎😎😎 Successfully loaded profile data");
            self.user = [[User alloc] initWithDictionary:currentUser];


        } else {
            NSLog(@"😫😫😫 Error getting profile data: %@", error.localizedDescription);
        }
    }];
    [self refreshData];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
