//
//  LikedViewController.m
//  Ike
//
//  Created by Izuchukwu Elechi on 3/1/15.
//  Copyright (c) 2015 Izuchukwu Elechi. All rights reserved.
//

#import "LikedViewController.h"

#import "IKTees.h"

@interface LikedViewController ()

@property (nonatomic) UIScrollView *scrollView;

@end

@implementation LikedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"Liked"];
    [self.view setBackgroundColor:[UIColor colorWithRed:0.937 green:0.937 blue:0.937 alpha:1.000]];
    
    _scrollView = [[UIScrollView alloc] initWithFrame:[[self view] frame]];
    [_scrollView setShowsVerticalScrollIndicator:NO];
    [_scrollView setUserInteractionEnabled:YES];
    
    NSArray *rtees = [IKTees randomTees];
    
    for (int i = 0; i < 4; i++) {
        IKTee *tee = [rtees objectAtIndex:i];
        CGRect fr = CGRectMake(0, (i * 400) + (i * 15), 0, 0);
        IKTeeView *teeView = [[IKTeeView alloc] initWithFrame:fr];
        [teeView setDelegate:self];
        [teeView displayTee:tee];
        [_scrollView addSubview:teeView];
        
        if (([[IKTees tees] count] - 1) == i) {
            break;
        }
    }
    
    UIImageView *footer = [[UIImageView alloc] initWithFrame:CGRectMake(0, 15 + (([rtees count] > 20 ? 20 : [rtees count]) * 400) + (([rtees count] > 20 ? 20 : [rtees count]) * 15), _scrollView.frame.size.width, 60)];
    [footer setImage:[UIImage imageNamed:@"footer-ike"]];
    [footer setAlpha:0.15];
    [_scrollView addSubview:footer];
    [footer setContentMode:UIViewContentModeCenter];
    [self.view addSubview:_scrollView];
    
    [_scrollView setContentSize:CGSizeMake(_scrollView.frame.size.width, 64 + (4 * 400) + (4 * 15))];
}

- (void)didSelectTee:(IKTee *)tee {
    ItemViewController *causevc = [[ItemViewController alloc] initWithTee:tee];
    [[self navigationController] pushViewController:causevc animated:YES];
}

@end
