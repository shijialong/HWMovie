//
//  MovieCell.m
//  HWMovie
//
//  Created by huiwen on 15/7/20.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import "MovieCell.h"
#import "UIImageView+WebCache.h"
#import "common.h"
#import "StarView.h"


@implementation MovieCell

- (void)awakeFromNib {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setModal:(MovieModal *)modal {
    _modal = modal;
    
    _starView.average = _modal.average;
    [self setNeedsLayout];
}

-(void)layoutSubviews {
    [super layoutSubviews];


    
    //添加星星
//    UIImage *image1 = [UIImage imageNamed:@"yellow"];
//    UIImage *image2 = [UIImage imageNamed:@"gray"];
//    
//    
//    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, image1.size.width*(_modal.average/2), image1.size.height)];
//    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, image2.size.width*5, image2.size.height)];
//    
//    view1.backgroundColor = [UIColor colorWithPatternImage:image1];
//    view2.backgroundColor = [UIColor colorWithPatternImage:image2];
//    
//    [_starView addSubview:view2];
//    [_starView addSubview:view1];

    _titleLabel.text = _modal.title;

    
    _yearLabel.text = [NSString stringWithFormat:@"年份：%@",_modal.year];
    _averageLabel.text = [NSString stringWithFormat:@"%.1f", _modal.average];
    
    NSString *imageStr = [_modal.images objectForKey:@"small"];
    
    //开源框架  sdWebImage
    
    [_iconImageView sd_setImageWithURL:[NSURL URLWithString:imageStr]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
