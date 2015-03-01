//
//  IKCharity.m
//  Ike
//
//  Created by Izuchukwu Elechi on 3/1/15.
//  Copyright (c) 2015 Izuchukwu Elechi. All rights reserved.
//

#import "IKCharity.h"

@implementation IKCharity

- (NSString *)about {
    return [NSString stringWithFormat:@"Benefiting the %@\nin %@", [self name], [self causeFight]];
}

@end
