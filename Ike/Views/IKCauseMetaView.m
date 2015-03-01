//
//  IKCauseMetaView.m
//  Ike
//
//  Created by Izuchukwu Elechi on 3/1/15.
//  Copyright (c) 2015 Izuchukwu Elechi. All rights reserved.
//

#import "IKCauseMetaView.h"

@implementation IKCauseMetaView

- (id)initWithFrame:(CGRect)frame {
    frame.size = CGSizeMake(375, 212);
    self = [super initWithFrame:frame];
    if (self) {
        [[NSBundle mainBundle] loadNibNamed:@"IKCauseMetaView" owner:self options:nil];
        [self addSubview:_view];
        [self bringSubviewToFront:_view];
    }
    return self;
}

- (void)displayCauseOfCharity:(IKCharity *)charity {
    [_titleLabel setText:[charity causeTitle]];
    [_charityImageView setImage:[charity image]];
    [_bioLabel setText:[charity about]];
}

@end
