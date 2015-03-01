//
//  IKTee.h
//  Ike
//
//  Created by Izuchukwu Elechi on 3/1/15.
//  Copyright (c) 2015 Izuchukwu Elechi. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "IKCharity.h"
#import "IKDesigner.h"

@interface IKTee : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *about;
@property (nonatomic) IKCharity *charity;
@property (nonatomic) IKDesigner *designer;
@property (nonatomic) double priceUSD;

@property (nonatomic) UIImage *teeImage;

@end
