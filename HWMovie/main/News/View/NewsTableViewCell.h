//
//  NewsTableViewCell.h
//  HWMovie
//
//  Created by huiwen on 15/7/21.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsModal.h"


@interface NewsTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *iconImageView;

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *summaryLabel;
@property (strong, nonatomic) IBOutlet UIImageView *typeImageView;

@property (nonatomic,strong) NewsModal *modal;
@end
