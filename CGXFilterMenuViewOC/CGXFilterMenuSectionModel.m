//
//  CGXFilterSectionModel.m
//  CGXFilterMenuViewOC-Example
//
//  Created by CGX on 2019/09/01.
//  Copyright © 2019 CGX. All rights reserved.
//

#import "CGXFilterMenuSectionModel.h"

@implementation CGXFilterMenuSectionModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.style = CGXFilterMenuSectionModelStyleText;
        self.chooseType = CGXFilterMenuSectionModelChooseTypeSingle;
        self.headerClickType = CGXFilterMenuSectionModelHeaderClickTypeNode;

        self.height = 60;
        self.itemList = [NSMutableArray array];
        self.selectedItemList = [NSMutableArray array];
        self.sectionNumber = 3;
        self.sectionShowNumber = 3;
        self.inset = UIEdgeInsetsMake(10, 10, 10, 10);
        self.minimumLineSpacing = 10;
        self.minimumInteritemSpacing = 10;
        self.headerModel = [[CGXFilterMenuHeaderModel alloc] init];
        self.footerModel = [[CGXFilterMenuFooterModel alloc] init];
        
    }
    return self;
}
@end
