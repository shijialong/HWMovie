//
//  PhotoScrollView.m
//  HWMovie
//
//  Created by huiwen on 15/7/23.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import "PhotoScrollView.h"
#import "UIImageView+WebCache.h"


@implementation PhotoScrollView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        _imageView.contentMode = UIViewContentModeCenter;
        
        self.minimumZoomScale = 0.5;
        self.maximumZoomScale = 2;
        
        self.delegate = self;
        
        [self addSubview:_imageView];
        
        UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doubleTap)];
        
        doubleTap.numberOfTapsRequired = 2;
        doubleTap.numberOfTouchesRequired= 1;
        
        [self addGestureRecognizer:doubleTap];
        
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapAction)];
        [self addGestureRecognizer:singleTap];
        
        [singleTap requireGestureRecognizerToFail:doubleTap];
    }
    return self;
}


- (void)doubleTap {
    if (self.zoomScale == 1) {
        [self setZoomScale:3 animated:YES];
    }else {
        [self setZoomScale:1 animated:YES];
    }
}


- (void)singleTapAction {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"HideNavigationBarNotification" object:nil];
}


-(void)setImageUrlStr:(NSString *)imageUrlStr {
    _imageUrlStr = imageUrlStr;
    [self setNeedsLayout];
}

- (void)layoutSubviews {
    [super layoutSubviews];

    [_imageView sd_setImageWithURL:[NSURL URLWithString:_imageUrlStr]];
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
}


- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return _imageView;
}
@end
