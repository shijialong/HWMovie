//
//  ImageCell.m
//  HWMovie
//
//  Created by huiwen on 15/7/22.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import "ImageCell.h"
#import "UIImageView+WebCache.h"


@implementation ImageCell


- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self _createSubView];
    }
    return self;
}


- (void)setModal:(ImageModal *)modal {
    _modal = modal;
    [self setNeedsLayout];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_imageView sd_setImageWithURL:[NSURL URLWithString:_modal.image]];
}

- (void)_createSubView {
    
    _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    //[_imageView sd_setImageWithURL:[NSURL URLWithString:_modal.image]];
    //NSLog(@"%@",_modal.image);
    _imageView.layer.cornerRadius = 5;
    _imageView.layer.borderWidth = 1;
    _imageView.layer.borderColor = [UIColor whiteColor].CGColor;
    _imageView.layer.masksToBounds = YES;
    
    [self.contentView addSubview:_imageView];
}
@end
