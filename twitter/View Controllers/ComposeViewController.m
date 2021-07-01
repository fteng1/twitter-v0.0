//
//  ComposeViewController.m
//  twitter
//
//  Created by Felianne Teng on 6/29/21.
//  Copyright © 2021 Emerson Malca. All rights reserved.
//

#import "ComposeViewController.h"
#import <UITextView+Placeholder/UITextView+Placeholder.h>

@interface ComposeViewController ()
@property (weak, nonatomic) IBOutlet UITextView *tweetTextView;

@end

@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // set placeholder text
    self.tweetTextView.placeholder = @"What's happening?";
    self.tweetTextView.placeholderColor = [UIColor lightGrayColor];
}

- (IBAction)onTweetClick:(id)sender {
    [[APIManager shared]postStatusWithText:self.tweetTextView.text completion:^(Tweet *tweet, NSError *error) {
        if(error){
            NSLog(@"Error composing Tweet: %@", error.localizedDescription);
        }
        else{
            [self.delegate didTweet:tweet];
            NSLog(@"Compose Tweet Success!");
            [self dismissViewControllerAnimated:true completion:nil];
        }
    }];
}

- (IBAction)onCloseClick:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
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
