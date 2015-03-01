//
//  NSAttributedString+Peek.m
//  Peek
//
//  Created by Izuchukwu Elechi on 7/23/14.
//  Copyright (c) 2014 Izuchukwu Elechi. All rights reserved.
//

#import "NSAttributedString+Peek.h"

@implementation NSAttributedString (Peek)

- (NSRange)stringRange {
    return NSMakeRange(0, [self length]);
}

@end