//
//  IKCharity.h
//  Ike
//
//  Created by Izuchukwu Elechi on 3/1/15.
//  Copyright (c) 2015 Izuchukwu Elechi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface IKCharity : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *site;
@property (nonatomic) NSString *cnavID;
@property (nonatomic) NSString *mission;
@property (nonatomic) NSString *twitterName;
@property (nonatomic) UIImage *image;
@property (nonatomic) UIImage *banner;

@property (nonatomic) NSString *cause;
@property (nonatomic) NSString *causeTitle;
@property (nonatomic) NSString *causeFight; // for the shirts eg. "the Fight Against Ebola", "working For the Brave"
@property (nonatomic, retain) UIImage *causeBanner;

@end
