//
//  CGXFilterItemModel.m
//  CGXFilterMenuViewOC-Example
//
//  Created by CGX on 2019/09/01.
//  Copyright © 2019 CGX. All rights reserved.
//

#import "CGXFilterMenuItemModel.h"

@implementation CGXFilterMenuItemModel


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.itemId = @"0";
        self.selectBorderWidth = 1;
         self.normalBorderWidth = 0;
        self.isSelected = NO;
        self.selectColor = [UIColor blackColor];
        self.normalColor = [UIColor blackColor];
        
        self.itemNormalFont = [UIFont systemFontOfSize:14];
        self.itemSelectFont = [UIFont systemFontOfSize:14];
        self.itemBgColor=[UIColor colorWithWhite:0.93 alpha:1];
         self.keyboardTypeDefault = UIKeyboardTypeDefault;
    }
    return self;
}
@end
