//
//  CGXFilterMenuBottomView.h
//  CGXFilterMenuViewOC-Example
//
//  Created by CGX on 2019/09/01.
//  Copyright © 2019 CGX. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

// 重置
typedef void (^CGXFilterBottomViewResetClickBlock)(void);

// 确定
typedef void (^CGXFilterBottomViewSureClickBlock)(void);


@interface CGXFilterMenuBottomView : UIView

@property (nonatomic , copy) CGXFilterBottomViewResetClickBlock resetClickBlock;
@property (nonatomic , copy)CGXFilterBottomViewSureClickBlock sureClickBlock;

@property (nonatomic , strong) NSString *resetTitle;
@property (nonatomic , strong) NSString *sureTitle;

@property (nonatomic , strong) UIColor *resetBorderColor;
@property (nonatomic , assign) CGFloat resetBorderWidth;

@property (nonatomic , strong) UIColor *sureBorderColor;
@property (nonatomic , assign) CGFloat sureBorderWidth;

@property (nonatomic , strong) UIColor *resetTitleColor;
@property (nonatomic , strong) UIColor *sureTitleColor;
@property (nonatomic , strong) UIFont *resetFont;
@property (nonatomic , strong) UIFont *sureFont;

@property (nonatomic , assign) CGFloat resetCornerRadius;
@property (nonatomic , assign) CGFloat sureCornerRadius;


@property (nonatomic , strong) UIColor *resetBgColor;

@property (nonatomic , strong) UIColor *sureBgColor;

@property (nonatomic , assign) CGFloat space; //默认10

@end

NS_ASSUME_NONNULL_END
