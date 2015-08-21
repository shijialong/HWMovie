//
//  BaseCollectionView.m
//  HWMovie
//
//  Created by huiwen on 15/7/27.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import "BaseCollectionView.h"
#import "common.h"
#import "UIViewExt.h"

@implementation BaseCollectionView

- (id)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.dataSource = self;
        self.delegate = self;
        //不注册单元格  子类注册
        
    }
    return self;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    
    return self.movieModalArray.count;
    
}



- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    return UIEdgeInsetsMake(0, (kwidth-self.itemWidth)/2, 0, (kwidth-self.itemWidth)/2);
}

- (void)setMovieModalArray:(NSArray *)movieModalArray {
    _movieModalArray = movieModalArray;
    [self reloadData];
}

//设置每个cell的size

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.itemWidth, self.height);
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    
    //targetContentOffset 目标偏移量
    
    CGFloat itemWidth = self.itemWidth;
    CGFloat x = targetContentOffset -> x;
    NSInteger index = x/itemWidth;
    if (index <0) {
        index = 0;
    }else if (index > _movieModalArray.count) {
        index = _movieModalArray.count - 1;
    }
    
    targetContentOffset -> x = itemWidth*index;
    
    self.currentIndex = index;
}























@end
