//
//  IKTee.m
//  Ike
//
//  Created by Izuchukwu Elechi on 3/1/15.
//  Copyright (c) 2015 Izuchukwu Elechi. All rights reserved.
//

#import "IKTee.h"

@implementation IKTee

- (NSString *)about {
    return [NSString stringWithFormat:@"Benefiting the %@\nin %@", [_charity name], [_charity causeFight]];
}

@end
