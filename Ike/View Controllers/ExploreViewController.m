//
//  ExploreViewController.m
//  Ike
//
//  Created by Izuchukwu Elechi on 2/28/15.
//  Copyright (c) 2015 Izuchukwu Elechi. All rights reserved.
//

#import "ExploreViewController.h"
#import "SignInViewController.h"

#import "IKCharities.h"
#import "IKTees.h"
#import "IKTeeView.h"

@interface ExploreViewController ()

@property (nonatomic) UIScrollView *scrollView;
@property (nonatomic) NSString *accountID;
@property (nonatomic) NSArray *charities;

@end

@implementation ExploreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *titleBarImageView = [[UIImageView alloc] init];
    CGRect frame = [[[self navigationController] navigationBar] frame];
    frame.size.width = 67;
    [titleBarImageView setFrame:frame];
    [titleBarImageView setContentMode:UIViewContentModeScaleAspectFit];
    [titleBarImageView setImage:[UIImage imageNamed:@"navbar-ike"]];
    
    _charities = @[[IKCharities acs], [IKCharities unicef], [IKCharities who], [IKCharities wwf], [IKCharities wwp]];
    
    self.navigationItem.titleView = titleBarImageView;
    
    [self signIn];
    
    _scrollView = [[UIScrollView alloc] initWithFrame:[[self view] frame]];
    [_scrollView setShowsVerticalScrollIndicator:NO];
    [_scrollView setUserInteractionEnabled:YES];
    
    IKCauseView *causeView = [[IKCauseView alloc] initWithFrame:self.view.frame];
    [causeView setDelegate:self];
    [causeView displayCharities:_charities];
    [_scrollView addSubview:causeView];
    [self.view addSubview:_scrollView];
    NSArray *rtees = [IKTees randomTees];
    
    for (int i = 0; i < 4; i++) {
        IKTee *tee = [rtees objectAtIndex:i];
        CGRect fr = CGRectMake(0, causeView.frame.size.height + (i * 400) + ((i + 1) * 15), 0, 0);
        IKTeeView *teeView = [[IKTeeView alloc] initWithFrame:fr];
        [teeView displayTee:tee];
        [_scrollView addSubview:teeView];
        
        if (([[IKTees tees] count] - 1) == i) {
            break;
        }
    }
    
    UIImageView *footer = [[UIImageView alloc] initWithFrame:CGRectMake(0, 15 + causeView.frame.size.height + (([[IKTees tees] count] > 4 ? 4 : [[IKTees tees] count]) * 400) + (([[IKTees tees] count] > 4 ? 4 : [[IKTees tees] count]) * 15), _scrollView.frame.size.width, 60)];
    [footer setImage:[UIImage imageNamed:@"footer-ike"]];
    [footer setAlpha:0.15];
    [_scrollView addSubview:footer];
    [footer setContentMode:UIViewContentModeCenter];
    
    [_scrollView setContentSize:CGSizeMake(_scrollView.frame.size.width, 64 + causeView.frame.size.height + (([[IKTees tees] count] > 4 ? 4 : [[IKTees tees] count]) * 400) + (([[IKTees tees] count] > 4 ? 4 : [[IKTees tees] count]) * 15))];
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

- (void)didSelectCharity:(IKCharity *)charity {
    CharityViewController *charityvc = [[CharityViewController alloc] initWithCharity:charity];
    [[self navigationController] pushViewController:charityvc animated:YES];
}

- (void)didSelectCause:(IKCharity *)charity {
    CauseViewController *causevc = [[CauseViewController alloc] initWithCharity:charity];
    [[self navigationController] pushViewController:causevc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
