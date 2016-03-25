//
//  MainTabBarController.m
//  TestCustomTabBar
//
//  Created by silver on 16/3/25.
//  Copyright © 2016年 LeiXu. All rights reserved.
//

#import "MainTabBarController.h"
#import "Masonry.h"
#import "MyUtil.h"
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

@interface MainTabBarController ()
//自定制tabBar背景视图
@property (nonatomic,strong)UIView *bgView;

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //创建视图控制器
    [self createViewControllers];
    
    //自定制tabbar
    self.tabBar.hidden = YES;
    [self createMyTabBar];
    
    
}

//创建视图控制器
- (void)createViewControllers
{
    
    NSArray *nameArray = @[@"RecipeViewController",@"LikeViewController",@"FoodViewController",@"MineViewController"];
    
    NSMutableArray *ctrlArray = [NSMutableArray array];
    for (int i=0; i<nameArray.count; i++) {
        
        Class cls = NSClassFromString(nameArray[i]);
        
        UIViewController *vc = [[cls alloc] init];
        
        UINavigationController *navCtrl = [[UINavigationController alloc] initWithRootViewController:vc];
        
        [ctrlArray addObject:navCtrl];
    }
    
    self.viewControllers = ctrlArray;
    
}


//自定制tabbar
- (void)createMyTabBar
{
    //tabBar背景视图
    self.bgView = [[UIView alloc] init];
    self.bgView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.bgView];
    
    //约束
    WS(ws)
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view);
        make.right.equalTo(ws.view);
        make.height.mas_equalTo(49);
        make.bottom.equalTo(ws.view);
    }];
    
    
    //添加按钮
    NSArray *titleArray = @[@"食谱",@"喜欢",@"食课",@"我的"];
    NSArray *imageArray = @[@"食谱A",@"喜欢A",@"食课A",@"我的A"];
    NSArray *selectImageArray = @[@"食谱B",@"喜欢B",@"食课B",@"我的B"];
    
    CGFloat w = self.view.bounds.size.width/4;
    for (int i=0; i<titleArray.count; i++) {
        
        //按钮
        NSString *imageName = imageArray[i];
        NSString *sImageName = selectImageArray[i];
        
        
        UIButton *btn = [MyUtil createBtnTitle:nil imageName:imageName sImageName:sImageName target:self action:@selector(clickBtn:)];
        btn.tag = 300+i;
        [self.bgView addSubview:btn];
        
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(ws.bgView).with.offset(i*w);
            make.top.equalTo(ws.bgView);
            make.width.mas_equalTo(w);
            make.height.equalTo(ws.bgView);
        }];
        
        //文字
        NSString *title = titleArray[i];
        UILabel *label = [MyUtil createLabelTitle:title textColor:[UIColor grayColor] font:[UIFont systemFontOfSize:12] textAlignment:NSTextAlignmentCenter numberOfLines:1];
        label.tag = 400;
        [btn addSubview:label];
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(btn);
            make.right.equalTo(btn);
            make.top.equalTo(btn).with.offset(30);
            make.bottom.equalTo(btn).with.offset(0);
        }];
        
        
        if (i == 0) {
            btn.selected = YES;
            label.textColor = [UIColor brownColor];
        }else{
            label.textColor = [UIColor grayColor];
        }
        
        
    }
    
    
    
}


- (void)clickBtn:(UIButton *)btn
{
    
    //取消前面的选择
    UIButton *lastBtn = (UIButton *)[self.bgView viewWithTag:self.selectedIndex+300];
    UILabel *lastLabel = (UILabel *)[lastBtn viewWithTag:400];
    lastBtn.selected = NO;
    lastLabel.textColor = [UIColor grayColor];
    
    //选中当前的按钮
    UILabel *curLabel =(UILabel *)[btn viewWithTag:400];
    btn.selected = YES;
    curLabel.textColor = [UIColor brownColor];
    
    NSInteger index = btn.tag-300;
    self.selectedIndex = index;
    
}

-(void)showTabBar
{
    self.bgView.hidden = NO;
}

-(void)hideTabBar
{
    self.bgView.hidden = YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
