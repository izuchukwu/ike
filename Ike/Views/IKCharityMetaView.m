//
//  IKCharityMetaView.m
//  Ike
//
//  Created by Izuchukwu Elechi on 3/1/15.
//  Copyright (c) 2015 Izuchukwu Elechi. All rights reserved.
//

#import "IKCharityMetaView.h"

@implementation IKCharityMetaView

- (id)initWithFrame:(CGRect)frame {
    frame.size = CGSizeMake(375, 170);
    self = [super initWithFrame:frame];
    if (self) {
        [[NSBundle mainBundle] loadNibNamed:@"IKCharityMetaView" owner:self options:nil];
        [self addSubview:_view];
        [self bringSubviewToFront:_view];
    }
    return self;
}

- (void)displayCauseOfCharity:(IKCharity *)charity {
    [_titleLabel setText:[charity name]];
    [_bioLabel setText:[charity mission]];
    [_twitterLabel setText:[charity twitterName]];
    [_siteLabel setText:[charity site]];
}

@end
