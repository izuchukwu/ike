//
//  PKActionSheetItem.m
//  Peek
//
//  Created by Izuchukwu Elechi on 8/5/14.
//  Copyright (c) 2014 Izuchukwu Elechi. All rights reserved.
//

#import "PKActionSheetItem.h"

@implementation PKActionSheetItem

- (id)init
{
    CGRect frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, PKConstantActionSheetStandardItemHeight);
    self = [super initWithFrame:frame];
    if (self) {
        [[NSBundle mainBundle] loadNibNamed:@"ActionSheetItem" owner:self options:nil];
        [self addSubview:self.view];
        [self.view setFrame:frame];
    }
    return self;
}

- (void) awakeFromNib
{
    [super awakeFromNib];
    [self.view setFrame:self.frame];
    [self addSubview:self.view];
}

- (void)setTitle:(NSString *)title icon:(UIImage *)icon iconOverride:(BOOL)override warn:(BOOL)warn {
    _warn = warn;
    
    [_view setBackgroundColor:(warn ? PKColorNorthernCinematicRed : PKColorWhite)];
    
    [_titleLabel setText:title];
    [_titleLabel setTextColor:(warn ? PKColorWhite : PKColorSuperGray)];
    
    if (!override) {
        [_iconImageView setIcon:icon withColor:(warn ? PKColorWhite : PKColorNorthernCinematicRed)];
    } else {
        [_iconImageView setImage:icon];
    }
}

- (BOOL)shouldSeparate {
    return !_warn;
}

- (void)setSelected {
    UIView *selectedDim = [[UIView alloc] initWithFrame:self.bounds];
    [selectedDim setBackgroundColor:[UIColor colorWithWhite:0.0 alpha:0.15]];
    [_view insertSubview:selectedDim atIndex:0];
}

@end
