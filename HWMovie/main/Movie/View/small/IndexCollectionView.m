//
//  IndexCollectionView.m
//  HWMovie
//
//  Created by huiwen on 15/7/27.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import "IndexCollectionView.h"
#import "IndexCollectionViewCell.h"
#import "UIViewExt.h"
#import "MovieModal.h"

@implementation IndexCollectionView

- (id)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.dataSource = self;
        self.delegate = self;
        
        [self registerClass:[IndexCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    }
    return self;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    IndexCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    MovieModal *modal = self.movieModalArray[indexPath.row];
    cell.modal = modal;
    return cell;
    
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row != self.currentIndex) {
        [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        
        self.currentIndex = indexPath.row;
    }
}



@end
