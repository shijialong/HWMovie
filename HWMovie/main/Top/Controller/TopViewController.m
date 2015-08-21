//
//  TopViewController.m
//  HWMovie
//
//  Created by huiwen on 15/7/17.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import "TopViewController.h"
#import "BaesNavigationController.h"
#import "BaseViewController.h"
#import "TopModal.h"
#import "TopCollectionViewCell.h"
#import "common.h"
#import "MovieDetailViewController.h"


@interface TopViewController ()

@end

@implementation TopViewController


#pragma mark - MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Top250";
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self _initData];
    [self _loadData];
    [self _createCollectionView];
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - LoadData


- (void)_initData {
    _topModalArray = [[NSMutableArray alloc] init];
}


- (void)_loadData {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"top250.json" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    
    
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    NSArray *subjects = [dic objectForKey:@"subjects"];
    
    for (NSDictionary *dic in subjects) {
        TopModal *modal = [[TopModal alloc] init];
        
        [modal setValuesForKeysWithDictionary:dic];
        
        [_topModalArray addObject:modal];
    }

}




#pragma mark - CreateSubViews

- (void)_createCollectionView {
    
    //创建布局对象
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    layout.minimumInteritemSpacing = 10;
    layout.minimumLineSpacing = 30;
    
    layout.itemSize = CGSizeMake((kwidth-40)/3, (kwidth-40)/3*1.5);
    
    //创建collectionView
    
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    
    
    
    UINib *nib = [UINib nibWithNibName:@"TopCollectionViewCell" bundle:[NSBundle mainBundle]];
    [_collectionView registerNib:nib forCellWithReuseIdentifier:@"cell"];
    
    
    [self.view addSubview:_collectionView];
}

#pragma mark - UICollectionView Delegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    
    return  _topModalArray.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    TopCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    TopModal *modal = _topModalArray[indexPath.row];
    
    cell.modal = modal;
    return cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    MovieDetailViewController *vc = [[MovieDetailViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
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
