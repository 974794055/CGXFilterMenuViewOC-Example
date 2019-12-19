//
//  CGXFilterMenuSectionHeaderView.m
//  CGXFilterMenuViewOC-Example
//
//  Created by CGX on 2019/09/01.
//  Copyright © 2019 CGX. All rights reserved.
//

#import "CGXFilterMenuSectionHeaderView.h"

@interface CGXFilterMenuSectionHeaderView ()

@property (nonatomic , strong) CGXFilterMenuSectionModel *sectionModel;
@end

@implementation CGXFilterMenuSectionHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        self.titleLabel.textColor = [UIColor blackColor];
        self.titleLabel.textAlignment = NSTextAlignmentLeft;
        self.titleLabel.numberOfLines = 1;
        [self addSubview:self.titleLabel];
        
        self.rightLabel = [[UILabel alloc] init];
        self.rightLabel.font = [UIFont systemFontOfSize:14];
        self.rightLabel.textColor = [UIColor blackColor];
        self.rightLabel.textAlignment = NSTextAlignmentRight;
        self.rightLabel.numberOfLines = 1;
        [self addSubview:self.rightLabel];
        
        self.arrowImageView = [[UIImageView alloc] init];
        self.arrowImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:self.arrowImageView];
        
        
        [self.titleLabel setContentHuggingPriority:UILayoutPriorityRequired
                                           forAxis:UILayoutConstraintAxisHorizontal];
        [self.rightLabel setContentHuggingPriority:UILayoutPriorityDefaultLow
                                           forAxis:UILayoutConstraintAxisHorizontal];
        
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        self.rightLabel.translatesAutoresizingMaskIntoConstraints = NO;
        self.arrowImageView.translatesAutoresizingMaskIntoConstraints = NO;
         
//        self.titleLabel.preferredMaxLayoutWidth = 80;
//         self.titleLabel.preferredMaxLayoutWidth = 80;
        
        [self initializeView];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    
    
    [self initializeView];
}
- (void)initializeView
{
    
    NSLayoutConstraint *arrowImageY = [NSLayoutConstraint constraintWithItem:self.arrowImageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
    NSLayoutConstraint *arrowImageR = [NSLayoutConstraint constraintWithItem:self.arrowImageView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1 constant:0];
    NSLayoutConstraint *arrowImageW = [NSLayoutConstraint constraintWithItem:self.arrowImageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:25];
    NSLayoutConstraint *arrowImageH = [NSLayoutConstraint constraintWithItem:self.arrowImageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:25];
    //把约束添加到父视图上
    NSArray *array = [NSArray arrayWithObjects:arrowImageY, arrowImageR, arrowImageW, arrowImageH, nil];
    [self addConstraints:array];
    
    
    NSLayoutConstraint *titleLabelT = [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    NSLayoutConstraint *titleLabelB = [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    NSLayoutConstraint *titleLabelL = [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:10];
    NSLayoutConstraint *titleLabelR = [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.rightLabel attribute:NSLayoutAttributeLeft multiplier:1 constant:-10];
    
    //把约束添加到父视图上
    NSArray *array1 = [NSArray arrayWithObjects:titleLabelT, titleLabelB, titleLabelL, titleLabelR, nil];
    [self addConstraints:array1];
    
    
    
    NSLayoutConstraint *rightLabelT = [NSLayoutConstraint constraintWithItem:self.rightLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    NSLayoutConstraint *rightLabelB = [NSLayoutConstraint constraintWithItem:self.rightLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    NSLayoutConstraint *rightLabelL = [NSLayoutConstraint constraintWithItem:self.rightLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.titleLabel attribute:NSLayoutAttributeRight multiplier:1 constant:10];
    NSLayoutConstraint *rightLabelR = [NSLayoutConstraint constraintWithItem:self.rightLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.arrowImageView attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
    
    //把约束添加到父视图上
    NSArray *array2 = [NSArray arrayWithObjects:rightLabelT, rightLabelB, rightLabelL, rightLabelR, nil];
    [self addConstraints:array2];
}
- (void)updateSectionheaderViewWithModel:(CGXFilterMenuSectionModel *)sectionModel IsIndicator:(BOOL)isIndicator
{
    self.sectionModel = sectionModel;
    
    self.rightLabel.hidden = YES;
    self.arrowImageView.hidden = YES;
    
    
    NSMutableAttributedString *leftAtt = [[NSMutableAttributedString alloc] initWithString:sectionModel.headerModel.leftModel.title];
    [leftAtt addAttribute:NSForegroundColorAttributeName
                    value:sectionModel.headerModel.leftModel.titleColor
                    range:NSMakeRange(0, leftAtt.length)];
    [leftAtt addAttribute:NSFontAttributeName
                    value:sectionModel.headerModel.leftModel.titleFont
                    range:NSMakeRange(0, leftAtt.length)];
    self.titleLabel.attributedText = leftAtt;
    
    
    NSMutableAttributedString *rightAtt = [[NSMutableAttributedString alloc] initWithString:sectionModel.headerModel.rightModel.title];
    [rightAtt addAttribute:NSForegroundColorAttributeName
                     value:sectionModel.headerModel.rightModel.titleColor
                     range:NSMakeRange(0, rightAtt.length)];
    [rightAtt addAttribute:NSFontAttributeName
                     value:sectionModel.headerModel.rightModel.titleFont
                     range:NSMakeRange(0, rightAtt.length)];
    self.rightLabel.attributedText = rightAtt;
    
    if (isIndicator) {
        self.rightLabel.hidden = NO;
    }else{
        self.rightLabel.hidden = NO;
        self.arrowImageView.hidden = NO;
        if (sectionModel.headerModel.isShowAll) {
            self.arrowImageView.image = [UIImage imageNamed:sectionModel.headerModel.rightShowImage];
        }else{
            self.arrowImageView.image = [UIImage imageNamed:sectionModel.headerModel.rightShowImageNo];
        }
    }
    [self setNeedsLayout];
    
}

@end
