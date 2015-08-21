//
//  MovieCommentTableViewCell.m
//  HWMovie
//
//  Created by huiwen on 15/7/28.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import "MovieCommentTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "common.h"


@implementation MovieCommentTableViewCell

- (void)awakeFromNib {
    // Initialization code
}


- (void)setModal:(MovieCommetModal *)modal {
    _modal = modal;
    [self setNeedsLayout];
}

- (void)setIsSelected:(BOOL)isSelected {
    _isSelected = isSelected;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_iconImageView sd_setImageWithURL:[NSURL URLWithString:_modal.userImage]];
    
    //设置拉伸
    UIImage *bgImage = [UIImage imageNamed:@"movieDetail_comments_frame"];
    bgImage = [bgImage stretchableImageWithLeftCapWidth:bgImage.size.width*0.5  topCapHeight:bgImage.size.height*0.7];
    
    _commentImageView.image = bgImage;
    //[_commentImageView setImage:[UIImage imageNamed:@"movieDetail_comments_frame"]];
    _nicknameLabel.text = _modal.nickname;
    _commentLabel.numberOfLines = 0;
    _commentLabel.text = _modal.content;
    _ratingLabel.text = _modal.rating;
    
    
    
    CGFloat maxLabelWidth = _commentLabel.bounds.size.width-20;
   // NSLog(@"%.1f",_commentImageView.bounds.size.width);
    //iOS 7
    //计算STRING 内容所占空间
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:18]};
    CGSize contenSize = [_modal.content boundingRectWithSize:CGSizeMake(maxLabelWidth, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
//    NSLog(@"-------%.1f",contenSize.width);
//    NSLog(@"##%.1f",contenSize.height);
    _commentImageView.frame =CGRectMake(self.bounds.origin.x, self.bounds.origin.y, self.bounds.size.width, contenSize.height+30);
    _commentLabel.frame = CGRectMake(self.bounds.origin.x, self.bounds.origin.y, self.bounds.size.width, contenSize.height);
    
    
    if (_isSelected) {
        NSLog(@"ssssssssssssss");
//        _commentImageView.frame =CGRectMake(60, 10, contenSize.width+50, contenSize.height+30);
//        _commentLabel.frame = CGRectMake(80, 20, contenSize.width+20, contenSize.height);
//    }else {
//        [_commentImageView setImage:[UIImage imageNamed:@"movieDetail_comments_frame"]];
//        _commentLabel.text = _modal.content;
//    }
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
