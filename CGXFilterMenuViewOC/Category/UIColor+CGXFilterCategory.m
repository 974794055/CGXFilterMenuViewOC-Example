//
//  UIColor+CGXFilterCategory.m
//  CGXFilterMenuViewOC-Example
//
//  Created by CGX on 2019/09/01.
//  Copyright © 2019 CGX. All rights reserved.
//

#import "UIColor+CGXFilterCategory.h"


@implementation UIColor (CGXFilterCategory)
+ (UIColor*)colorWithR:(CGFloat)red G:(CGFloat)green B:(CGFloat)blue{
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1];
}
- (CGFloat)gx_red {
    CGFloat r = 0, g, b, a;
    [self getRed:&r green:&g blue:&b alpha:&a];
    return r;
}

- (CGFloat)gx_green {
    CGFloat r, g = 0, b, a;
    [self getRed:&r green:&g blue:&b alpha:&a];
    return g;
}

- (CGFloat)gx_blue {
    CGFloat r, g, b = 0, a;
    [self getRed:&r green:&g blue:&b alpha:&a];
    return b;
}

- (CGFloat)gx_alpha {
    return CGColorGetAlpha(self.CGColor);
}
@end
