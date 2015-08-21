//
//  MovieDetailView.m
//  HWMovie
//
//  Created by huiwen on 15/7/28.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import "MovieDetailView.h"
#import "UIImageView+WebCache.h"


@implementation MovieDetailView

- (void)setModal:(MovieDetailModal *)modal {
    _modal = modal;
    //NSLog(@"%@",_modal.titleCn);
    [self setNeedsLayout];
    
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_imageView sd_setImageWithURL:[NSURL URLWithString:_modal.image]];
   // NSLog(@"%@",_modal.titleCn);
    _titleLabel.text = _modal.titleCn;

    
    //NSLog(@"%@",_titleLabel.text);
    
    _directorLabel.text = _modal.directors[0];
    
    _actorLabel.text = [NSString stringWithFormat:@"%@,%@,%@,%@,%@",_modal.actors[0],_modal.actors[1],_modal.actors[2],_modal.actors[3],_modal.actors[4]];
    _typeLabel.text = [NSString stringWithFormat:@"%@,%@,%@,%@",_modal.type[0],_modal.type[1],_modal.type[2],_modal.type[3]];
    _dateLabel.text = [NSString stringWithFormat:@"%@ %@",_modal.location,_modal.date];
}


@end
