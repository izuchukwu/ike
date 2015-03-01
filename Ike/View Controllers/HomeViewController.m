//
//  HomeViewController.m
//  Ike
//
//  Created by Izuchukwu Elechi on 2/28/15.
//  Copyright (c) 2015 Izuchukwu Elechi. All rights reserved.
//

#import "HomeViewController.h"
#import "SignInViewController.h"

@interface HomeViewController ()

@property (nonatomic) UIScrollView *scrollView;
@property (nonatomic) NSString *accountID;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self signIn];
    
    _scrollView = [[UIScrollView alloc] initWithFrame:[[self view] frame]];
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
