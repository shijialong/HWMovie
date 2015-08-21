//
//  CommetTableViewCell.h
//  HWMovie
//
//  Created by huiwen on 15/7/29.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieCommetModal.h"


@interface CommetTableViewCell : UITableViewCell
{
    UIImageView *_iconImageView;
    UIImageView *_commentImageView;
    UILabel *_nicknameLabel;
    UILabel *_commentLabel;
    UILabel *_ratingLabel;
}


@property (nonatomic,strong) MovieCommetModal *modal;
@property (nonatomic,assign) BOOL isSelected;
@end
