//
//  CGXFilterMenuTextCell.h
//  CGXFilterMenuViewOC-Example
//
//  Created by CGX on 2019/09/01.
//  Copyright © 2019 CGX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CGXFilterMenuItemModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface CGXFilterMenuTextCell : UICollectionViewCell

@property (nonatomic , strong) UILabel *titleLabel;

- (void)updateWithModel:(CGXFilterMenuItemModel *)model;
@end

NS_ASSUME_NONNULL_END
