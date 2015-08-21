//
//  CinemaTableViewCell.m
//  HWMovie
//
//  Created by huiwen on 15/7/22.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import "CinemaTableViewCell.h"

@implementation CinemaTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setModal:(CinemaListModal *)modal {
    _modal = modal;
    [self setNeedsLayout];
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _nameLabel.text = _modal.name;
    _addressLabel.text = _modal.address;
    if ([_modal.isSeatSupport isEqualToString:@"1"]) {
        _seatImageView.image = [UIImage imageNamed:@"scspxw"];
    }else {
        _seatImageView.image = nil;
    }
    if ([_modal.isCouponSupport isEqualToString:@"1"]) {
        _couponImageView.image = [UIImage imageNamed:@"sctpxw"];
    }else {
        _couponImageView.image = nil;
    }
    _gradeLabel.text = _modal.grade;
    _priceLabel.text = _modal.lowPrice;
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
