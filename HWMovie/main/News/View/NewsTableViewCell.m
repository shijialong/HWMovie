//
//  NewsTableViewCell.m
//  HWMovie
//
//  Created by huiwen on 15/7/21.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import "NewsTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "common.h"


@implementation NewsTableViewCell

- (void)awakeFromNib {
    // Initialization code
}


- (void)setModal:(NewsModal *)modal {
    _modal = modal;
    
    [self setNeedsLayout];
    
}


-(void)layoutSubviews {
    [super layoutSubviews];
    
    _titleLabel.text = _modal.title;
    
    _summaryLabel.text = _modal.summary;
    
    if (_modal.type == 0) {
        _typeImageView.image = nil;
    }else if (_modal.type == 1) {
        //_typeImageView.hidden = NO;
        _typeImageView.image = [UIImage imageNamed:@"sctpxw"];
    }else {
        //_typeImageView.hidden = NO;
        _typeImageView.image = [UIImage imageNamed:@"scspxw"];
    }
    
    [_iconImageView sd_setImageWithURL:[NSURL URLWithString:_modal.image]];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
