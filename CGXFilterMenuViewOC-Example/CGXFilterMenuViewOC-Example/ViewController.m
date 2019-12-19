//
//  ViewController.m
//  CGXFilterMenuViewOC-Example
//
//  Created by CGX on 2019/09/01.
//  Copyright © 2019 CGX. All rights reserved.
//

#import "ViewController.h"

#import "CGXFilterMenuView.h"
@interface ViewController ()<CGXFilterMenuViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"筛选" style:UIBarButtonItemStyleDone target:self action:@selector(show)];
}

- (void)show
{
    CGXFilterMenuView *filterMenuView =  [[CGXFilterMenuView alloc] creatDropMenuWithConfiguration:self.view];
    filterMenuView.delegate = self;
    [filterMenuView showWithAnimation:YES];
    
    NSMutableArray *dataArray = [NSMutableArray array];
    
    NSMutableArray *titleArr = [NSMutableArray arrayWithObjects:
                                @"活动时间"
                                ,@"价格区间"
                                ,@"品牌(多选)"
                                ,@"佩戴方式(多选)"
                                ,@"发声原(单选)"
                                ,@"线控功能(单选)"
                                ,@"有线/无线(单选)"
                                ,@"适合音乐(单选)",
                                nil];
    
    for (int i = 0; i<titleArr.count; i++) {
        
        NSString *title = titleArr[i];
        CGXFilterMenuSectionModel *model = [[CGXFilterMenuSectionModel alloc] init];
        model.style = CGXFilterMenuSectionModelStyleText;
        model.headerClickType = CGXFilterMenuSectionModelHeaderClickTypeNode;
        
        model.height = 40;
        
        if ([title isEqualToString:@"活动时间"]) {
            model.style = CGXFilterMenuSectionModelStyleScopepop;
            CGXFilterMenuItemModel *itetModel =[[CGXFilterMenuItemModel alloc] init];
            itetModel.itemName = @",至,";
            itetModel.itemplaceholderName = @"开始时间,至,结束时间";
            model.itemList = [NSMutableArray arrayWithObjects:itetModel, nil];
        }else if ([title isEqualToString:@"价格区间"]){
            model.style = CGXFilterMenuSectionModelStyleScopeWrite;
            
            CGXFilterMenuItemModel *itetModel =[[CGXFilterMenuItemModel alloc] init];
            itetModel.itemName = @",至,";
            itetModel.itemplaceholderName = @"最低价格,至,最高价格";
            itetModel.keyboardTypeDefault = UIKeyboardTypeNumberPad;
            model.itemList = [NSMutableArray arrayWithObjects:itetModel, nil];
        } else if ([title isEqualToString:@"品牌(多选)"]){
            model.style = CGXFilterMenuSectionModelStyleText;
            model.headerClickType = CGXFilterMenuSectionModelChooseTypeMultipleShowMore;
            model.chooseType = CGXFilterMenuSectionModelChooseTypeMultiple;
            NSMutableArray *itemarr= [NSMutableArray array];
            for (int i = 0; i<10; i++) {
                CGXFilterMenuItemModel *itetModel =[[CGXFilterMenuItemModel alloc] init];
                itetModel.itemName = [NSString stringWithFormat:@"客户-%d" ,i];
                itetModel.selectColor = [UIColor redColor];
                [itemarr addObject:itetModel];
            }
            model.itemList = [NSMutableArray arrayWithArray:itemarr];
            
        } else if ([title isEqualToString:@"佩戴方式(多选)"]){
            model.style = CGXFilterMenuSectionModelStyleText;
            model.headerClickType = CGXFilterMenuSectionModelChooseTypeMultipleShowMore;
            model.chooseType = CGXFilterMenuSectionModelChooseTypeMultiple;
            NSMutableArray *itemarr= [NSMutableArray array];
            for (int i = 0; i<10; i++) {
                CGXFilterMenuItemModel *itetModel =[[CGXFilterMenuItemModel alloc] init];
                itetModel.itemName = [NSString stringWithFormat:@"客户-%d" ,i];
                itetModel.selectColor = [UIColor redColor];
                [itemarr addObject:itetModel];
            }
            model.itemList = [NSMutableArray arrayWithArray:itemarr];
            
        } else if ([title isEqualToString:@"发声原(单选)"]){
            model.style = CGXFilterMenuSectionModelStyleText;
            model.headerClickType = CGXFilterMenuSectionModelChooseTypeMultipleShowMore;
            model.chooseType = CGXFilterMenuSectionModelChooseTypeSingle;
            NSMutableArray *itemarr= [NSMutableArray array];
             for (int i = 0; i<10; i++) {
                CGXFilterMenuItemModel *itetModel =[[CGXFilterMenuItemModel alloc] init];
                itetModel.itemName = [NSString stringWithFormat:@"客户-%d" ,i];
                itetModel.selectColor = [UIColor redColor];
                [itemarr addObject:itetModel];
            }
            model.itemList = [NSMutableArray arrayWithArray:itemarr];
            
        } else if ([title isEqualToString:@"线控功能(单选)"]){
            model.style = CGXFilterMenuSectionModelStyleText;
            model.headerClickType = CGXFilterMenuSectionModelChooseTypeMultipleShowMore;
            model.chooseType = CGXFilterMenuSectionModelChooseTypeSingle;
            NSMutableArray *itemarr= [NSMutableArray array];
            for (int i = 0; i<10; i++) {
                CGXFilterMenuItemModel *itetModel =[[CGXFilterMenuItemModel alloc] init];
                itetModel.itemName = [NSString stringWithFormat:@"客户-%d" ,i];
                itetModel.selectColor = [UIColor redColor];
                [itemarr addObject:itetModel];
            }
            model.itemList = [NSMutableArray arrayWithArray:itemarr];
            
        } else if ([title isEqualToString:@"有线/无线(单选)"]){
            model.style = CGXFilterMenuSectionModelStyleText;
            model.headerClickType = CGXFilterMenuSectionModelChooseTypeMultipleShowMore;
            model.chooseType = CGXFilterMenuSectionModelChooseTypeSingle;
            NSMutableArray *itemarr= [NSMutableArray array];
                for (int i = 0; i<10; i++) {
                CGXFilterMenuItemModel *itetModel =[[CGXFilterMenuItemModel alloc] init];
                itetModel.itemName = [NSString stringWithFormat:@"客户-%d" ,i];
                itetModel.selectColor = [UIColor redColor];
                [itemarr addObject:itetModel];
            }
            model.itemList = [NSMutableArray arrayWithArray:itemarr];
        } else if ([title isEqualToString:@"适合音乐(单选)"]){
            model.style = CGXFilterMenuSectionModelStyleText;
            model.headerClickType = CGXFilterMenuSectionModelChooseTypeMultipleShowMore;
            model.chooseType = CGXFilterMenuSectionModelChooseTypeSingle;
            NSMutableArray *itemarr= [NSMutableArray array];
                for (int i = 0; i<10; i++) {
                CGXFilterMenuItemModel *itetModel =[[CGXFilterMenuItemModel alloc] init];
                itetModel.itemName = [NSString stringWithFormat:@"客户-%d" ,i];
                itetModel.selectColor = [UIColor redColor];
                [itemarr addObject:itetModel];
            }
            model.itemList = [NSMutableArray arrayWithArray:itemarr];
        }
        
        
        CGXFilterMenuHeaderModel *headerModel  = [[CGXFilterMenuHeaderModel alloc] init];
        headerModel.isShowAll = NO;
        headerModel.bgColor = [UIColor colorWithWhite:0.93 alpha:1];
        headerModel.leftModel.title = title;
        //        headerModel.rightModel.title = [NSString stringWithFormat:@"%@%@%@",titleArr[i],titleArr[i],titleArr[i]];
        headerModel.rightShowImage = @"arrow_up";
        headerModel.rightShowImageNo = @"arrow_down";
        model.headerModel = headerModel;
        
        CGXFilterMenuFooterModel *footerModel  = [[CGXFilterMenuFooterModel alloc] init];
        footerModel.bgColor = [UIColor colorWithWhite:0.93 alpha:1];
        model.footerModel = footerModel;
        [dataArray addObject:model];
    }
    [filterMenuView updateWithDataArray:dataArray];
}

