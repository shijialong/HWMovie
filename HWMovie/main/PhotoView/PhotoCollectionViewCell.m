//
//  PhotoCollectionViewCell.m
//  HWMovie
//
//  Created by huiwen on 15/7/23.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import "PhotoCollectionViewCell.h"
#import "PhotoScrollView.h"


@implementation PhotoCollectionViewCell


- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self _createScrollView];
    }
    return self;
}

- (void)setImageUrlStr:(NSString *)imageUrlStr {
    _imageUrlStr = imageUrlStr;
    [self setNeedsLayout];
    
}
- (void)_createScrollView {
    _scrollView = [[PhotoScrollView alloc] initWithFrame:self.bounds];
    
    
    _scrollView.tag = 100;
    
    [self.contentView addSubview:_scrollView];
}


- (void)layoutSubviews {
    [super layoutSubviews];
    _scrollView.imageUrlStr = _imageUrlStr;
}


@end
