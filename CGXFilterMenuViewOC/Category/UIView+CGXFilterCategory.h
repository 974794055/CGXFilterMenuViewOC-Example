//
//  UIView+CGXFilterCategory.h
//  CGXFilterMenuViewOC-Example
//
//  Created by CGX on 2019/09/01.
//  Copyright © 2019 CGX. All rights reserved.
//
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (CGXFilterCategory)


- (void)addFilterCategoryTapGestureRecognizerWithDelegate:(id)tapGestureDelegate Block:(void(^)(NSInteger tag))block;

@end

NS_ASSUME_NONNULL_END
