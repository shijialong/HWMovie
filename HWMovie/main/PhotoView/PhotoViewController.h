//
//  PhotoViewController.h
//  HWMovie
//
//  Created by huiwen on 15/7/23.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoCollectionView.h"


@interface PhotoViewController : UIViewController

{
    PhotoCollectionView *_CollectionView;
}
@property (nonatomic,retain) NSArray *imageUrlArray;
@property (nonatomic,assign) NSInteger currentIndex;//当前点击的图片的数值
@end
