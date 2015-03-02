//
//  IKCauseView.m
//  Ike
//
//  Created by Izuchukwu Elechi on 3/1/15.
//  Copyright (c) 2015 Izuchukwu Elechi. All rights reserved.
//

#import "IKCauseView.h"

@interface IKCauseView ()

@property (nonatomic) UIScrollView *scrollView;
@property (nonatomic) NSArray *charities;
@property (nonatomic) NSMutableArray *photoImageViews;

@property (nonatomic) NSTimer *timer;
@property (nonatomic) int slide;
@property (nonatomic) BOOL isForward;

@property (nonatomic) NSMutableArray *areCauses;
@end

@implementation IKCauseView

- (id)initWithFrame:(CGRect)frame {
    frame.size.height = 151;
    self = [super initWithFrame:frame];
    if (self) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        [_scrollView setPagingEnabled:YES];
        [_scrollView setShowsHorizontalScrollIndicator:NO];
        [self addSubview:_scrollView];
        _photoImageViews = [[NSMutableArray alloc] init];
        _areCauses = [[NSMutableArray alloc] init];
        
        UITapGestureRecognizer *tapg = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTap)];
        [_scrollView addGestureRecognizer:tapg];
    }
    return self;
}

- (void)didTap {
    CGFloat offset = [_scrollView contentOffset].x;
    int page = offset / self.frame.size.width;
    
    if ([[_areCauses objectAtIndex:page] boolValue]) {
        if (_delegate && [_delegate respondsToSelector:@selector(didSelectCause:)]) {
            [_delegate didSelectCause:[_charities objectAtIndex:page]];
        }
    } else {
        if (_delegate && [_delegate respondsToSelector:@selector(didSelectCharity:)]) {
            [_delegate didSelectCharity:[_charities objectAtIndex:page]];
        }
    }
}

- (void)displayCharities:(NSArray *)charities {
    if (_timer) [_timer invalidate];
    _slide = 0;
    [_scrollView scrollRectToVisible:CGRectZero animated:NO];
    
    charities = charities;
    CGSize contentSize = CGSizeMake(_scrollView.bounds.size.width * [charities count], _scrollView.bounds.size.height);
    [_scrollView setContentSize:contentSize];
    _charities = charities;
    
    int photoNo = 0;
    for (IKCharity *ch in _charities) {
        CGRect frame = _scrollView.bounds;
        frame.origin.x = photoNo * _scrollView.bounds.size.width;
        UIImageView *photoImageView = [[UIImageView alloc] initWithFrame:frame];
        [photoImageView setContentMode:UIViewContentModeScaleAspectFill];
        if (_displaysCharitiesNotCauses) {
            [_areCauses addObject:@NO];
            [photoImageView setImage:[ch banner]];
        } else {
            if ([ch causeBanner]) {
                [_areCauses addObject:@YES];
                [photoImageView setImage:[ch causeBanner]];
            } else {
                [_areCauses addObject:@NO];
                [photoImageView setImage:[ch banner]];
            }
        }
        [_scrollView addSubview:photoImageView];
        [_photoImageViews addObject:photoImageView];
        photoNo++;
    }
    
    if ([_photoImageViews count] > 1) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(advance) userInfo:nil repeats:YES];
    }
    
    
}

- (void)advance {
    // course
    if ((_slide + 1) >= [_photoImageViews count]) {
        _isForward = NO;
    } else if (_slide == 0) {
        _isForward = YES;
    }
    
    if (_isForward) {
        _slide++;
    } else {
        _slide--;
    }
    
    [_scrollView scrollRectToVisible:[[_photoImageViews objectAtIndex:_slide] frame] animated:YES];
}

@end