- (void)filterMenuView:(CGXFilterMenuView *)generalView AtIndexPath:(NSIndexPath *)indexPath PopMaxText:(NSString *)maxText
{
    NSLog(@"弹出maxText %@" , maxText);
    
    
}
- (void)filterMenuView:(CGXFilterMenuView *)generalView AtIndexPath:(NSIndexPath *)indexPath PopeMinText:(NSString *)minText
{
    NSLog(@"弹出minText %@" , minText);
    
}
- (void)filterMenuView:(CGXFilterMenuView *)generalView AtIndexPath:(NSIndexPath *)indexPath ScopeMaxText:(NSString *)maxText ScopeMinText:(nonnull NSString *)minText
{
    NSLog(@"写入maxText %@--minText %@" , maxText,minText);
}

- (void)filterMenuView:(CGXFilterMenuView *)generalView TapHeaderInSection:(NSInteger)section
{
    CGXFilterMenuSectionModel *sectionModel = generalView.dataArray[section];
    if (sectionModel.headerClickType == CGXFilterMenuSectionModelChooseTypeMultipleShowMore) {
        NSLog(@"点击了头部展开：%@" , sectionModel.headerModel.leftModel.title);
    }
}
- (void)filterMenuView:(CGXFilterMenuView *)generalView DidSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGXFilterMenuSectionModel *sectionModel = generalView.dataArray[indexPath.section];
    CGXFilterMenuItemModel *itemModel =sectionModel.itemList[indexPath.row];
    NSLog(@"点击了：%@" , itemModel.itemName);
}
/*     重置
 */
- (void)filterMenuView:(CGXFilterMenuView *)generalView ResetDataArray:(NSMutableArray<CGXFilterMenuSectionModel *> *)dataArray
{
    NSLog(@"点击了重置:%@" , dataArray);
    for (int i = 0; i<dataArray.count; i++) {
        CGXFilterMenuSectionModel *model = dataArray[i];
        if (model.style == CGXFilterMenuSectionModelStyleScopepop || model.style == CGXFilterMenuSectionModelStyleScopeWrite) {
            
            for (int j = 0; j<model.itemList.count; j++) {
                CGXFilterMenuItemModel *itetModel = model.itemList[j];
                itetModel.itemName = @",至,";
            }
        }
        if (model.style == CGXFilterMenuSectionModelStyleText) {
            for (int j = 0; j<model.itemList.count; j++) {
                CGXFilterMenuItemModel *itetModel = model.itemList[j];
                itetModel.isSelected = NO;
            }
        }
    }
    [generalView updateResetAll];
}
/*     确定
 */
- (void)filterMenuView:(CGXFilterMenuView *)generalView SureDataArray:(NSMutableArray<CGXFilterMenuSectionModel *> *)dataArray
{
    NSLog(@"点击了确定:%@" , dataArray);
    
    
}
@end
