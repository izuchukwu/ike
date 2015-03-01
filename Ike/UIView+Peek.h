//
//  UIView+Peek.h
//  Peek
//
//  Created by Izuchukwu Elechi on 7/26/14.
//  Copyright (c) 2014 Izuchukwu Elechi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Peek)

- (void)round;
- (void)roundWithRasterize:(BOOL)rasterize floor:(BOOL)shouldFloor;
- (void)unround;

- (void)setBackgroundColor:(UIColor *)color withCornerRadius:(float)cornerRadius;
- (void)roundWithRasterize:(BOOL)rasterize floor:(BOOL)shouldFloor shouldClip:(BOOL)shouldClip;

@end
