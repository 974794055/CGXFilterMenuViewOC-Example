//
//  CGXFilterMenuBottomView.m
//  CGXFilterMenuViewOC-Example
//
//  Created by CGX on 2019/09/01.
//  Copyright © 2019 CGX. All rights reserved.
//

#import "CGXFilterMenuBottomView.h"

@interface CGXFilterMenuBottomView ()

@property (nonatomic , strong) UIButton *sureBtn;
@property (nonatomic , strong) UIButton *resetBtn;

@end
@implementation CGXFilterMenuBottomView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialize];
    }
    return self;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
}

- (void)initialize
{
    self.resetBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.resetBtn];
    [self.resetBtn setTitle:@"重置" forState:UIControlStateNormal];
    self.resetBtn.layer.masksToBounds = YES;
    self.resetBtn.clipsToBounds = YES;
    self.resetBtn.layer.borderWidth = self.resetBorderWidth;
    self.resetBtn.layer.borderColor = self.resetBorderColor.CGColor;
    [self.resetBtn setTitleColor:self.resetTitleColor forState:UIControlStateNormal];
    self.resetBtn.titleLabel.font = self.resetFont;
    
    self.sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.sureBtn setTitle:@"确人" forState:UIControlStateNormal];
    [self addSubview:self.sureBtn];
    self.sureBtn.layer.masksToBounds = YES;
    self.sureBtn.clipsToBounds = YES;
    self.sureBtn.layer.borderWidth = self.sureBorderWidth;
    self.sureBtn.layer.borderColor = self.sureBorderColor.CGColor;
    [self.sureBtn setTitleColor:self.sureTitleColor forState:UIControlStateNormal];
    self.sureBtn.titleLabel.font = self.sureFont;
    
    
    [self.sureBtn addTarget:self action:@selector(sureClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.resetBtn addTarget:self action:@selector(resetClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.resetBtn.translatesAutoresizingMaskIntoConstraints = NO;
    self.sureBtn.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.resetBtn
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeTop
                                                    multiplier:1.
                                                      constant:10]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.resetBtn
                                                     attribute:NSLayoutAttributeBottom
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeBottom
                                                    multiplier:1
                                                      constant:-10]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.resetBtn
                                                     attribute:NSLayoutAttributeLeft
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeLeft
                                                    multiplier:1.
                                                      constant:20]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.resetBtn
                                                     attribute:NSLayoutAttributeRight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.sureBtn
                                                     attribute:NSLayoutAttributeLeft
                                                    multiplier:1.
                                                      constant:-20]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.sureBtn
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeTop
                                                    multiplier:1.
                                                      constant:10]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.sureBtn
                                                     attribute:NSLayoutAttributeBottom
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeBottom
                                                    multiplier:1.
                                                      constant:-10]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.sureBtn
                                                     attribute:NSLayoutAttributeRight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeRight
                                                    multiplier:1.
                                                      constant:-20]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.sureBtn
                                                     attribute:NSLayoutAttributeLeft
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.resetBtn
                                                     attribute:NSLayoutAttributeRight
                                                    multiplier:1.
                                                      constant:20]];
    
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.sureBtn
                                                     attribute:NSLayoutAttributeWidth
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.resetBtn
                                                     attribute:NSLayoutAttributeWidth
                                                    multiplier:1
                                                      constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.sureBtn
                                                     attribute:NSLayoutAttributeHeight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.resetBtn
                                                     attribute:NSLayoutAttributeHeight
                                                    multiplier:1
                                                      constant:0]];
    self.resetBtn.layer.cornerRadius = CGRectGetHeight(self.resetBtn.bounds)/2.0;
    self.sureBtn.layer.cornerRadius = CGRectGetHeight(self.resetBtn.bounds)/2.0;
}
- (void)layoutSubviews
{
    [super layoutSubviews];

}

- (void)sureClick:(UIButton *)sender
{
    if (self.sureClickBlock) {
        self.sureClickBlock();
    }
}
- (void)resetClick:(UIButton *)sender
{
    if (self.resetClickBlock) {
        self.resetClickBlock();
    }
}

- (UIFont *)resetFont
{
    if (!_resetFont) {
        _resetFont = [UIFont systemFontOfSize:14];
    }
    return _resetFont;
}

- (UIFont *)sureFont
{
    if (!_sureFont) {
        _sureFont = [UIFont systemFontOfSize:14];
    }
    return _sureFont;
}

- (UIColor *)resetBorderColor
{
    if (!_resetBorderColor) {
        _resetBorderColor = [UIColor colorWithWhite:0.93 alpha:1];
    }
    return _resetBorderColor;
}
- (UIColor *)resetTitleColor
{
    if (!_resetTitleColor) {
        _resetTitleColor = [UIColor blackColor];
    }
    return _resetTitleColor;
}
- (UIColor *)sureBorderColor
{
    if (!_sureBorderColor) {
        _resetBorderColor = [UIColor colorWithWhite:0.93 alpha:1];
    }
    return _resetBorderColor;
}
- (UIColor *)sureTitleColor
{
    if (!_sureTitleColor) {
        _sureTitleColor = [UIColor redColor];
    }
    return _sureTitleColor;
}
- (CGFloat)resetBorderWidth
{
    if (!_resetBorderWidth) {
        _resetBorderWidth = 1;
    }
    return _resetBorderWidth;
}
- (CGFloat)sureBorderWidth
{
    if (!_sureBorderWidth) {
        _sureBorderWidth = 1;
    }
    return _sureBorderWidth;
}
- (CGFloat)space
{
    if (!_space) {
        _space = 10;
    }
    return _space;
}
- (void)setResetTitle:(NSString *)resetTitle
{
    _resetTitle = resetTitle;
    [self.resetBtn setTitle:resetTitle forState:UIControlStateNormal];
}
- (void)setSureTitle:(NSString *)sureTitle
{
    _sureTitle = sureTitle;
    [self.resetBtn setTitle:sureTitle forState:UIControlStateNormal];
}
- (void)setResetBgColor:(UIColor *)resetBgColor
{
    _resetBgColor = resetBgColor;
    self.resetBtn.backgroundColor = resetBgColor;
}
- (void)setSureBgColor:(UIColor *)sureBgColor
{
    _sureBgColor = sureBgColor;
    self.sureBtn.backgroundColor = sureBgColor;
}

- (void)setResetCornerRadius:(CGFloat)resetCornerRadius
{
    _resetCornerRadius = resetCornerRadius;
    self.resetBtn.layer.cornerRadius =self.resetCornerRadius;
}
- (void)setSureCornerRadius:(CGFloat)sureCornerRadius
{
    _sureCornerRadius = sureCornerRadius;
    self.sureBtn.layer.cornerRadius =self.sureCornerRadius;
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
