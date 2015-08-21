//
//  BaesNavigationController.m
//  HWMovie
//
//  Created by huiwen on 15/7/17.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import "BaesNavigationController.h"

@interface BaesNavigationController ()

@end

@implementation BaesNavigationController

//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        self.title = @"电影";
//    }
//    return self;
//}


    

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationBar.translucent = YES;
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bg_all-64"] forBarMetrics:UIBarMetricsDefault];
    
    // Do any additional setup after loading the view.
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
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
