//
//  UIImageView+Peek.m
//  Peek
//
//  Created by Izuchukwu Elechi on 7/19/14.
//  Copyright (c) 2014 Izuchukwu Elechi. All rights reserved.
//

#import "UIImageView+Peek.h"

#import "PKCommon.h"

@implementation UIImageView (Peek)

- (void)setIcon:(UIImage *)icon withColor:(UIColor *)color {
    [self setImage:icon];
    [self setBackgroundColor:color];
    ifRound [self round];
}

- (void)makeRoundedCornersWithCornerRadius:(float)cornerRadius borderColor:(CGColorRef)borderColor andBorderWith:(float)borderWidth
{
    UIImageView *imgV = self;
    UIImageView *tempImageView = [[UIImageView alloc] initWithFrame:imgV.frame];
    UIGraphicsBeginImageContextWithOptions(tempImageView.bounds.size, NO, 1.0);
    [[UIBezierPath bezierPathWithRoundedRect:tempImageView.bounds
                                cornerRadius:cornerRadius] addClip];
    [imgV.image drawInRect:tempImageView.bounds];
    tempImageView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    imgV.image = tempImageView.image;
    [imgV.layer setRasterizationScale:[UIScreen mainScreen].scale];
    imgV.layer.shouldRasterize = YES;
    imgV.layer.borderColor = borderColor;
    imgV.layer.borderWidth = borderWidth;
    imgV.layer.cornerRadius = cornerRadius;
}

@end
