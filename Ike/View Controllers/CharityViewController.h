//
//  CharityViewController.h
//  Ike
//
//  Created by Izuchukwu Elechi on 3/1/15.
//  Copyright (c) 2015 Izuchukwu Elechi. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "IKTeeView.h"
#import "IKCharities.h"
#import "IKCharityMetaView.h"

@interface CharityViewController : UIViewController<IKTeeViewDelegate>

- (id)initWithCharity:(IKCharity *)charity;

@end
