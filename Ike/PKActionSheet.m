//
//  PKActionSheet.m
//  Peek
//
//  Created by Izuchukwu Elechi on 8/5/14.
//  Copyright (c) 2014 Izuchukwu Elechi. All rights reserved.
//

#import "PKActionSheet.h"

#define sheetBufferHeight 500.0
#define titleSheetDistance 18.0

@implementation PKActionSheet

- (id)init
{
    self = [super init];
    if (self) {
        _sheetView = [[UIView alloc] init];
    }
    return self;
}

- (void)setItems:(NSArray *)items withHeaderView:(UIView *)headerView title:(NSString *)title {
    _items = items;
    
    CGFloat height = 0;
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    [_sheetView setBackgroundColor:PKColorWhite];
    
    if (headerView) {
        CGRect fr = headerView.frame;
        fr.origin.y = 0;
        fr.origin.x = 0;
        fr.size.width = width;
        [headerView setFrame:fr];
        
        [_sheetView addSubview:headerView];
        
        height += headerView.frame.size.height;
    }
    
    for (PKActionSheetItem *item in items) {
        CGRect fr = item.frame;
        fr.origin.y = height;
        fr.size.width = width;
        [item setFrame:fr];
        
        UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(itemSelectedWithRecognizer:)];
        [item addGestureRecognizer:recognizer];
        
        [_sheetView addSubview:item];
        
        height += item.frame.size.height;
        
        if ([item shouldSeparate] && (item != [items lastObject]) && [[items objectAtIndex:([items indexOfObject:item] + 1)] shouldSeparate]) {
            height += [self addSeparatorAtHeight:height];
        }
    }
    
    CGRect fr = self.frame;
    fr.size = CGSizeMake(width, height + sheetBufferHeight);
    [_sheetView setFrame:fr];
    
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 17.0)];
    [_titleLabel setText:title];
    [_titleLabel setTextAlignment:NSTextAlignmentCenter];
    [_titleLabel setFont:PKFontOverlayDescriptionLabel];
    [_titleLabel setTextColor:PKColorWhite];
}

- (void)itemSelectedWithRecognizer:(UITapGestureRecognizer *)recognizer {
    NSLog(@"Item No. %d selected", (int)[_items indexOfObject:[recognizer view]]);
    [(PKActionSheetItem *)[recognizer view] setSelected];
    [self dismissWithSelection:(int)[_items indexOfObject:[recognizer view]]];
}

- (void)dimSelectedWithRecognizer:(UITapGestureRecognizer *)recognizer {
    [self dismissWithSelection:-1];
}

- (void)presentInView:(UIView *)view {
    _presentingView = view;
    
    if (!_dim) {
        _dim = [[UIView alloc] init];
    }
    
    [_dim setFrame:view.bounds];
    [_dim setBackgroundColor:[UIColor colorWithWhite:0.0 alpha:0.5]];
    [_dim setAlpha:0.0];
    
    _recognizers = [[NSMutableArray alloc] init];
    
    UITapGestureRecognizer *tapGestureRrecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dimSelectedWithRecognizer:)];
    [_dim addGestureRecognizer:tapGestureRrecognizer];
    [_recognizers addObject:tapGestureRrecognizer];
    
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    [_sheetView addGestureRecognizer:panGestureRecognizer];
    [_recognizers addObject:panGestureRecognizer];
    
    [self setFrame:view.bounds];
    
    CGRect fr = _titleLabel.frame;
    fr.origin.y = [self getTitleLabelYOriginForStateVisible:NO];
    [_titleLabel setFrame:fr];
    
    fr = _sheetView.frame;
    fr.origin.y = [self getSheetViewYOriginForStateVisible:NO];
    [_sheetView setFrame:fr];
    
    [self addSubview:_dim];
    [self addSubview:_sheetView];
    [self addSubview:_titleLabel];
    
    [view addSubview:self];
    
    [UIView animateWithDuration:0.0 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [_dim setAlpha:1.0];
        
        CGRect fr = _sheetView.frame;
        fr.origin.y = [self getSheetViewYOriginForStateVisible:YES];
        [_sheetView setFrame:fr];
        
        fr = _titleLabel.frame;
        fr.origin.y = [self getTitleLabelYOriginForStateVisible:YES];
        [_titleLabel setFrame:fr];
        NSLog(@"a");
    } completion:^(BOOL finished) {
        NSLog(@"b");
    }];
}

