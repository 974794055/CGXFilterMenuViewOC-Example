//
//  CGXFilterMenuScopeCell.h
//  CGXFilterMenuViewOC-Example
//
//  Created by CGX on 2019/09/01.
//  Copyright © 2019 CGX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CGXFilterMenuItemModel.h"
NS_ASSUME_NONNULL_BEGIN
// 不能写的点击回调
typedef void (^CGXFilterMenuScopeCellTextFieldClickBlock)(NSString *text,BOOL isMax);

// 写入的点击回调
typedef void (^CGXFilterMenuScopeCellTextFieldBlock)(NSString *text,BOOL isMax);

@interface CGXFilterMenuScopeCell : UICollectionViewCell<UITextFieldDelegate>


//是否可以写入
@property (nonatomic,assign) BOOL isWrite;

@property (nonatomic,copy) CGXFilterMenuScopeCellTextFieldClickBlock textFieldClickBlock;
@property (nonatomic,copy) CGXFilterMenuScopeCellTextFieldBlock textFieldBlock;


- (void)updateWithModel:(CGXFilterMenuItemModel *)model;

@end

NS_ASSUME_NONNULL_END
