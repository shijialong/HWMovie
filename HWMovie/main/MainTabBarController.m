//
//  MainTabBarController.m
//  HWMovie
//
//  Created by huiwen on 15/7/17.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import "MainTabBarController.h"
#import "MovieViewController.h"
#import "NewsViewController.h"
#import "TopViewController.h"
#import "CinemaViewController.h"
#import "MoreViewController.h"
#import "HWButton.h"
#import "BaesNavigationController.h"
#import "BaseViewController.h"


@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)_createViewControllers {
    MovieViewController *vc1 = [[MovieViewController alloc] init];

    NewsViewController *vc2 = [[NewsViewController alloc] init];

    
    TopViewController *vc3 = [[TopViewController alloc] init];

    CinemaViewController *vc4 = [[CinemaViewController alloc] init];

    MoreViewController *vc5 = [[MoreViewController alloc] init];

    
    NSArray *vcArray = @[vc1,vc2,vc3,vc4,vc5];
    
    NSMutableArray *navArray = [[NSMutableArray alloc] init];
    for (int i=0; i<5; i++) {
        BaesNavigationController *nav = [[BaesNavigationController alloc] initWithRootViewController:vcArray[i]];
//        [nav.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bg_all"] forBarMetrics:UIBarMetricsDefault];
        [navArray addObject:nav];
    }
    
    self.viewControllers = navArray;
}



- (void)_setTabBarView {
    
    //01 移除tabBar 的子视图
    for (UIView *subView in self.tabBar.subviews) {
//        NSStringFromClass(NSStringFromClass(<#__unsafe_unretained Class aClass#>)
//        NSClassFromString(<#NSString *aClassName#>)
        
        Class cls = NSClassFromString(@"UITabBarButton");
        if ([subView isKindOfClass:cls]) {
            [subView removeFromSuperview];
            
        }
    }
    
    //02 设置背景
    
    NSArray *imageName = @[@"movie_home",@"msg_select_new",@"start_top250",@"icon_cinema",@"more_setting"];
    NSArray *titles = @[@"电影",@"新闻",@"Top250",@"影院",@"更多",];
    
    CGFloat width = CGRectGetWidth(self.tabBar.frame)/5;
    CGFloat height = CGRectGetHeight(self.tabBar.frame);
    self.tabBar.backgroundImage = [UIImage imageNamed:@"tab_bg_all"];
    
    
    //选中图片
    _selectedImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    _selectedImageView.image = [UIImage imageNamed:@"selectTabbar_bg_all1"];
    
    [self.tabBar addSubview:_selectedImageView];
    
    for (int i = 0;i < 5;i++) {
        
        CGRect frame = CGRectMake(i*width, 0, width, height);
        HWButton *button = [[HWButton alloc] initWithFrame:frame withImageName:imageName[i] withTitle:titles[i]];
        
        button.tag = i;
        [button addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.tabBar addSubview:button];
    
    
    }
    
//    for (int i = 0;i < 5;i++) {
//        
//        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(i*width, 0, width, height)];
//        [button setTitle:titles[i] forState:UIControlStateNormal];
//        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//        button.titleLabel.font = [UIFont systemFontOfSize:11];
//        
//        UIImage *btnImage = [UIImage imageNamed:imageName[i]];
//
//        [button setImage:btnImage forState:UIControlStateNormal];
//        //跳
//        button.titleEdgeInsets = UIEdgeInsetsMake(30, -20, 0, 0);
//        button.imageEdgeInsets = UIEdgeInsetsMake(-10, 20, 0, 0);
//                                  
//
//        [self.tabBar addSubview:button];
//        
//    }
}


- (void)btnAction:(HWButton *)button {
    NSInteger index = button.tag;
    self.selectedIndex = index;
    //设置移动的动画
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:.3];
    
    _selectedImageView.center = button.center;
    [UIView commitAnimations];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _createViewControllers];
    [self _setTabBarView];
    // Do any additional setup after loading the view.
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
