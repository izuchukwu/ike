//
//  UIView+Peek.m
//  Peek
//
//  Created by Izuchukwu Elechi on 7/26/14.
//  Copyright (c) 2014 Izuchukwu Elechi. All rights reserved.
//

#import "UIView+Peek.h"

#import "PKConstants.h"

@implementation UIView (Peek)

- (void)round {
    ifRound [self setClipsToBounds:YES];
    self.layer.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.0].CGColor;
    ifRound [[self layer] setCornerRadius:[self bounds].size.width / 2.0];
    [[self layer] setRasterizationScale:[UIScreen mainScreen].scale];
    [[self layer] setShouldRasterize:YES];
}

- (void)roundWithRasterize:(BOOL)rasterize floor:(BOOL)shouldFloor {
    [self roundWithRasterize:rasterize floor:shouldFloor shouldClip:YES];
}

- (void)roundWithRasterize:(BOOL)rasterize floor:(BOOL)shouldFloor shouldClip:(BOOL)shouldClip {
    if (shouldClip) [self setClipsToBounds:shouldClip];
    self.layer.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.0].CGColor;
    if (!shouldClip || (PKConstantRoundCorners)) [[self layer] setCornerRadius:(shouldFloor ? floor([self bounds].size.width / 2.0) : ([self bounds].size.width / 2.0))];
    if (rasterize) {
        [[self layer] setRasterizationScale:[UIScreen mainScreen].scale];
        [[self layer] setShouldRasterize:YES];
    }
}

- (void)unround {
    [[self layer] setCornerRadius:0];
    [[self layer] setShouldRasterize:NO];
}

- (void)setBackgroundColor:(UIColor *)color withCornerRadius:(float)cornerRadius {
    /*
    UIImageView *tempImageView = [[UIImageView alloc] initWithFrame:self.bounds];
    
    UIGraphicsBeginImageContextWithOptions(tempImageView.bounds.size, NO, [UIScreen mainScreen].scale);
    [[UIBezierPath bezierPathWithRoundedRect:tempImageView.bounds
                                cornerRadius:cornerRadius] addClip];
    [[UIView imageWithColor:color frame:self.frame] drawInRect:tempImageView.bounds];
    [[UIView imageWithColor:color frame:self.frame] drawInRect:tempImageView.bounds blendMode:kCGBlendModeNormal alpha:CGColorGetAlpha([color CGColor])];
    NSLog(@"%f", CGColorGetAlpha([color CGColor]));
    tempImageView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.backgroundColor = [UIColor clearColor];
    
    [self addSubview:tempImageView];
    [self sendSubviewToBack:tempImageView];*/
    self.backgroundColor = [UIColor clearColor];
    self.layer.backgroundColor = color.CGColor;
    self.layer.rasterizationScale = [UIScreen mainScreen].scale;
    self.layer.shouldRasterize = YES;
    self.layer.cornerRadius = cornerRadius;
}

+ (UIImage *)imageWithColor:(UIColor *)color frame:(CGRect)rect
{
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
