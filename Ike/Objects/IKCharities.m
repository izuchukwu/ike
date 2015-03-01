//
//  IKCharities.m
//  Ike
//
//  Created by Izuchukwu Elechi on 3/1/15.
//  Copyright (c) 2015 Izuchukwu Elechi. All rights reserved.
//

#import "IKCharities.h"

@implementation IKCharities

+(IKCharity *)acs {
    IKCharity *ch = [[IKCharity alloc] init];
    [ch setName:@"American Cancer Society"];
    [ch setSite:@"cancer.org"];
    [ch setMission:@"Our vision is a world free of cancer, and we are here to help you. Call us 24/7 for cancer care at 1-800-227-2345."];
    [ch setTwitterName:@"@AmericanCancer"];
    [ch setImage:[UIImage imageNamed:@"charity-acs"]];
    [ch setBanner:[UIImage imageNamed:@"charity-banner-acs"]];
    
    [ch setCause:@"Fighting Cancer"];
    [ch setCauseTitle:@"Let's Fight Cancer Together"];
    [ch setCauseFight:@"the Fight Against Cancer"];
    [ch setCauseBanner:[UIImage imageNamed:@"cause-cancer"]];
    return ch;
}

+(IKCharity *)who {
    IKCharity *ch = [[IKCharity alloc] init];
    [ch setName:@"World Health Organization"];
    [ch setSite:@"who.int"];
    [ch setMission:@"The World Health Organization, the United Nations' Health Agency."];
    [ch setTwitterName:@"@WHO"];
    [ch setImage:[UIImage imageNamed:@"charity-who"]];
    [ch setBanner:[UIImage imageNamed:@"charity-banner-who"]];
    
    [ch setCause:@"Fighting Ebola"];
    [ch setCauseTitle:@"United for Africa, Against Ebola"];
    [ch setCauseFight:@"the Fight Against Ebola"];
    [ch setCauseBanner:[UIImage imageNamed:@"cause-ebola"]];
    return ch;
}

+(IKCharity *)wwf {
    IKCharity *ch = [[IKCharity alloc] init];
    [ch setName:@"World Wildlife Fund"];
    [ch setSite:@"wwf.panda.org"];
    [ch setMission:@"Building a future in which humans live in harmony with nature."];
    [ch setTwitterName:@"@WWF"];
    [ch setImage:[UIImage imageNamed:@"charity-wwf"]];
    [ch setBanner:[UIImage imageNamed:@"charity-banner-wwf"]];
    
    [ch setCause:@"For the Animals"];
    [ch setCauseTitle:@"Supporting Wildlife"];
    [ch setCauseFight:@"the Future of Wildlife"];
    //[ch setCauseBanner:[UIImage imageNamed:@"cause-cancer"]];
    return ch;
}

+(IKCharity *)unicef {
    IKCharity *ch = [[IKCharity alloc] init];
    [ch setName:@"UNICEF"];
    [ch setSite:@"unicef.org"];
    [ch setMission:@"UNICEF promotes the rights and wellbeing of every child in 190 countries and territories, with a special focus on reaching those in greatest need."];
    [ch setTwitterName:@"@UNICEF"];
    [ch setImage:[UIImage imageNamed:@"charity-unicef"]];
    [ch setBanner:[UIImage imageNamed:@"charity-banner-unicef"]];
    
    [ch setCause:@"Education"];
    [ch setCauseTitle:@"Education for Everyone"];
    [ch setCauseFight:@"Education for Everyone"];
    //[ch setCauseBanner:[UIImage imageNamed:@"cause-cancer"]];
    return ch;
}

+(IKCharity *)wwp {
    IKCharity *ch = [[IKCharity alloc] init];
    [ch setName:@"Wounded Warrior Project"];
    [ch setSite:@"woundedwarriorproject.org"];
    [ch setMission:@"The mission of Wounded Warrior Project is to honor & empower wounded warriors."];
    [ch setTwitterName:@"@wwpinv"];
    [ch setImage:[UIImage imageNamed:@"charity-wwp"]];
    [ch setBanner:[UIImage imageNamed:@"charity-banner-wwp"]];
    
    [ch setCause:@"America's Brave"];
    [ch setCauseTitle:@"Empowering the Brave"];
    [ch setCauseFight:@"Empowering the Brave"];
    //[ch setCauseBanner:[UIImage imageNamed:@"cause-cancer"]];
    return ch;
}

@end
