//
//  IKTees.m
//  Ike
//
//  Created by Izuchukwu Elechi on 3/1/15.
//  Copyright (c) 2015 Izuchukwu Elechi. All rights reserved.
//

#import "IKTees.h"

#import "IKCharities.h"

@implementation IKTees

+ (NSArray *)tees {
    
    NSMutableArray *tees = [[NSMutableArray alloc] init];
    
    // africa 1: for the love of africa
    IKTee *tee = [[IKTee alloc] init];
    [tee setName:@"For the Love of Africa"];
    [tee setCharity:[IKCharities who]];
    [tee setDesigner:[IKDesigner ike]];
    [tee setPriceUSD:35];
    [tee setTeeImage:[UIImage imageNamed:@"tee-africa1"]];
    [tees addObject:tee];
    
    // done
    return tees;
}

@end
