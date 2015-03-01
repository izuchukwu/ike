//
//  IKTeeView.h
//  Ike
//
//  Created by Izuchukwu Elechi on 3/1/15.
//  Copyright (c) 2015 Izuchukwu Elechi. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "IKTee.h"

@interface IKTeeView : UIView

@property (strong, nonatomic) IBOutlet UIView *view;
@property (strong, nonatomic) IBOutlet UIImageView *teeImageView;
@property (strong, nonatomic) IBOutlet UIImageView *charityImageView;
@property (strong, nonatomic) IBOutlet UILabel *teeName;
@property (strong, nonatomic) IBOutlet UILabel *teeDescription;
@property (strong, nonatomic) IBOutlet UIImageView *teeDesignerProfile;
@property (strong, nonatomic) IBOutlet UILabel *teeDesignerName;

- (void)displayTee:(IKTee *)tee;

@end
