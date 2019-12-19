//
//  CGXFilterMenuView.m
//  CGXFilterMenuViewOC-Example
//
//  Created by CGX on 2019/09/01.
//  Copyright © 2019 CGX. All rights reserved.
//

#import "CGXFilterMenuView.h"
#import "UIColor+CGXFilterCategory.h"
#import "UIImage+CGXFilterCategory.h"
#import "CGXFilterMenuBottomView.h"

#import "UIView+CGXFilterCategory.h"
///DEBUG打印日志
#ifdef DEBUG
# define DebugLog(FORMAT, ...) printf("[%s 行号:%d]:\n%s\n",__FUNCTION__,__LINE__,[[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String])
#else
# define DebugLog(FORMAT, ...)
#endif

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 80000 // 当前Xcode支持iOS8及以上
//屏幕宽
#define ScreenWidth ([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)]?[UIScreen mainScreen].nativeBounds.size.width/[UIScreen mainScreen].nativeScale:[UIScreen mainScreen].bounds.size.width)
//屏幕高
#define ScreenHeight ([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)]?[UIScreen mainScreen].nativeBounds.size.height/[UIScreen mainScreen].nativeScale:[UIScreen mainScreen].bounds.size.height)

#define ScreenSize ([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)]?CGSizeMake([UIScreen mainScreen].nativeBounds.size.width/[UIScreen mainScreen].nativeScale,[UIScreen mainScreen].nativeBounds.size.height/[UIScreen mainScreen].nativeScale):[UIScreen mainScreen].bounds.size)
#else

//屏幕宽
#define ScreenWidth   [UIScreen mainScreen].bounds.size.width
//屏幕高
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height

#define ScreenSize [UIScreen mainScreen].bounds.size

#endif

///NavBar高度
#define kStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
#define kNavBarHeight 44.0f
///导航栏高度
#define kTopHeight  (kStatusBarHeight + kNavBarHeight)
///tab安全区域
#define kSafeHeight    ((kStatusBarHeight>20) ? 34.0f : 0.0f)
///导航栏安全区域
#define kNavBarSafetyZone         ((kStatusBarHeight>20) ? 44.0f : 20.0f)
#define kTabBarHeight  ((kStatusBarHeight>20) ? (49.0f+34.0f) : 49.0f)
#define kVCHeight (ScreenHeight-kTopHeight-kTabBarHeight)
#define kSafeVCHeight (kStatusBarHeight>20?(ScreenHeight-kTopHeight-34):(ScreenHeight-kTopHeight))


#define iPhoneXR    ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhoneX    ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhoneXS    ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhoneXSMax    ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) : NO)

#define IsIphoneX (PhoneX || PhoneXS || PhoneXSMax || PhoneXR || Phone11 || Phone11Pro || Phone11ProMax) ? YES : NO


#define PhoneX    ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#define PhoneXR    ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) : NO)
#define PhoneXS    ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#define PhoneXSMax    ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) : NO)

#define Phone11 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) : NO)
#define Phone11Pro ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#define Phone11ProMax ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) : NO)


static inline BOOL isIphoneX() {
    BOOL result = NO;
    if (UIDevice.currentDevice.userInterfaceIdiom != UIUserInterfaceIdiomPhone) {
        return result;
    }
    if (@available(iOS 11.0, *)) {
        UIWindow *mainWindow = [[[UIApplication sharedApplication] delegate] window];
        if (mainWindow.safeAreaInsets.bottom > 0.0) {
            result = YES;
        }
    }
    return result;
}

@interface CGXFilterMenuView()<UICollectionViewDataSource,UICollectionViewDelegate,UIGestureRecognizerDelegate>

@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) UIView *alertView;
@property (nonatomic,strong) NSArray* subOptions;
@property (nonatomic,strong) CGXFilterMenuBottomView *bottomView;
@property (nonatomic,weak) UIView* toolBarView;
@property (nonatomic,assign) BOOL isCheckBox;

@property (nonatomic,strong,readwrite) NSMutableArray<CGXFilterMenuSectionModel *> *dataArray;

@end

@implementation CGXFilterMenuView

