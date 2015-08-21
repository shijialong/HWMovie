//
//  MovieCommentTableViewCell.h
//  HWMovie
//
//  Created by huiwen on 15/7/28.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieCommetModal.h"


@interface MovieCommentTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *iconImageView;
@property (strong, nonatomic) IBOutlet UIImageView *commentImageView;
@property (strong, nonatomic) IBOutlet UILabel *nicknameLabel;
@property (strong, nonatomic) IBOutlet UILabel *commentLabel;
@property (strong, nonatomic) IBOutlet UILabel *ratingLabel;

@property (nonatomic,strong) MovieCommetModal *modal;
@property (nonatomic,assign) BOOL isSelected;

@end
