//
//  CGXFilterItemModel.h
//  CGXFilterMenuViewOC-Example
//
//  Created by CGX on 2019/09/01.
//  Copyright © 2019 CGX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface CGXFilterMenuItemModel : NSObject

//自定义数据类型
@property (copy, nonatomic) id itemData;

//标签标识符
@property (copy, nonatomic) NSString *itemId;

//标签名称
@property (copy, nonatomic) NSString *itemName;
//标签占位符名称  输入框使用
@property (copy, nonatomic) NSString *itemplaceholderName;

@property (nonatomic , assign) UIKeyboardType keyboardTypeDefault;

@property (assign, nonatomic) CGFloat selectBorderWidth;
@property (assign, nonatomic) CGFloat normalBorderWidth;

@property (strong, nonatomic) UIColor *itemBgColor;

//标签式样的按钮有用
@property (assign, nonatomic) BOOL isSelected;

@property (copy, nonatomic) UIColor *selectColor;
@property (copy, nonatomic) UIColor *normalColor;
@property (copy, nonatomic) UIFont *itemNormalFont;
@property (copy, nonatomic) UIFont *itemSelectFont;


/** 最小价格 */
@property (nonatomic , copy) NSString *minPrice;
/** 最大价格 */
@property (nonatomic , copy) NSString *maxPrice;


@end

NS_ASSUME_NONNULL_END
