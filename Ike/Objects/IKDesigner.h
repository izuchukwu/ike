//
//  IKDesigner.h
//  Ike
//
//  Created by Izuchukwu Elechi on 3/1/15.
//  Copyright (c) 2015 Izuchukwu Elechi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface IKDesigner : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *bio;
@property (nonatomic) UIImage *profile;

+ (IKDesigner *)ike;

@end
