//
//  GuideViewController.m
//  HWMovie
//
//  Created by huiwen on 15/7/30.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import "GuideViewController.h"
#import "common.h"
#import "LaunchViewController.h"

@interface GuideViewController ()

@end

@implementation GuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _createSubView];
    // Do any additional setup after loading the view from its nib.
}


- (void)_createSubView {
    for (NSInteger i = 0; i < 5; i ++) {
        NSString *imageName = [NSString stringWithFormat:@"guide%ld@2x.png",i +1];
        NSString *pageImageName = [NSString stringWithFormat:@"guideProgress%ld@2x.png",i +1];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(kwidth *i, 0, kwidth, kheight)];
        [imageView setImage:[UIImage imageNamed:imageName]];
        [_scrollView addSubview:imageView];
        
        UIImageView *pageImageView = [[UIImageView alloc] initWithFrame:CGRectMake((kwidth-173)/2+kwidth *i, kheight -50, 173, 26)];
        [pageImageView setImage:[UIImage imageNamed:pageImageName]];
        
        [_scrollView addSubview:pageImageView];
    }
    
    _scrollView.delegate = self;
    _scrollView.contentSize = CGSizeMake(5*kwidth, kheight);
    _scrollView.pagingEnabled = YES;
}
- (IBAction)btnAction:(id)sender {
    LaunchViewController *launch = [[LaunchViewController alloc] init];
    self.view.window.rootViewController = launch;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger index = scrollView.contentOffset.x/kwidth;
    if (index == 4) {
        _btn.hidden = NO;
    }else {
        _btn.hidden = YES;
    }
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
