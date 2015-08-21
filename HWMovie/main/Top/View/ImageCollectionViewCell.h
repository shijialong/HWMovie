//
//  ImageCollectionViewCell.h
//  HWMovie
//
//  Created by huiwen on 15/7/28.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieDetailModal.h"


@interface ImageCollectionViewCell : UICollectionViewCell

@property (nonatomic,retain) UIImageView *imageView;


@property (nonatomic,retain) MovieDetailModal *modal;

@end
