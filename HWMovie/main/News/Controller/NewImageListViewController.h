//
//  NewImageListViewController.h
//  HWMovie
//
//  Created by huiwen on 15/7/22.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import "BaseViewController.h"

@interface NewImageListViewController : BaseViewController<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>


{
    UICollectionView *_collectionView;
    
    NSMutableArray *_imageModalArray;
}

@end
