//
//  IKTeeView.h
//  Ike
//
//  Created by Izuchukwu Elechi on 3/1/15.
//  Copyright (c) 2015 Izuchukwu Elechi. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "IKTee.h"

@protocol IKTeeViewDelegate <NSObject>

@optional

- (void)didSelectTee:(IKTee *)tee;

@end

@interface IKTeeView : UIView

@property (nonatomic) id<IKTeeViewDelegate> delegate;

@property (strong, nonatomic) IBOutlet UIView *view;
@property (strong, nonatomic) IBOutlet UIImageView *teeImageView;
@property (strong, nonatomic) IBOutlet UIImageView *charityImageView;
@property (strong, nonatomic) IBOutlet UILabel *teeName;
@property (strong, nonatomic) IBOutlet UILabel *teeDescription;
@property (strong, nonatomic) IBOutlet UIImageView *teeDesignerProfile;
@property (strong, nonatomic) IBOutlet UILabel *teeDesignerName;
@property (strong, nonatomic) IBOutlet UIImageView *arrow;

- (void)displayTee:(IKTee *)tee;
- (void)hideArrow;

@end
