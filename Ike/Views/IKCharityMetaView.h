//
//  IKCharityMetaView.h
//  Ike
//
//  Created by Izuchukwu Elechi on 3/1/15.
//  Copyright (c) 2015 Izuchukwu Elechi. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "IKCharities.h"

@interface IKCharityMetaView : UIView

@property (strong, nonatomic) IBOutlet UIView *view;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *bioLabel;
@property (strong, nonatomic) IBOutlet UILabel *twitterLabel;
@property (strong, nonatomic) IBOutlet UILabel *siteLabel;

- (void)displayCauseOfCharity:(IKCharity *)charity;

@end
