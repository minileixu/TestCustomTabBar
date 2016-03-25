//
//  MyUtil.h
//  TestCustomTabBar
//
//  Created by silver on 16/3/25.
//  Copyright © 2016年 LeiXu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface MyUtil : NSObject
+ (UILabel *)createLabelTitle:(NSString *)title textColor:(UIColor *)textColor font:(UIFont *)font textAlignment:(NSTextAlignment)textAlignment numberOfLines:(NSInteger)numberOfLines;

+ (UILabel *)createLabelTitle:(NSString *)title numberOfLines:(NSInteger)numberOfLines;

+ (UIImageView *)createImageView:(NSString *)imageName;


+ (UIButton *)createBtnTitle:(NSString *)title imageName:(NSString *)imageName sImageName:(NSString *)sImageName target:(id)target action:(SEL)action;


+ (UITextField *)createTextField:(NSString *)text placeHolder:(NSString *)placeHolder;
@end
