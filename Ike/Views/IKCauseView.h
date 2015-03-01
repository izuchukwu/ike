//
//  IKCauseView.h
//  Ike
//
//  Created by Izuchukwu Elechi on 3/1/15.
//  Copyright (c) 2015 Izuchukwu Elechi. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "IKCharity.h"

@protocol IKCauseViewDelegate <NSObject>

@optional

- (void)didSelectCharity:(IKCharity *)charity;
- (void)didSelectCause:(IKCharity *)charity;

@end

@interface IKCauseView : UIView

@property (nonatomic) id<IKCauseViewDelegate> delegate;
@property (nonatomic) BOOL displaysCharitiesNotCauses;

- (void)displayCharities:(NSArray *)charities;

@end
