//
//  CGXFilterMenuTitleModel.h
//  CGXFilterMenuViewOC-Example
//
//  Created by CGX on 2019/09/01.
//  Copyright © 2019 CGX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface CGXFilterMenuTitleModel : NSObject

//左侧标题  默认14 黑色
@property (nonatomic , strong) NSString *title;
@property (nonatomic , strong) UIFont *titleFont;
@property (nonatomic , strong) UIColor *titleColor;

@end

NS_ASSUME_NONNULL_END
