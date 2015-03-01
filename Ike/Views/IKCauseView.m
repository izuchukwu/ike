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

@property (nonatomic) BOOL isCause;
@property (nonatomic) IKCharity *currentCh;

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
        
        UITapGestureRecognizer *tapg = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTap)];
        [_scrollView addGestureRecognizer:tapg];
    }
    return self;
}

- (void)didTap {
    if (_isCause) {
        if (_delegate && [_delegate respondsToSelector:@selector(didSelectCause:)]) {
            [_delegate didSelectCause:_currentCh];
        }
    } else {
        if (_delegate && [_delegate respondsToSelector:@selector(didSelectCharity:)]) {
            [_delegate didSelectCharity:_currentCh];
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
            _isCause = NO;
            [photoImageView setImage:[ch banner]];
        } else {
            if ([ch causeBanner]) {
                _isCause = YES;
                [photoImageView setImage:[ch causeBanner]];
            } else {
                _isCause = NO;
                [photoImageView setImage:[ch banner]];
            }
        }
        [_scrollView addSubview:photoImageView];
        [_photoImageViews addObject:photoImageView];
        photoNo++;
    }
    
    _currentCh = [_charities objectAtIndex:0];
    
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
    
    _currentCh = [_charities objectAtIndex:_slide];
    [_scrollView scrollRectToVisible:[[_photoImageViews objectAtIndex:_slide] frame] animated:YES];
}

@end
