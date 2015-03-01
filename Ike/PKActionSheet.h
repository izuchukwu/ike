//
//  PKActionSheet.h
//  Peek
//
//  Created by Izuchukwu Elechi on 8/5/14.
//  Copyright (c) 2014 Izuchukwu Elechi. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PKCommon.h"

#import "PKActionSheetItem.h"

@class PKActionSheet;

@protocol PKActionSheetDelegate <NSObject>

- (void)didReturnWithSelection:(int)selection;

@end

@interface PKActionSheet : UIView {
    
    NSArray *_items;
    UIView *_headerView;
    
    UILabel *_titleLabel;
    
    UIView *_sheetView;
    UIView *_dim;
    
    UIView *_presentingView;
    
    NSMutableArray *_recognizers;
        
}

@property (nonatomic) id<PKActionSheetDelegate> delegate;

- (void)setItems:(NSArray *)items withHeaderView:(UIView *)headerView title:(NSString *)title;

- (void)presentInView:(UIView *)view;

@end
