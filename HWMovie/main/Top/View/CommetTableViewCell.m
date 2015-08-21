//
//  CommetTableViewCell.m
//  HWMovie
//
//  Created by huiwen on 15/7/29.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import "CommetTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "common.h"


@implementation CommetTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self _createContentView];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}


- (void)_createContentView {
    _iconImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    _commentImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    _nicknameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _commentLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _commentLabel.font = [UIFont systemFontOfSize:18];
    _commentLabel.numberOfLines = 0;
    
    
    _ratingLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    
    
    [self.contentView addSubview:_iconImageView];
    [self.contentView addSubview:_commentImageView];
    [self.contentView addSubview:_commentLabel];
    [self.contentView addSubview:_nicknameLabel];
    [self.contentView addSubview:_ratingLabel];
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
    _nicknameLabel.textColor = [UIColor orangeColor];
    
    
    _commentLabel.numberOfLines = 0;
    _commentLabel.text = _modal.content;
    _ratingLabel.text = _modal.rating;
    
    
    
    _iconImageView.frame = CGRectMake(10, 10, 70, 70);
    
    CGFloat maxLabelWidth = kwidth- 100;
    // NSLog(@"%.1f",_commentImageView.bounds.size.width);
    //iOS 7
    //计算STRING 内容所占空间
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:18]};
    CGSize contenSize = [_modal.content boundingRectWithSize:CGSizeMake(maxLabelWidth, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    //    NSLog(@"-------%.1f",contenSize.width);
    //    NSLog(@"##%.1f",contenSize.height);
//    _commentImageView.frame =CGRectMake(self.bounds.origin.x, self.bounds.origin.y, self.bounds.size.width, contenSize.height+30);
//    _commentLabel.frame = CGRectMake(self.bounds.origin.x, self.bounds.origin.y, self.bounds.size.width, contenSize.height);
    
    
    if (_isSelected ) {

        _commentImageView.frame =CGRectMake(80, 10, kwidth-100, contenSize.height+30);
        _commentLabel.frame = CGRectMake(100, 20, kwidth-120, contenSize.height);
    }else {
        _commentImageView.frame =CGRectMake(80, 10, kwidth-100, 70);
        _commentLabel.frame = CGRectMake(100, 50, kwidth-120, 30);
        _nicknameLabel.frame = CGRectMake(100, 15, kwidth-120, 40);
    }
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
