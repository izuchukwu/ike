//
//  IKTeeView.m
//  Ike
//
//  Created by Izuchukwu Elechi on 3/1/15.
//  Copyright (c) 2015 Izuchukwu Elechi. All rights reserved.
//

#import "IKTeeView.h"

@interface IKTeeView ()

@property (nonatomic) IKTee *tee;

@end

@implementation IKTeeView

- (id)initWithFrame:(CGRect)frame {
    frame.size = CGSizeMake(375, 400);
    self = [super initWithFrame:frame];
    if (self) {
        [[NSBundle mainBundle] loadNibNamed:@"IKTee" owner:self options:nil];
        [self addSubview:_view];
        [self bringSubviewToFront:_view];
    }
    return self;
}

- (void)displayTee:(IKTee *)tee {
    _tee = tee;
    [_teeImageView setImage:[tee teeImage]];
    [_teeName setText:[tee name]];
    [_teeDescription setText:[tee about]];
    [_teeDesignerProfile setImage:[[tee designer] profile]];
    [_teeDesignerName setText:[[tee designer] name]];
    [_charityImageView setImage:[[tee charity] image]];
    
    UITapGestureRecognizer *tapg = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapd)];
    [self.view addGestureRecognizer:tapg];
}

- (void)hideArrow {
    [_arrow setHidden:YES];
}

- (void)tapd {
    if (_delegate && [_delegate respondsToSelector:@selector(didSelectTee:)]) {
        [_delegate didSelectTee:_tee];
    }
}

@end
