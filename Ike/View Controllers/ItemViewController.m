//
//  ItemViewController.m
//  Ike
//
//  Created by Izuchukwu Elechi on 3/1/15.
//  Copyright (c) 2015 Izuchukwu Elechi. All rights reserved.
//

#import "ItemViewController.h"

#import "IKTee.h"
#import "IKTeeView.h"
#import "IKCauseView.h"
#import "IKItemActionView.h"

@interface ItemViewController ()

@property (nonatomic) IKTee *tee;

@property (nonatomic) UIScrollView *scrollView;
@property (nonatomic) IKCharity *charity;

@end

@implementation ItemViewController

- (id)initWithTee:(IKTee *)tee {
    self = [super init];
    if (self) {
        _tee = tee;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:[_tee name]];
    [self.view setBackgroundColor:[UIColor colorWithRed:0.937 green:0.937 blue:0.937 alpha:1.000]];
    
    _scrollView = [[UIScrollView alloc] initWithFrame:[[self view] frame]];
    [_scrollView setShowsVerticalScrollIndicator:NO];
    [_scrollView setUserInteractionEnabled:YES];
    
    IKTeeView *teeView = [[IKTeeView alloc] initWithFrame:CGRectZero];
    [teeView displayTee:_tee];
    [teeView hideArrow];
    [_scrollView addSubview:teeView];
    
    IKItemActionView *ac = [[IKItemActionView alloc] initWithFrame:CGRectMake(0, teeView.frame.size.height + 15, 0, 0)];
    [ac displayItem:_tee];
    [ac setVc:self];
    [_scrollView addSubview:ac];
    
    [_scrollView setContentSize:CGSizeMake(_scrollView.frame.size.width, teeView.frame.size.height + ac.frame.size.height)];
    [self.view addSubview:_scrollView];
}


@end
