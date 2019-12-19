//
//  CGXFilterHeaderModel.m
//  CGXFilterMenuViewOC-Example
//
//  Created by CGX on 2019/09/01.
//  Copyright © 2019 CGX. All rights reserved.
//

#import "CGXFilterMenuHeaderModel.h"

@implementation CGXFilterMenuHeaderModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.leftModel = [[CGXFilterMenuTitleModel alloc] init];
        self.leftModel.title = @"";
        self.leftModel.titleFont = [UIFont systemFontOfSize:14];
        self.leftModel.titleColor = [UIColor blackColor];
        self.rightModel = [[CGXFilterMenuTitleModel alloc] init];
        self.rightModel.titleFont = [UIFont systemFontOfSize:12];
        self.rightModel.titleColor = [UIColor redColor];
          self.rightModel.title = @"";
        
        self.headerHeight = 40;
        self.bgColor = [UIColor whiteColor];
        self.leftSpace = 10;
        self.rightSpace = 10;
        
        self.isShowAll = NO;
        self.isIndicator = YES;
    }
    return self;
}
@end
