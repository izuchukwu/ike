//
//  ExploreViewController.m
//  Ike
//
//  Created by Izuchukwu Elechi on 2/28/15.
//  Copyright (c) 2015 Izuchukwu Elechi. All rights reserved.
//

#import "ExploreViewController.h"
#import "SignInViewController.h"

@interface ExploreViewController ()

@property (nonatomic) UIScrollView *scrollView;
@property (nonatomic) NSString *accountID;

@end

@implementation ExploreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *titleBarImageView = [[UIImageView alloc] init];
    CGRect frame = [[[self navigationController] navigationBar] frame];
    frame.size.width = 67;
    [titleBarImageView setFrame:frame];
    [titleBarImageView setContentMode:UIViewContentModeScaleAspectFit];
    //[titleBarImageView setImage:[UIImage imageNamed:kNavBarTitleImageSnoo]];
    
    self.navigationItem.titleView = titleBarImageView;
    
    [self signIn];
    
    _scrollView = [[UIScrollView alloc] initWithFrame:[[self view] frame]];
}

- (void)viewWillAppear:(BOOL)animated {
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationSlide];
}

- (void)signIn {
    _accountID = [[NSUserDefaults standardUserDefaults] objectForKey:@"account-identifier"];
    if (!_accountID) {
        SignInViewController *signIn = [[SignInViewController alloc] init];
        [self presentViewController:signIn animated:YES completion:^{
            [self signIn];
        }];
    } else {
        ACAccountStore *store = [[ACAccountStore alloc] init];
        NSLog(@"Signed In as %@", [[store accountWithIdentifier:_accountID] username]);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
