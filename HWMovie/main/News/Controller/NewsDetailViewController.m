//
//  NewsDetailViewController.m
//  HWMovie
//
//  Created by huiwen on 15/7/27.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import "NewsDetailViewController.h"

@interface NewsDetailViewController ()

@end

@implementation NewsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"news.html" ofType:nil];
    
    NSString *htmlStr = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    
    [webView loadHTMLString:htmlStr baseURL:nil];
    [self.view addSubview:webView];
    
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
