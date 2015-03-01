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
    
    // animal 1: for the animals
    tee = [[IKTee alloc] init];
    [tee setName:@"For the Animals"];
    [tee setCharity:[IKCharities wwf]];
    [tee setDesigner:[IKDesigner ike]];
    [tee setPriceUSD:35];
    [tee setTeeImage:[UIImage imageNamed:@"tee-animal1"]];
    [tees addObject:tee];
    
    // brave 1: the brave
    tee = [[IKTee alloc] init];
    [tee setName:@"The Brave"];
    [tee setCharity:[IKCharities wwp]];
    [tee setDesigner:[IKDesigner ike]];
    [tee setPriceUSD:35];
    [tee setTeeImage:[UIImage imageNamed:@"tee-brave1"]];
    [tees addObject:tee];
    
    // brave 2: the brave
    tee = [[IKTee alloc] init];
    [tee setName:@"America, The Brave"];
    [tee setCharity:[IKCharities wwp]];
    [tee setDesigner:[IKDesigner ike]];
    [tee setPriceUSD:35];
    [tee setTeeImage:[UIImage imageNamed:@"tee-brave2"]];
    [tees addObject:tee];
    
    // cancer 1: let's fight
    tee = [[IKTee alloc] init];
    [tee setName:@"Let's Fight Cancer"];
    [tee setCharity:[IKCharities acs]];
    [tee setDesigner:[IKDesigner ike]];
    [tee setPriceUSD:35];
    [tee setTeeImage:[UIImage imageNamed:@"tee-cancer1"]];
    [tees addObject:tee];
    
    // education 1: children's fund
    tee = [[IKTee alloc] init];
    [tee setName:@"The Children's Fund"];
    [tee setCharity:[IKCharities unicef]];
    [tee setDesigner:[IKDesigner ike]];
    [tee setPriceUSD:35];
    [tee setTeeImage:[UIImage imageNamed:@"tee-education1"]];
    [tees addObject:tee];
    
    // education 2: everyone deserves an education
    tee = [[IKTee alloc] init];
    [tee setName:@"Everyone Deserves an Education"];
    [tee setCharity:[IKCharities unicef]];
    [tee setDesigner:[IKDesigner ike]];
    [tee setPriceUSD:35];
    [tee setTeeImage:[UIImage imageNamed:@"tee-education2"]];
    [tees addObject:tee];
    
    // done
    return tees;
}

+ (NSArray *)randomTees {
    NSMutableArray *tees = [NSMutableArray arrayWithArray:[self tees]];
    
    int count = (int)[[self tees] count];
    for (int i = 0; i < count; i++) {
        int nelems = count - i;
        int n = (arc4random() % nelems) + i;
        
        [tees exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
    
    return tees;
}

@end
