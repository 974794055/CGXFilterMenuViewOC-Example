//
//  CGXFilterMenuScopeCell.m
//  CGXFilterMenuViewOC-Example
//
//  Created by CGX on 2019/09/01.
//  Copyright © 2019 CGX. All rights reserved.
//

#import "CGXFilterMenuScopeCell.h"

@interface CGXFilterMenuScopeCell()

@property (nonatomic,strong) UITextField *minTextField;
@property (nonatomic,strong) UITextField *maxTextField;
//中间显示文字
@property (nonatomic,strong) UILabel *titleLabel;

@property (nonatomic,strong) UIView *lineView;
@end

@implementation CGXFilterMenuScopeCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.minTextField = [[UITextField alloc] init];
        [self.contentView addSubview:self.minTextField];
        self.minTextField.delegate = self;
        self.minTextField.backgroundColor = [UIColor whiteColor];
        self.minTextField.textColor = [UIColor blackColor];
        self.minTextField.font = [UIFont systemFontOfSize:14];
        //文字上下居中
        self.minTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        //文字左右居中
        self.minTextField.textAlignment = NSTextAlignmentCenter;
        
        self.minTextField.keyboardType = UIKeyboardTypeDefault;
        self.minTextField.returnKeyType = UIReturnKeyDefault;
        self.minTextField.layer.masksToBounds = YES;
        self.minTextField.clipsToBounds = YES;
       
        self.minTextField.leftViewMode = UITextFieldViewModeAlways;
        UIView *leftView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 0)];
        leftView1.backgroundColor = self.minTextField.backgroundColor;
        self.minTextField .leftView = leftView1;
        self.minTextField.rightViewMode = UITextFieldViewModeAlways;
        UIView *rightView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 0)];
        rightView1.backgroundColor =  self.minTextField.backgroundColor;
        self.minTextField.rightView = rightView1;
        
        self.maxTextField = [[UITextField alloc] init];
        [self.contentView addSubview:self.maxTextField];
        self.maxTextField.delegate = self;
        self.maxTextField.backgroundColor = [UIColor whiteColor];
        self.maxTextField.textColor = [UIColor blackColor];
        self.maxTextField.font = [UIFont systemFontOfSize:14];
        //文字上下居中
        self.maxTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        //文字左右居中
        self.maxTextField.textAlignment = NSTextAlignmentCenter;
        
        self.maxTextField.keyboardType = UIKeyboardTypeDefault;
        self.maxTextField.returnKeyType = UIReturnKeyDefault;
        self.maxTextField.layer.masksToBounds = YES;
        self.maxTextField.clipsToBounds = YES;
       
        UIView *leftView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 0)];
        leftView2.backgroundColor = self.minTextField.backgroundColor;
        self.maxTextField .leftView = leftView2;
        self.maxTextField.rightViewMode = UITextFieldViewModeAlways;
        UIView *rightView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 0)];
        rightView2.backgroundColor =  self.minTextField.backgroundColor;
        self.maxTextField.rightView = rightView2;
        
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        self.titleLabel.textColor = [UIColor blackColor];
        [self.contentView addSubview:self.titleLabel];
        self.titleLabel.numberOfLines = 0;
        
        [self.minTextField  addTarget:self action:@selector(textFieldTextChange:) forControlEvents:UIControlEventEditingChanged];
        [self.maxTextField  addTarget:self action:@selector(textFieldTextChange:) forControlEvents:UIControlEventEditingChanged];
        
        
        self.minTextField.translatesAutoresizingMaskIntoConstraints = NO;
        self.maxTextField.translatesAutoresizingMaskIntoConstraints = NO;
        self.titleLabel.preferredMaxLayoutWidth = 80;
         [self.titleLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:self.minTextField
                                                         attribute:NSLayoutAttributeTop
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeTop
                                                        multiplier:1.
                                                          constant:0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:self.minTextField
                                                         attribute:NSLayoutAttributeBottom
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeBottom
                                                        multiplier:1
                                                          constant:0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:self.minTextField
                                                         attribute:NSLayoutAttributeLeft
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeLeft
                                                        multiplier:1.
                                                          constant:20]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:self.minTextField
                                                         attribute:NSLayoutAttributeRight
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self.maxTextField
                                                         attribute:NSLayoutAttributeLeft
                                                        multiplier:1.
                                                          constant:-20]];
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:self.maxTextField
                                                         attribute:NSLayoutAttributeTop
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeTop
                                                        multiplier:1.
                                                          constant:0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:self.maxTextField
                                                         attribute:NSLayoutAttributeBottom
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeBottom
                                                        multiplier:1.
                                                          constant:0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:self.maxTextField
                                                         attribute:NSLayoutAttributeRight
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeRight
                                                        multiplier:1.
                                                          constant:-20]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:self.maxTextField
                                                         attribute:NSLayoutAttributeLeft
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self.minTextField
                                                         attribute:NSLayoutAttributeRight
                                                        multiplier:1.
                                                          constant:20]];
        
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:self.maxTextField
                                                         attribute:NSLayoutAttributeWidth
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self.minTextField
                                                         attribute:NSLayoutAttributeWidth
                                                        multiplier:1
                                                          constant:0]];
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:self.maxTextField
                                                         attribute:NSLayoutAttributeHeight
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self.minTextField
                                                         attribute:NSLayoutAttributeHeight
                                                        multiplier:1
                                                          constant:0]];
        
 

        [self.minTextField.superview layoutIfNeeded];
         [self.maxTextField.superview layoutIfNeeded];
        self.minTextField.layer.cornerRadius = CGRectGetHeight(self.minTextField.bounds)/2.0;
        self.maxTextField.layer.cornerRadius = CGRectGetHeight(self.maxTextField.bounds)/2.0;
    }
    return self;
}
-(void)textFieldTextChange:(UITextField *)textField
{
        if (textField == self.minTextField) {
            if (self.textFieldBlock) {
                self.textFieldBlock(textField.text,NO);
            }
        }
        if (textField == self.maxTextField) {
            if (self.textFieldBlock) {
                self.textFieldBlock(textField.text,YES);
            }
        }
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if ([string isEqualToString:@"\n"]) {
        return NO;
    }
    if ([string isEqualToString:@" "]) {
        return NO;
    }
    NSString *tem = [[string componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]componentsJoinedByString:@""];
    if (![string isEqualToString:tem]) {
        return NO;
    }
    if ([string isEqualToString:@""]) {
        return YES;
    }
    //    if (range.location>= 50){
    //        return NO;
    //    }
    return YES;
    
}
//按下Done按钮的调用方法，我们让键盘消失
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    if (!self.isWrite) {
        [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
    }
    return YES;
}
-(void)textFieldDidBeginEditing:(UITextField*)textField
{
    if (!self.isWrite) {
        [textField resignFirstResponder];
        if (textField == self.minTextField) {
            if (self.textFieldClickBlock) {
                self.textFieldClickBlock(textField.text,NO);
            }
        }
        if (textField == self.maxTextField) {
            if (self.textFieldClickBlock) {
                self.textFieldClickBlock(textField.text,YES);
            }
        }
    }
}

- (void)updateWithModel:(CGXFilterMenuItemModel *)model
{
    
    NSArray *itemArray = [model.itemName componentsSeparatedByString:@","];
    NSArray *placeArray = [model.itemplaceholderName componentsSeparatedByString:@","];
    
    NSAssert(itemArray.count == 3, @"范围类型不对,model.itemName格式：xx,xx,xx");
    NSAssert(placeArray.count == 3, @"范围类型不对,model.itemName格式：xx,xx,xx");
    
    self.titleLabel.text = itemArray[1];;
    
    self.minTextField.text = itemArray[0];
    self.maxTextField.text = itemArray[2];
    self.minTextField.placeholder =placeArray[0];
    self.maxTextField.placeholder = placeArray[2];
    
    self.minTextField.textColor = model.selectColor;
    self.minTextField.font = model.itemSelectFont;
    self.maxTextField.textColor =model.selectColor;
    self.maxTextField.font = model.itemSelectFont;
    
     self.minTextField.keyboardType = model.keyboardTypeDefault;
      self.maxTextField.keyboardType = model.keyboardTypeDefault;
    
     self.minTextField.backgroundColor = model.itemBgColor;
     self.maxTextField.backgroundColor = model.itemBgColor;;

}
@end
