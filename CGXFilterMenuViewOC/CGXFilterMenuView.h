//
//  CGXFilterMenuView.h
//  CGXFilterMenuViewOC-Example
//
//  Created by CGX on 2019/09/01.
//  Copyright © 2019 CGX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CGXFilterMenuSectionModel.h"
#import "CGXFilterMenuItemModel.h"
#import "CGXFilterMenuHeaderModel.h"
#import "CGXFilterMenuFooterModel.h"

#import "CGXFilterMenuSectionModel.h"
#import "CGXFilterMenuItemModel.h"
#import "CGXFilterMenuHeaderModel.h"
#import "CGXFilterMenuFooterModel.h"

#import "CGXFilterMenuSectionHeaderView.h"
#import "CGXFilterMenuSectionFooterView.h"

#import "CGXFilterMenuTextCell.h"
#import "CGXFilterMenuScopeCell.h"

@class CGXFilterMenuView;

@protocol CGXFilterMenuViewDelegate;

NS_ASSUME_NONNULL_BEGIN

@interface CGXFilterMenuView : UIView

- (instancetype)creatDropMenuWithConfiguration: (UIView *)configuration;

/*
 数据源代理
 */
@property(nonatomic,weak) id <CGXFilterMenuViewDelegate>delegate;

#pragma mark - 弹出视图方法
- (void)showWithAnimation:(BOOL)animation;
#pragma mark - 关闭视图方法
- (void)dismissWithAnimation:(BOOL)animation;

@property (nonatomic,strong,readonly) NSMutableArray<CGXFilterMenuSectionModel *> *dataArray;

- (void)updateWithDataArray:(NSMutableArray *)dataArray;
- (void)updateResetAll;
@end

@protocol CGXFilterMenuViewDelegate <NSObject>

//@required

@optional

/**
 点击cell
 */
- (void)filterMenuView:(CGXFilterMenuView *)generalView DidSelectItemAtIndexPath:(NSIndexPath *)indexPath;


/**
 点击头部  展开更多内部 无效 ，内部处理啦
 model:每个cell的数据
 indexPath:所在的分区
 */
- (void)filterMenuView:(CGXFilterMenuView *)generalView TapHeaderInSection:(NSInteger)section;

/**
 输入框区间变化
 
 ScopeMaxText:输入框最大值
 ScopeMinText:输入框最小值
 model:每个cell的数据
 indexPath:所在的分区
 
 判断区间选择正确性
 */
- (void)filterMenuView:(CGXFilterMenuView *)generalVie AtIndexPath:(NSIndexPath *)indexPath ScopeMaxText:(NSString *)maxText ScopeMinText:(NSString *)minText;


/*     输入框区间变化 弹框改变显示
 
 PopMaxText:输入框最大值
 PopeMinText:输入框最小值
 model:每个cell的数据
 indexPath:所在的分区
 */
- (void)filterMenuView:(CGXFilterMenuView *)generalView AtIndexPath:(NSIndexPath *)indexPath PopMaxText:(NSString *)maxText;

- (void)filterMenuView:(CGXFilterMenuView *)generalView AtIndexPath:(NSIndexPath *)indexPath PopeMinText:(NSString *)minText;

/*     重置   isReset为NO时有效
 */
- (void)filterMenuView:(CGXFilterMenuView *)generalView ResetDataArray:(NSMutableArray<CGXFilterMenuSectionModel *> *)dataArray;
/*     确定
 */
- (void)filterMenuView:(CGXFilterMenuView *)generalView SureDataArray:(NSMutableArray<CGXFilterMenuSectionModel *> *)dataArray;

@end

NS_ASSUME_NONNULL_END
