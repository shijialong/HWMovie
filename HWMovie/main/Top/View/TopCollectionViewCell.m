//
//  TopCollectionViewCell.m
//  HWMovie
//
//  Created by huiwen on 15/7/21.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import "TopCollectionViewCell.h"
#import "TopModal.h"
#import "UIImageView+WebCache.h"
#import "common.h"
#import "StarView.h"

@implementation TopCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setModal:(TopModal *)modal {
    _modal = modal;
    _starView.average = _modal.average;
    [self setNeedsLayout];    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _averageLabel.text = [NSString stringWithFormat:@"%.1f",_modal.average];
    
    _titleLabel.text = _modal.title;
    
    NSString *imageStr = [_modal.images objectForKey:@"small"];
    
    //开源框架  sdWebImage
    
    [_iconImageView sd_setImageWithURL:[NSURL URLWithString:imageStr]];
    
}
@end
