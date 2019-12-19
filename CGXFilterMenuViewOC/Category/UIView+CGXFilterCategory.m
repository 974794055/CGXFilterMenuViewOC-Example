//
//  UIView+CGXFilterCategory.m
//  CGXFilterMenuViewOC-Example
//
//  Created by CGX on 2019/09/01.
//  Copyright © 2019 CGX. All rights reserved.
//

#import "UIView+CGXFilterCategory.h"
#import <objc/runtime.h>
@interface UIView()

@property (nonatomic,assign) void(^block)(NSInteger tag);

@end
@implementation UIView (CGXFilterCategory)

- (void)addFilterCategoryTapGestureRecognizerWithDelegate:(id)tapGestureDelegate Block:(void (^)(NSInteger))block
{
    self.block = block;
    UITapGestureRecognizer *tag = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tagClick)];
    [self addGestureRecognizer:tag];
    if (tapGestureDelegate) {
        tag.delegate = tapGestureDelegate;
    }
    self.userInteractionEnabled = YES;
}
- (void)tagClick
{
    if (self.block) {
        self.block(self.tag);
    }
}
- (void)setBlock:(void (^)(NSInteger tag))block
{
    objc_setAssociatedObject(self, @selector(block), block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (void(^)(NSInteger tag))block
{
    return objc_getAssociatedObject(self, @selector(block));
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    return YES;
}
@end
