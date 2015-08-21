//
//  NewImageListViewController.m
//  HWMovie
//
//  Created by huiwen on 15/7/22.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import "NewImageListViewController.h"
#import "common.h"
#import "ImageCell.h"
#import "ImageModal.h"
#import "DataService.h"
#import "PhotoViewController.h"
#import "BaesNavigationController.h"


@interface NewImageListViewController ()

@end

@implementation NewImageListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _loadData];
    
    [self _createCollectionView];
   
    
    self.view.backgroundColor = [UIColor redColor];
    // Do any additional setup after loading the view.
}

- (void)_createCollectionView {
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = 20;
    layout.itemSize = CGSizeMake((kwidth-50)/4, (kwidth-50)/4);
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    
    [_collectionView registerClass:[ImageCell class] forCellWithReuseIdentifier:@"cell"];
    
    [self.view addSubview:_collectionView];
}

- (void)_loadData {
    
    _imageModalArray = [[NSMutableArray alloc] init];
    
    
    
    
    
    NSArray *imageArray = [DataService getJsonDataFromFile:@"image_list.json"];
    
    
    
    for (NSDictionary *dic in imageArray) {
        ImageModal *modal = [[ImageModal alloc] init];
        
        [modal setValuesForKeysWithDictionary:dic];
        
        [_imageModalArray addObject:modal];
        
        //NSLog(@"%@",modal.image);
        
        }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UICollectionView Delegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    
    return  _imageModalArray.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    ImageModal *modal = _imageModalArray[indexPath.row];
    
    cell.modal = modal;
    return cell;
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    PhotoViewController *vc = [[PhotoViewController alloc] init];
    
    NSMutableArray *imageUrlArray = [[NSMutableArray alloc] init];
    for (int i = 0; i< _imageModalArray.count; i++) {
        ImageModal *modal = _imageModalArray[i];
        
        NSString *urlStr = modal.image;
        [imageUrlArray addObject:urlStr];
    }
   
    
    vc.view.backgroundColor = [UIColor redColor];
    
    vc.imageUrlArray = imageUrlArray;
    
    
    
    vc.currentIndex = indexPath.item;
    
    
    BaesNavigationController *nav = [[BaesNavigationController alloc] initWithRootViewController:vc];
    [self presentViewController:nav animated:YES completion:nil];
    
    
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
