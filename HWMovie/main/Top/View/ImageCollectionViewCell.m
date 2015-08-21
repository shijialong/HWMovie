//
//  ImageCollectionViewCell.m
//  HWMovie
//
//  Created by huiwen on 15/7/28.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import "ImageCollectionViewCell.h"
#import "UIViewExt.h"
#import "UIImageView+WebCache.h"


@implementation ImageCollectionViewCell

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height)];
        [self.contentView addSubview:_imageView];
    }
    return self;
}


//- (void)setModal:(MovieDetailModal *)modal {
//    _modal = modal;
//    [self setNeedsLayout];
//}


//-(void)layoutSubviews {
//    [super layoutSubviews];
//}

@end
