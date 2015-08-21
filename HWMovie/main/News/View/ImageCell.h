//
//  ImageCell.h
//  HWMovie
//
//  Created by huiwen on 15/7/22.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageModal.h"


@interface ImageCell : UICollectionViewCell

@property (nonatomic,retain) UIImageView *imageView;
@property (nonatomic,strong) ImageModal *modal;

@end
