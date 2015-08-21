//
//  IndexCollectionViewCell.h
//  HWMovie
//
//  Created by huiwen on 15/7/27.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieModal.h"


@interface IndexCollectionViewCell : UICollectionViewCell

{
    UIImageView *_imageView;
}

@property (nonatomic, retain) MovieModal *modal;

@end