#pragma mark - 初始化
- (instancetype)creatDropMenuWithConfiguration: (UIView *)configuration {
    CGXFilterMenuView *dropMenu = [[CGXFilterMenuView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    //    dropMenu.configuration = configuration;
    return dropMenu;
}
- (instancetype)init {
    if (self == [super init]) {
        [self initializeData];
        [self initializeView];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        [self initializeData];
        [self initializeView];
    }
    return self;
}

- (void)initializeData
{
    self.dataArray = [NSMutableArray array];
}
- (void)initializeView
{
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    
    //使用代理方法解决子view冲突，此处不需要handler
    UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:nil];
    tapGesture.delegate = self;
    [self addGestureRecognizer:tapGesture];
    
    self.alertView = [[UIView alloc] init];
    self.alertView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.alertView];
    self.alertView.frame = CGRectMake(40, 0, CGRectGetWidth(self.frame)-40, CGRectGetHeight(self.frame));
    
    self.bottomView = [[CGXFilterMenuBottomView alloc] init];
    [self.alertView addSubview:self.bottomView];
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame)) collectionViewLayout:[self preferredFlowLayout]];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.showsHorizontalScrollIndicator = YES;
    self.collectionView.showsVerticalScrollIndicator = YES;
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class])];
    [self.collectionView registerClass:[CGXFilterMenuScopeCell class] forCellWithReuseIdentifier:NSStringFromClass([CGXFilterMenuScopeCell class])];
    [self.collectionView registerClass:[CGXFilterMenuTextCell class] forCellWithReuseIdentifier:NSStringFromClass([CGXFilterMenuTextCell class])];
    self.collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([UICollectionReusableView class])];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:NSStringFromClass([UICollectionReusableView class])];
    [self.collectionView registerClass:[CGXFilterMenuSectionHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([CGXFilterMenuSectionHeaderView class])];
    [self.collectionView registerClass:[CGXFilterMenuSectionFooterView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:NSStringFromClass([CGXFilterMenuSectionFooterView class])];
    if (@available(iOS 11.0, *)) {
        self.collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    [self.alertView addSubview:self.collectionView];
    
    self.bottomView.backgroundColor = [UIColor orangeColor];
    self.bottomView.frame = CGRectMake(0, CGRectGetHeight(self.alertView.frame)-50-kSafeHeight, CGRectGetWidth(self.alertView.frame), 50);
    self.collectionView.frame = CGRectMake(0, kNavBarSafetyZone, CGRectGetWidth(self.alertView.frame), CGRectGetHeight(self.alertView.frame)-CGRectGetHeight(self.bottomView.frame)-kNavBarSafetyZone-kSafeHeight);;
    

}

- (UICollectionViewFlowLayout *)preferredFlowLayout
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    return layout;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.dataArray.count;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    CGXFilterMenuSectionModel *sectionModel = self.dataArray[section];
    if (sectionModel.style == CGXFilterMenuSectionModelStyleText) {
        if (!sectionModel.headerModel.isShowAll) {
            return sectionModel.sectionShowNumber;
        }
    }
    return sectionModel.itemList.count;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
     CGXFilterMenuSectionModel *sectionModel = self.dataArray[section];
    return sectionModel.inset;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    CGXFilterMenuSectionModel *sectionModel = self.dataArray[section];
    return sectionModel.minimumLineSpacing;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    CGXFilterMenuSectionModel *sectionModel = self.dataArray[section];
    return sectionModel.minimumInteritemSpacing;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGXFilterMenuSectionModel *sectionModel = self.dataArray[indexPath.section];
    CGFloat spaceW = sectionModel.inset.left + sectionModel.inset.right;
    CGFloat width = collectionView.frame.size.width-spaceW;
    CGFloat height = sectionModel.height;
    switch (sectionModel.style) {
        case CGXFilterMenuSectionModelStyleText:
        {
            float aaaa = width-sectionModel.minimumInteritemSpacing * (sectionModel.sectionNumber - 1);
            width = aaaa / sectionModel.sectionNumber;
        }
            break;
        case CGXFilterMenuSectionModelStyleScopeWrite:
        {
            width = width;
        }
            break;
        case CGXFilterMenuSectionModelStyleScopepop:
        {
            width = width;
        }
            break;
        default:
            break;
    }
    return CGSizeMake(floor(width),height);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    CGXFilterMenuSectionModel *sectionModel = self.dataArray[section];
    return CGSizeMake(collectionView.frame.size.width, sectionModel.headerModel.headerHeight);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    CGXFilterMenuSectionModel *sectionModel = self.dataArray[section];
    return CGSizeMake(collectionView.frame.size.width, sectionModel.footerModel.footerHeight);
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    CGXFilterMenuSectionModel *sectionModel = self.dataArray[indexPath.section];
    
    if (kind == UICollectionElementKindSectionHeader) {
        CGXFilterMenuSectionHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:NSStringFromClass([CGXFilterMenuSectionHeaderView class]) forIndexPath:indexPath];
        headerView.backgroundColor = sectionModel.headerModel.bgColor;
        __weak typeof(self) weakSelf = self;
        [headerView addFilterCategoryTapGestureRecognizerWithDelegate:headerView Block:^(NSInteger tag) {
            [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
            if (sectionModel.headerClickType == CGXFilterMenuSectionModelChooseTypeMultipleShowMore) {
                
                if (sectionModel.sectionShowNumber<sectionModel.itemList.count) {
                    sectionModel.headerModel.isShowAll = !sectionModel.headerModel.isShowAll;
                    [weakSelf.dataArray replaceObjectAtIndex:indexPath.section withObject:sectionModel];
                    NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:indexPath.section];
                    [weakSelf.collectionView performBatchUpdates:^{
                        [weakSelf.collectionView reloadSections:indexSet];
                    } completion:nil];
                }
                
            }else if (sectionModel.headerClickType == CGXFilterMenuSectionModelChooseTypeMultiplePop){
                if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(filterMenuView:TapHeaderInSection:)]) {
                    [weakSelf.delegate filterMenuView:weakSelf TapHeaderInSection:indexPath.section];
                }
            }
        }];
        
        BOOL isIndicator = NO;
        if (sectionModel.headerClickType == CGXFilterMenuSectionModelHeaderClickTypeNode) {
            isIndicator = YES;
        }
