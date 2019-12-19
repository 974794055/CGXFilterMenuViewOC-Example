//
//  CGXFilterMenuTextCell.m
//  CGXFilterMenuViewOC-Example
//
//  Created by CGX on 2019/09/01.
//  Copyright © 2019 CGX. All rights reserved.
//

#import "CGXFilterMenuTextCell.h"

@implementation CGXFilterMenuTextCell


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.textColor = [UIColor blackColor];
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:self.titleLabel];
        self.titleLabel.layer.masksToBounds = YES;
        self.titleLabel.clipsToBounds = YES;

        
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self addConstraint:[NSLayoutConstraint constraintWithItem:self.titleLabel
                                                         attribute:NSLayoutAttributeTop
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self.contentView
                                                         attribute:NSLayoutAttributeTop
                                                        multiplier:1
                                                          constant:0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:self.titleLabel
                                                         attribute:NSLayoutAttributeBottom
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self.contentView
                                                         attribute:NSLayoutAttributeBottom
                                                        multiplier:1
                                                          constant:0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:self.titleLabel
                                                         attribute:NSLayoutAttributeLeft
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self.contentView
                                                         attribute:NSLayoutAttributeLeft
                                                        multiplier:1
                                                          constant:0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:self.titleLabel
                                                         attribute:NSLayoutAttributeRight
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self.contentView
                                                         attribute:NSLayoutAttributeRight
                                                        multiplier:1
                                                          constant:0]];
        self.titleLabel.layer.cornerRadius = 8;
        
    }
    return self;
}

- (void)updateWithModel:(CGXFilterMenuItemModel *)model
{
    self.titleLabel.text = model.itemName;
    self.titleLabel.backgroundColor = model.itemBgColor;
    if (model.isSelected) {
        self.titleLabel.textColor = model.selectColor;
        self.titleLabel.font = model.itemSelectFont;
        self.titleLabel.layer.borderWidth = model.selectBorderWidth;
        self.titleLabel.layer.borderColor = model.selectColor.CGColor;
    } else{
        self.titleLabel.textColor = model.normalColor;
        self.titleLabel.font = model.itemNormalFont;
        self.titleLabel.layer.borderWidth = model.normalBorderWidth;
        self.titleLabel.layer.borderColor = model.normalColor.CGColor;;
    }
    
}
@end
