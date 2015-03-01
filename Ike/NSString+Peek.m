//
//  NSString+Peek.m
//  Peek
//
//  Created by Izuchukwu Elechi on 7/25/14.
//  Copyright (c) 2014 Izuchukwu Elechi. All rights reserved.
//

#import "NSString+Peek.h"

@implementation NSString (Peek)

- (BOOL)containsString:(NSString *)string {
    return ([self rangeOfString:string].location != NSNotFound);
}

@end
