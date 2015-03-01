//
//  IKDesigner.m
//  Ike
//
//  Created by Izuchukwu Elechi on 3/1/15.
//  Copyright (c) 2015 Izuchukwu Elechi. All rights reserved.
//

#import "IKDesigner.h"

@implementation IKDesigner

+ (IKDesigner *)ike {
    IKDesigner *designer = [[IKDesigner alloc] init];
    [designer setName:@"Designed by Iké"];
    [designer setBio:@"Tees & more designed by the Iké Team"];
    [designer setProfile:[UIImage imageNamed:@"item-designer-ike"]];
    return designer;
}

@end
