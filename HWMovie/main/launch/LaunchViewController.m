//
//  LaunchViewController.m
//  HWMovie
//
//  Created by huiwen on 15/7/29.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import "LaunchViewController.h"
#import "common.h"
#import "UIViewExt.h"
#import "MainTabBarController.h"


//haha
@interface LaunchViewController ()
{
    NSMutableArray *imageViewArray;
    
    NSInteger index;
}
@end

@implementation LaunchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *image = [UIImage imageNamed:@"Default"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = self.view.bounds;
    [self.view addSubview:imageView];
    
    [self _createImageView];
    
    [self startAnimation];
    // Do any additional setup after loading the view.
}


- (void)_createImageView {
    NSInteger count = 24;
    CGFloat width = kwidth/4;
    CGFloat height = kheight/6;
    
    CGFloat x = 0;
    CGFloat y = 0;
    
    imageViewArray = [NSMutableArray array];
    
    for (NSInteger i = 0;i<count; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
        
        imageView.alpha = 0;
        NSString *imageName = [NSString stringWithFormat:@"%ld.png",i+1];
        imageView.image = [UIImage imageNamed:imageName];
        [self.view addSubview:imageView];
        
        [imageViewArray addObject:imageView];
        
        if (i<=3) {
            x = i * width;
            y = 0;
        }else if (i <= 8) {
            x = kwidth - width;
            y = (i - 3) * height;
        }else if (i <= 11) {
            y = kheight - height;
            x = kwidth - (i -7) *width;
        }else if (i <=15) {
            x = 0;
            y = kheight - (i - 10) * height;
        }else if (i <= 17) {
            y = height;
            x = (i - 15)*width;
        }else if (i <= 20) {
            x = 2*width;
            y = (i-16) *height;
        }else if(i <= 23) {
            x = width;
            y = kheight - (i - 19)*height;
        }
        
        imageView.origin = CGPointMake(x, y);
    }
}

- (void)startAnimation {
    if (index >= imageViewArray.count) {
        
        UIWindow *window = self.view.window;
        
        MainTabBarController *mainCtrl = [[MainTabBarController alloc] init];
//        mainCtrl.view.transform = CGAffineTransformMakeScale(.2, .2);
//        [UIView animateWithDuration:0.1 animations:<#^(void)animations#>]
        window.rootViewController = mainCtrl;
    }
    
    UIImageView *imageView = imageViewArray[index];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    imageView.alpha = 1;
    [UIView commitAnimations];
    
    index ++;
    
    [self performSelector:@selector(startAnimation) withObject:nil afterDelay:.5];
    
}

- (BOOL)prefersStatusBarHidden {
    return YES;
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
