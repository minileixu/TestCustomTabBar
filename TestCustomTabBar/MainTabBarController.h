//
//  MainTabBarController.h
//  TestCustomTabBar
//
//  Created by silver on 16/3/25.
//  Copyright © 2016年 LeiXu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainTabBarController : UITabBarController
{
    //自定制tabBar背景视图
    UIView *_bgView;
}
//显示tabBar
- (void)showTabBar;
//隐藏tabBar
- (void)hideTabBar;
@end
