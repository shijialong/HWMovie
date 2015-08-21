//
//  StarView.m
//  HWMovie
//
//  Created by huiwen on 15/7/21.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import "StarView.h"

@implementation StarView


- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self _createSubViews];
    }
    return self;
}

- (void)awakeFromNib {
    [self _createSubViews];
}
- (void)_createSubViews {
    UIImage *yellowImage = [UIImage imageNamed:@"yellow"];
    UIImage *grayImage = [UIImage imageNamed:@"gray"];
    
    
    _yellowView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, yellowImage.size.width*5, yellowImage.size.height)];
    
    _grayView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, grayImage.size.width*5, grayImage.size.height)];
    
    _yellowView.backgroundColor = [UIColor colorWithPatternImage:yellowImage];
    _grayView.backgroundColor = [UIColor colorWithPatternImage:grayImage];
    
    [self addSubview:_grayView];
    [self addSubview:_yellowView];
    
    //放大倍数
    float scale = self.frame.size.height/grayImage.size.height;
    
    _grayView.transform = CGAffineTransformMakeScale(scale, scale);
    _yellowView.transform = CGAffineTransformMakeScale(scale, scale);
    
    //放大以后坐标需要调整
    CGRect frame = _grayView.frame;
    frame.origin = CGPointZero;
    _grayView.frame = frame;
    
    _yellowView.frame = frame;
}


- (void)setAverage:(float)average {
    _average = average;
    [self setNeedsLayout];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    float width = _average/10.0 * _grayView.frame.size.width;
    CGRect frame = _grayView.frame;
    
    frame.size.width = width;
    
    _yellowView.frame = frame;
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
