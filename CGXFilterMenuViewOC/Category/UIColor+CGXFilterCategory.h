//
//  UIColor+CGXFilterCategory.h
//  CGXFilterMenuViewOC-Example
//
//  Created by CGX on 2019/09/01.
//  Copyright © 2019 CGX. All rights reserved.
//


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (CGXFilterCategory)

+ (UIColor*)colorWithR:(CGFloat)red G:(CGFloat)green B:(CGFloat)blue;

@property (nonatomic, assign, readonly) CGFloat gx_red;
@property (nonatomic, assign, readonly) CGFloat gx_green;
@property (nonatomic, assign, readonly) CGFloat gx_blue;
@property (nonatomic, assign, readonly) CGFloat gx_alpha;
@end

NS_ASSUME_NONNULL_END
