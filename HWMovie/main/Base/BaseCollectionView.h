//
//  BaseCollectionView.h
//  HWMovie
//
//  Created by huiwen on 15/7/27.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseCollectionView : UICollectionView<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, retain) NSArray *movieModalArray;//数据
@property (nonatomic, assign) NSInteger currentIndex;//记录中间cell的索引
@property (nonatomic, assign) CGFloat itemWidth;


@end
