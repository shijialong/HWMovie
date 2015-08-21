//
//  PosterCollectionViewCell.h
//  HWMovie
//
//  Created by gj on 15/7/24.
//  Copyright (c) 2015年 www.huiwen.com 杭州汇文教育. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PosterDetailView.h"
#import "MovieModal.h"
@interface PosterCollectionViewCell : UICollectionViewCell{
    PosterDetailView *_detailView;
    UIImageView *_imageView;

}
@property (nonatomic,assign)BOOL isBack;
@property (nonatomic,retain)MovieModal *modal;

- (void)flipCell;

@end
