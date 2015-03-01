//
//  PKActionSheetItem.h
//  Peek
//
//  Created by Izuchukwu Elechi on 8/5/14.
//  Copyright (c) 2014 Izuchukwu Elechi. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PKCommon.h"

@interface PKActionSheetItem : UIView {
    
    BOOL _warn;
    
    IBOutlet UIImageView *_iconImageView;
    IBOutlet UILabel *_titleLabel;
    
}

@property (nonatomic) IBOutlet UIView *view;

- (void)setTitle:(NSString *)title icon:(UIImage *)icon iconOverride:(BOOL)override warn:(BOOL)warn;

- (BOOL)shouldSeparate;

- (void)setSelected;

@end
