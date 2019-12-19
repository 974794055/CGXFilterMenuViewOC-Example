//
//  CGXFilterSectionModel.h
//  CGXFilterMenuViewOC-Example
//
//  Created by CGX on 2019/09/01.
//  Copyright © 2019 CGX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "CGXFilterMenuItemModel.h"
#import "CGXFilterMenuHeaderModel.h"
#import "CGXFilterMenuFooterModel.h"

NS_ASSUME_NONNULL_BEGIN

/*
 分区样式
 */
typedef NS_ENUM(NSInteger, CGXFilterMenuSectionModelStyle) {
    CGXFilterMenuSectionModelStyleText,    // 文字
    CGXFilterMenuSectionModelStyleScopeWrite,  // 两项 范围选择 写入
    CGXFilterMenuSectionModelStyleScopepop,  // 两项 范围选择 弹出
};

/*
 分区单双选  CGXFilterSectionModelStyleText时有效
 */
typedef NS_ENUM(NSUInteger, CGXFilterMenuSectionModelChooseType) {
    CGXFilterMenuSectionModelChooseTypeSingle,                  //单选
    CGXFilterMenuSectionModelChooseTypeMultiple,                //多选
};

/*
 分区头点击状态  默认无效果
 */
typedef NS_ENUM(NSUInteger, CGXFilterMenuSectionModelHeaderClickType) {
    CGXFilterMenuSectionModelHeaderClickTypeNode,  // 无效果
    CGXFilterMenuSectionModelChooseTypeMultiplePop,   // 弹出 新界面
     CGXFilterMenuSectionModelChooseTypeMultipleShowMore,   // 展示更多
};

@interface CGXFilterMenuSectionModel : NSObject

@property (nonatomic , assign) CGXFilterMenuSectionModelStyle style;
@property (nonatomic , assign) CGXFilterMenuSectionModelChooseType chooseType;
@property (nonatomic , assign) CGXFilterMenuSectionModelHeaderClickType headerClickType;


//每行个数 默认三个
@property (nonatomic , assign) NSInteger sectionNumber;
//默认展示几个
@property (nonatomic , assign) NSInteger sectionShowNumber;
// cell的高度 默认60
@property (nonatomic , assign) CGFloat height;

// 默认列表选项
@property (nonatomic , strong) NSMutableArray<CGXFilterMenuItemModel *> *itemList;
// 选中的选项
@property (nonatomic , strong) NSMutableArray<CGXFilterMenuItemModel *> *selectedItemList;

@property (nonatomic , assign) UIEdgeInsets inset;
@property (nonatomic , assign) CGFloat minimumLineSpacing;
@property (nonatomic , assign) CGFloat minimumInteritemSpacing;

@property (nonatomic , strong) CGXFilterMenuHeaderModel *headerModel;
@property (nonatomic , strong) CGXFilterMenuFooterModel *footerModel;

@end

NS_ASSUME_NONNULL_END
