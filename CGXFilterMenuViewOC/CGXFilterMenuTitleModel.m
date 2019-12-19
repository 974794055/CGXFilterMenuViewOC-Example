//
//  CGXFilterMenuTitleModel.m
//  CGXFilterMenuViewOC-Example
//
//  Created by CGX on 2019/09/01.
//  Copyright © 2019 CGX. All rights reserved.
//

#import "CGXFilterMenuTitleModel.h"

@implementation CGXFilterMenuTitleModel

- (instancetype)init
{
    self = [super init];
    if (self) {
         self.title = @"";
        self.titleFont = [UIFont systemFontOfSize:14];
        self.titleColor = [UIColor blackColor];
    }
    return self;
}

@end
