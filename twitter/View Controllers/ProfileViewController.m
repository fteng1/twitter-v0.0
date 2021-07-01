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
@property (weak, nonatomic) IBOutlet UILabel *numFavsLabel;
@property (weak, nonatomic) IBOutlet UILabel *numFollowingLabel;
@property (weak, nonatomic) IBOutlet UILabel *numFollowersLabel;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self refreshData];
}

- (void)refreshData {
    [[APIManager shared] getUserData:^(NSDictionary *currentUser, NSError *error) {
        if (currentUser) {
            NSLog(@"😎😎😎 Successfully loaded profile data");
            self.nameLabel.text = currentUser[@"name"];
            self.usernameLabel.text = [NSString stringWithFormat:@"@%@", currentUser[@"screen_name"]];
            self.descriptionLabel.text = currentUser[@"description"];
            NSLog(@"%@", currentUser);
            self.numFavsLabel.text = [NSString stringWithFormat:@"%@", currentUser[@"favourites_count"]];
            self.numFollowingLabel.text = [NSString stringWithFormat:@"%@", currentUser[@"friends_count"]];
            self.numFollowersLabel.text = [NSString stringWithFormat:@"%@", currentUser[@"followers_count"]];
            
            // get profile image
            NSString *URLString = currentUser[@"profile_image_url_https"];
            NSURL *url = [NSURL URLWithString:URLString];
            NSData *urlData = [NSData dataWithContentsOfURL:url];
            UIImage *image = [UIImage imageWithData:urlData];
            [self.profileImageView setImage:image];

        } else {
            NSLog(@"😫😫😫 Error getting profile data: %@", error.localizedDescription);
        }
    }];
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
