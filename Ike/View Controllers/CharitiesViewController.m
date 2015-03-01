//
//  CharitiesViewController.m
//  Ike
//
//  Created by Izuchukwu Elechi on 3/1/15.
//  Copyright (c) 2015 Izuchukwu Elechi. All rights reserved.
//

#import "CharitiesViewController.h"

#import "IKCharities.h"
#import "CauseViewController.h"

@interface CharitiesViewController ()

@property (nonatomic) UIScrollView *scrollView;
@property (nonatomic) NSArray *charities;

@end

@implementation CharitiesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setTitle:@"Charities"];
    
    _charities = @[[IKCharities acs], [IKCharities who], [IKCharities wwf], [IKCharities unicef], [IKCharities wwp]];
    
    _scrollView = [[UIScrollView alloc] initWithFrame:[[self view] frame]];
    [_scrollView setShowsVerticalScrollIndicator:NO];
    [_scrollView setUserInteractionEnabled:YES];
    
    int i = 0;
    for (IKCharity *ch in _charities) {
        CGRect fr = CGRectMake(0, (i * 151) + (i * 15), self.view.frame.size.width, 0);
        IKCauseView *causeView = [[IKCauseView alloc] initWithFrame:fr];
        [causeView setDelegate:self];
        [causeView setDisplaysCharitiesNotCauses:YES];
        [causeView displayCharities:@[ch]];
        [_scrollView addSubview:causeView];
        i++;
    }
    
    [self.view addSubview:_scrollView];
    [_scrollView setContentSize:CGSizeMake(_scrollView.frame.size.width, ([_charities count] * 151) + (([_charities count] - 1) * 15))];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didSelectCharity:(IKCharity *)charity {
    CauseViewController *causevc = [[CauseViewController alloc] initWithCharity:charity];
    [[self navigationController] pushViewController:causevc animated:YES];
}

@end
