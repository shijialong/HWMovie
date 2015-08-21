//
//  TopViewController.h
//  HWMovie
//
//  Created by huiwen on 15/7/17.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface TopViewController : BaseViewController<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>


{
    UICollectionView *_collectionView;

    NSMutableArray *_topModalArray;
}


@end
