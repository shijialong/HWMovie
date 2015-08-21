//
//  PhotoViewController.m
//  HWMovie
//
//  Created by huiwen on 15/7/23.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import "PhotoViewController.h"
#import "PhotoCollectionView.h"
#import "common.h"

@interface PhotoViewController ()

@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _createNavigation];
    [self _createCollectionView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hideNav) name:@"HideNavigationBarNotification" object:nil];
    // Do any additional setup after loading the view.
}

- (void)hideNav {
    BOOL isHidden = self.navigationController.navigationBar.isHidden;
    [self.navigationController setNavigationBarHidden:!isHidden animated:YES];
}


- (void)_createNavigation {
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancelAction)];
}

- (void)cancelAction {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)_createCollectionView {
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(kwidth, kheight);
    
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    layout.minimumLineSpacing = 30;
    
    _CollectionView = [[PhotoCollectionView alloc] initWithFrame:CGRectMake(0, 0, kwidth+30, kheight) collectionViewLayout:layout];
    
    
    _CollectionView.pagingEnabled = YES;
    
    
    
    [self.view addSubview:_CollectionView];
    

}



- (void)setImageUrlArray:(NSArray *)imageUrlArray {
    _imageUrlArray = imageUrlArray;
    _CollectionView.imageUrlArray = _imageUrlArray;
    
}


- (void)setCurrentIndex:(NSInteger)currentIndex {
    _currentIndex = currentIndex;
    
    _CollectionView.contentOffset = CGPointMake(_currentIndex*(kwidth+30), 0);
    
    
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
