//
//  CGXFilterMenuSectionHeaderView.h
//  CGXFilterMenuViewOC-Example
//
//  Created by CGX on 2019/09/01.
//  Copyright © 2019 CGX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CGXFilterMenuSectionModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface CGXFilterMenuSectionHeaderView : UICollectionReusableView
//左侧标题
@property (nonatomic , strong) UILabel *titleLabel;
//右侧按钮
@property (nonatomic , strong) UILabel *rightLabel;
//右侧图片
@property (nonatomic , strong) UIImageView *arrowImageView;

- (void)updateSectionheaderViewWithModel:(CGXFilterMenuSectionModel *)sectionModel IsIndicator:(BOOL)isIndicator;

@end

NS_ASSUME_NONNULL_END
