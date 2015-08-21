//
//  PhotoCollectionView.h
//  HWMovie
//
//  Created by huiwen on 15/7/23.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoCollectionView : UICollectionView<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>



@property (nonatomic,retain) NSArray *imageUrlArray;

@end
