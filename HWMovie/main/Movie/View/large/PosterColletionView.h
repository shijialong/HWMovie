//
//  PosterColletionView.h
//  HWMovie
//
//  Created by gj on 15/7/24.
//  Copyright (c) 2015年 www.huiwen.com 杭州汇文教育. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PosterColletionView : UICollectionView<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,retain)NSArray *movieModalArray;//数据
@property (nonatomic,assign)NSInteger currentIndex;//记录 中间cell 的索引
@property (nonatomic,assign)CGFloat itemWidth;

@end
