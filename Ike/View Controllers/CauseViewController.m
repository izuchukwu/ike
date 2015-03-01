//
//  CauseViewController.m
//  Ike
//
//  Created by Izuchukwu Elechi on 3/1/15.
//  Copyright (c) 2015 Izuchukwu Elechi. All rights reserved.
//

#import "CauseViewController.h"

#import "IKCauseView.h"
#import "IKTees.h"
#import "IKTeeView.h"

@interface CauseViewController ()

@property (nonatomic) UIScrollView *scrollView;
@property (nonatomic) IKCharity *charity;

@end

@implementation CauseViewController

- (id)initWithCharity:(IKCharity *)charity {
    self = [super init];
    if (self) {
        _charity = charity;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:[_charity cause]];
    [self.view setBackgroundColor:[UIColor colorWithRed:0.937 green:0.937 blue:0.937 alpha:1.000]];
        
    _scrollView = [[UIScrollView alloc] initWithFrame:[[self view] frame]];
    [_scrollView setShowsVerticalScrollIndicator:NO];
    [_scrollView setUserInteractionEnabled:YES];
    
    IKCauseView *causeView = [[IKCauseView alloc] initWithFrame:self.view.frame];
    [causeView displayCharities:@[_charity]];
    [_scrollView addSubview:causeView];
    [self.view addSubview:_scrollView];
    
    CGRect fr = causeView.frame;
    fr.origin.y += fr.size.height;
    IKCauseMetaView *metaView = [[IKCauseMetaView alloc] initWithFrame:fr];
    [metaView displayCauseOfCharity:_charity];
    [_scrollView addSubview:metaView];
    
    NSArray *tees = [IKTees randomTees];
    NSMutableArray *rtees = [[NSMutableArray alloc] init];
    
    for (IKTee *tee in tees) {
        if ([[[tee charity] name] isEqualToString:[_charity name]]) {
            [rtees addObject:tee];
        }
    }
    
    for (int i = 0; i < 20; i++) {
        IKTee *tee = [rtees objectAtIndex:i];
        CGRect fr = CGRectMake(0, causeView.frame.size.height + metaView.frame.size.height + (i * 400) + ((i + 1) * 15), 0, 0);
        IKTeeView *teeView = [[IKTeeView alloc] initWithFrame:fr];
        [teeView displayTee:tee];
        [_scrollView addSubview:teeView];
        
        if (([rtees count] - 1) == i) {
            break;
        }
    }
    
    UIImageView *footer = [[UIImageView alloc] initWithFrame:CGRectMake(0, 15 + causeView.frame.size.height + metaView.frame.size.height + (([rtees count] > 20 ? 20 : [rtees count]) * 400) + (([rtees count] > 20 ? 20 : [rtees count]) * 15), _scrollView.frame.size.width, 60)];
    [footer setImage:[UIImage imageNamed:@"footer-ike"]];
    [footer setAlpha:0.15];
    [_scrollView addSubview:footer];
    [footer setContentMode:UIViewContentModeCenter];
    
    [_scrollView setContentSize:CGSizeMake(_scrollView.frame.size.width, 64 + causeView.frame.size.height + metaView.frame.size.height + (([rtees count] > 20 ? 20 : [rtees count]) * 400) + (([rtees count] > 20 ? 20 : [rtees count]) * 15))];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
