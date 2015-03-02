//
//  IKItemActionView.h
//  Ike
//
//  Created by Izuchukwu Elechi on 3/1/15.
//  Copyright (c) 2015 Izuchukwu Elechi. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "IKTee.h"

@interface IKItemActionView : UIView

@property (nonatomic) UIViewController *vc;

@property (strong, nonatomic) IBOutlet UIView *view;
@property (strong, nonatomic) IBOutlet UILabel *price;

- (IBAction)userDidApplePay:(id)sender;
- (IBAction)userDidShare:(id)sender;

- (void)displayItem:(IKTee *)charity;

@end