//        if (sectionModel.style == CGXFilterMenuSectionModelStyleText) {
//            if (sectionModel.sectionShowNumber < sectionModel.itemList.count) {
//                isIndicator = YES;
//            }
//        }
        [headerView updateSectionheaderViewWithModel:sectionModel IsIndicator:isIndicator];
        return headerView;
    } else {
        CGXFilterMenuSectionFooterView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:NSStringFromClass([CGXFilterMenuSectionFooterView class]) forIndexPath:indexPath];
        footerView.backgroundColor =  sectionModel.footerModel.bgColor;;
        return footerView;
    }
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGXFilterMenuSectionModel *sectionModel = self.dataArray[indexPath.section];
    CGXFilterMenuItemModel *itemModel =sectionModel.itemList[indexPath.row];
    switch (sectionModel.style) {
        case CGXFilterMenuSectionModelStyleText:
        {
            CGXFilterMenuTextCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([CGXFilterMenuTextCell class]) forIndexPath:indexPath];
            [cell updateWithModel:itemModel];
            return cell;
        }
            break;
        case CGXFilterMenuSectionModelStyleScopeWrite:
        {
            CGXFilterMenuScopeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([CGXFilterMenuScopeCell class]) forIndexPath:indexPath];
            cell.isWrite = YES;
            [cell updateWithModel:itemModel];
            __weak typeof(self) weakSelf = self;
            cell.textFieldBlock = ^(NSString * _Nonnull text, BOOL isMax) {
                NSArray *itemArray = [itemModel.itemName componentsSeparatedByString:@","];
                NSAssert(itemArray.count == 3, @"范围类型不对,model.itemName格式：xx,xx,xx");
                NSString *minStr = itemArray[0];
                NSString *middleStr = itemArray[1];
                NSString *maxStr = itemArray[2];
                if (isMax) {
                    maxStr = text;
                } else{
                    minStr = text;
                }
                itemModel.itemName = [NSString stringWithFormat:@"%@,%@,%@",minStr,middleStr,maxStr];
                if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(filterMenuView:AtIndexPath:ScopeMaxText:ScopeMinText:)]) {
                    [weakSelf.delegate filterMenuView:weakSelf AtIndexPath:indexPath ScopeMaxText:maxStr ScopeMinText:minStr];
                }
            };
            return cell;
        }
            break;
        case CGXFilterMenuSectionModelStyleScopepop:
        {
            CGXFilterMenuScopeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([CGXFilterMenuScopeCell class]) forIndexPath:indexPath];
            cell.isWrite = NO;
            [cell updateWithModel:itemModel];
            __weak typeof(self) weakSelf = self;
            cell.textFieldClickBlock = ^(NSString * _Nonnull text, BOOL isMax) {
                if (isMax) {
                    if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(filterMenuView:AtIndexPath:PopMaxText:)]) {
                        [weakSelf.delegate filterMenuView:weakSelf AtIndexPath:indexPath PopMaxText:text];
                    }
                } else{
                    if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(filterMenuView:AtIndexPath:PopeMinText:)]) {
                        [weakSelf.delegate filterMenuView:weakSelf AtIndexPath:indexPath PopeMinText:text];
                    }
                }
            };
            return cell;
            
        }
            break;
            
        default:
            break;
    }
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class]) forIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor colorWithWhite:0.93 alpha:1];
    return cell;
    
}
// CollectionView分区标题即将展示
- (void)collectionView:(UICollectionView *)collectionView willDisplaySupplementaryView:(UICollectionReusableView *)view forElementKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath
{
    view.layer.zPosition = 0.0;
}
// CollectionView分区标题展示结束
- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingSupplementaryView:(nonnull UICollectionReusableView *)view forElementOfKind:(nonnull NSString *)elementKind atIndexPath:(nonnull NSIndexPath *)indexPath
{
    
}
#pragma mark - cell的点击事件
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
        [self tapMisskeyboard];
    CGXFilterMenuSectionModel *sectionModel = self.dataArray[indexPath.section];
    if (sectionModel.style ==CGXFilterMenuSectionModelStyleText) {
        if (sectionModel.chooseType == CGXFilterMenuSectionModelChooseTypeSingle) {
            
            for (int i = 0; i<sectionModel.itemList.count; i++) {
                CGXFilterMenuItemModel *itemModel =sectionModel.itemList[i];
                if (i == indexPath.row) {
                    itemModel.isSelected = YES;
                    sectionModel.headerModel.rightModel.title = itemModel.itemName;
                } else{
                    itemModel.isSelected = NO;
                }
            }
            NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:indexPath.section];
            [self.collectionView performBatchUpdates:^{
                [self.collectionView reloadSections:indexSet];
            } completion:nil];
        }
        
        if (sectionModel.chooseType == CGXFilterMenuSectionModelChooseTypeMultiple) {//多选
            for (int i = 0; i<sectionModel.itemList.count; i++) {
                CGXFilterMenuItemModel *itemModel =sectionModel.itemList[i];
                if (i == indexPath.row) {
                    itemModel.isSelected = !itemModel.isSelected;
                    if (itemModel.isSelected) {
                        if (![sectionModel.selectedItemList containsObject:itemModel]) {
                            [sectionModel.selectedItemList addObject:itemModel];
                        }
                    } else{
                        if ([sectionModel.selectedItemList containsObject:itemModel]) {
                            [sectionModel.selectedItemList removeObject:itemModel];
                        }
                    }
                }
            }
            NSMutableArray *detailsArr = [NSMutableArray array];
            for (CGXFilterMenuItemModel *itemModel in sectionModel.selectedItemList) {
                [detailsArr addObject:itemModel.itemName];
            }
            if (detailsArr.count>0) {
                NSLog(@"%@" ,[detailsArr componentsJoinedByString:@","]);
                sectionModel.headerModel.rightModel.title = [detailsArr componentsJoinedByString:@","];
            }
            NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:indexPath.section];
            [self.collectionView performBatchUpdates:^{
                [self.collectionView reloadSections:indexSet];
            } completion:nil];
        }
        if (self.delegate && [self.delegate respondsToSelector:@selector(filterMenuView:DidSelectItemAtIndexPath:)]) {
            [self.delegate filterMenuView:self DidSelectItemAtIndexPath:indexPath];
        }
    }
    

}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
}
- (void)didClickResetBtn:(UIButton *)btn
{
    
}
- (void)didClickFinishBtn:(UIButton *)btn
{
    
}
- (void)updateResetAll
{
    
    [self.collectionView reloadData];
}
- (void)updateWithDataArray:(NSMutableArray *)dataArray
{
    [self.dataArray removeAllObjects];
    [self.dataArray addObjectsFromArray:dataArray];
    [self.collectionView reloadData];
}
/*代理方法解决maskView和子view的touch冲突*/
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    if ([touch.view isDescendantOfView:self.collectionView]) {
        return NO;
    }
    if ([touch.view isKindOfClass:[CGXFilterMenuView class]] ){
        [self dismissWithAnimation:YES];
        return NO;
    }
    return YES;
}
#pragma mark - 弹出视图方法
- (void)showWithAnimation:(BOOL)animation {
    //1. 获取当前应用的主窗口
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    [keyWindow addSubview:self];
}
#pragma mark - 关闭视图方法
- (void)dismissWithAnimation:(BOOL)animation {
    [self removeFromSuperview];
}
- (void)tapMisskeyboard
{
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
