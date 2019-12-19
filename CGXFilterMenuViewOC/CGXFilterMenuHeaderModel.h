//
//  CGXFilterHeaderModel.h
//  CGXFilterMenuViewOC-Example
//
//  Created by CGX on 2019/09/01.
//  Copyright © 2019 CGX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "CGXFilterMenuTitleModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface CGXFilterMenuHeaderModel : NSObject

// 分区头高度 默认60
@property (nonatomic , assign) CGFloat headerHeight;
// 分区头背景色
@property (nonatomic , strong) UIColor *bgColor;

//左侧标题  默认14 黑色

@property (nonatomic , strong) CGXFilterMenuTitleModel *leftModel;

//左侧标题 默认14 黑色
@property (nonatomic , strong) CGXFilterMenuTitleModel *rightModel;

//右侧标题
@property (nonatomic , strong) NSString *rightShowImage;
//右侧标题
@property (nonatomic , strong) NSString *rightShowImageNo;


//左侧间距  默认10
@property (nonatomic , assign) CGFloat leftSpace;
//右侧间距 默认10
@property (nonatomic , assign) CGFloat rightSpace;

//是否展开  CGXFilterSectionModelStyleText时有效
@property (nonatomic , assign) BOOL isShowAll;
//是否指示器 默认是指示器
@property (nonatomic , assign) BOOL isIndicator;
@end

NS_ASSUME_NONNULL_END
