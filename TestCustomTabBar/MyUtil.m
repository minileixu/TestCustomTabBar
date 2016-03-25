
//
//  MyUtil.m
//  TestCustomTabBar
//
//  Created by silver on 16/3/25.
//  Copyright © 2016年 LeiXu. All rights reserved.
//

#import "MyUtil.h"

@implementation MyUtil
+(UILabel *)createLabelTitle:(NSString *)title textColor:(UIColor *)textColor font:(UIFont *)font textAlignment:(NSTextAlignment)textAlignment numberOfLines:(NSInteger)numberOfLines
{
    UILabel *label = [[UILabel alloc] init];
    label.text = title;
    label.textColor = textColor;
    label.font = font;
    label.textAlignment = textAlignment;
    label.numberOfLines = numberOfLines;
    return label;
}


+(UILabel *)createLabelTitle:(NSString *)title numberOfLines:(NSInteger)numberOfLines
{
    return [self createLabelTitle:title textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:17] textAlignment:NSTextAlignmentLeft numberOfLines:numberOfLines];
}


+(UIImageView *)createImageView:(NSString *)imageName
{
    UIImageView *imgView = [[UIImageView alloc] init];
    imgView.image = [UIImage imageNamed:imageName];
    
    return imgView;
}

+(UIButton *)createBtnTitle:(NSString *)title imageName:(NSString *)imageName sImageName:(NSString *)sImageName target:(id)target action:(SEL)action
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:sImageName] forState:UIControlStateSelected];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return btn;
    
}


+(UITextField *)createTextField:(NSString *)text placeHolder:(NSString *)placeHolder
{
    UITextField *textField = [[UITextField alloc] init];
    textField.placeholder = placeHolder;
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.text = text;
    return textField;
}

@end
