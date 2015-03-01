//
//  IKCharities.m
//  Ike
//
//  Created by Izuchukwu Elechi on 3/1/15.
//  Copyright (c) 2015 Izuchukwu Elechi. All rights reserved.
//

#import "IKCharities.h"

@implementation IKCharities

+ (IKCharity *)acs {
    IKCharity *ch = [[IKCharity alloc] init];
    [ch setName:@"American Cancer Society"];
    [ch setSite:@"cancer.org"];
    [ch setMission:@"Our visiion is a world free of cancer, and we are here to help you. Call us 24/7 for cancer care at 1-800-227-2345."];
    [ch setTwitterName:@"@AmericanCancer"];
    
    [ch setCause:@"Fighting Cancer"];
    [ch setCauseTitle:@"Let's Fight Cancer Together"];
    [ch setCauseFight:@"the Fight Against Cancer"];
    [ch setCauseBanner:[UIImage imageNamed:@"cause-cancer"]];
    return ch;
}

+ (IKCharity *)who {
    IKCharity *ch = [[IKCharity alloc] init];
    [ch setName:@"World Health Organization"];
    [ch setSite:@"who.int"];
    [ch setMission:@"The World Health Organization, the United Nations' Health Agency."];
    [ch setTwitterName:@"@WHO"];
    
    [ch setCause:@"Fighting Ebola"];
    [ch setCauseTitle:@"Uniting with Africa, Against Ebola"];
    [ch setCauseFight:@"the Fight Against Ebola"];
    [ch setCauseBanner:[UIImage imageNamed:@"cause-ebola"]];
    return ch;
}

@end
