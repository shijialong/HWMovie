//
//  PhotoCollectionView.m
//  HWMovie
//
//  Created by huiwen on 15/7/23.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import "PhotoCollectionView.h"
#import "PhotoCollectionViewCell.h"


@implementation PhotoCollectionView


- (id)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        
        self.delegate = self;
        self.dataSource = self;
        
        //注册
        [self registerClass:[PhotoCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    }
    return self;
}

- (void)setImageUrlArray:(NSArray *)imageUrlArray {
    _imageUrlArray = imageUrlArray;
    
}

#pragma mark - UICollectionView Delegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    
    return  _imageUrlArray.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    PhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.imageUrlStr = _imageUrlArray[indexPath.row];
    
    return cell;
    
}


- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    //拿到cell
    PhotoCollectionViewCell *photoCell = (PhotoCollectionViewCell *)cell;
    
    PhotoScrollView *scrollView = (PhotoScrollView *)[photoCell.contentView viewWithTag:100];
    scrollView.zoomScale = 1.0;
}
@end
