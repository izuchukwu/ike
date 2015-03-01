//
//  IKCauseMetaView.h
//  Ike
//
//  Created by Izuchukwu Elechi on 3/1/15.
//  Copyright (c) 2015 Izuchukwu Elechi. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "IKCharities.h"

@interface IKCauseMetaView : UIView

@property (strong, nonatomic) IBOutlet UIView *view;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UIImageView *charityImageView;
@property (strong, nonatomic) IBOutlet UILabel *bioLabel;

- (void)displayCauseOfCharity:(IKCharity *)charity;

@end