- (void)dismissWithSelection:(int)selection {
    [UIView animateWithDuration:0.4 delay:0.1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [_dim setAlpha:0.0];
        
        CGRect fr = _sheetView.frame;
        fr.origin.y = [self getSheetViewYOriginForStateVisible:NO];
        [_sheetView setFrame:fr];
        
        fr = _titleLabel.frame;
        fr.origin.y = [self getTitleLabelYOriginForStateVisible:NO];
        [_titleLabel setFrame:fr];
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        if (selection > -1) {
            [_delegate didReturnWithSelection:selection];
        }
        
        for (UIGestureRecognizer *recognizer in _recognizers) {
            [self removeGestureRecognizer:recognizer];
        }
    }];
}

- (CGFloat)getSheetViewYOriginForStateVisible:(BOOL)visible {
    // when calling for not visible
    // set title label's height first
    
    if (visible) {
        return self.frame.size.height - (_sheetView.frame.size.height - sheetBufferHeight);
    } else {
        return self.frame.size.height + (_titleLabel.frame.size.height + titleSheetDistance);
    }
}

- (CGFloat)getTitleLabelYOriginForStateVisible:(BOOL)visible {
    // when calling for visible
    // set sheet view's height first
    
    if (visible) {
        return [self getSheetViewYOriginForStateVisible:YES] - _titleLabel.frame.size.height - titleSheetDistance;
    } else {
        return self.frame.size.height;
    }
}

- (void)handlePan:(UIPanGestureRecognizer *)recognizer {
    
    [recognizer.view.layer removeAllAnimations];
    
    float threshold = [self getSheetViewYOriginForStateVisible:YES];
    
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        
        CGRect sheetFrame = _sheetView.frame;
        CGRect titleLabelFrame = _titleLabel.frame;
        
        BOOL didDismiss = NO;
        
        if (_sheetView.frame.origin.y > threshold) {
            // done, past threshold
            
            didDismiss = YES;
        }
        
        if (didDismiss) {
            [self dismissWithSelection:-1];
        } else {
            sheetFrame.origin.y = [self getSheetViewYOriginForStateVisible:YES];
            titleLabelFrame.origin.y = [self getTitleLabelYOriginForStateVisible:YES];
            
            [UIView animateWithDuration:0.5 delay:0.0 usingSpringWithDamping:0.6 initialSpringVelocity:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                [_sheetView setFrame:sheetFrame];
                [_titleLabel setFrame:titleLabelFrame];
            } completion:nil];
        }
    } else {
        CGPoint translation = [recognizer translationInView:recognizer.view];
        CGPoint center = _sheetView.center;
        CGPoint titleCenter = _titleLabel.center;
        
        if(recognizer.view.frame.origin.y < threshold) {
            translation.y /= 4.0;
        } else if (recognizer.view.frame.origin.y > threshold) {
            CGFloat yOrigin = [self getSheetViewYOriginForStateVisible:YES];
            CGFloat reverseAlpha = (((recognizer.view.frame.origin.y - yOrigin) / (self.frame.size.height - yOrigin)) / 2.0);
            [_dim setAlpha:(1.0 - reverseAlpha)];
        }
        
        center.y += translation.y;
        titleCenter.y += translation.y;
        
        [_sheetView setCenter:center];
        [_titleLabel setCenter:titleCenter];
        
        [recognizer setTranslation:CGPointMake(0, 0) inView:_sheetView];
    }
}

- (CGFloat)addSeparatorAtHeight:(CGFloat)height {
    CGFloat inset = 55.0;
    CGFloat separatorHeight = 0.5;
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, height, ([UIScreen mainScreen].bounds.size.width), separatorHeight)];
    [view setBackgroundColor:PKColorWhite];
    
    UIView *separator = [[UIView alloc] initWithFrame:CGRectMake(inset, 0, ([UIScreen mainScreen].bounds.size.width - inset), separatorHeight)];
    [separator setBackgroundColor:PKColorSuperGray];
    [separator setAlpha:0.15];
    
    [view addSubview:separator];
    [_sheetView addSubview:view];
    return separatorHeight;
}

@end
