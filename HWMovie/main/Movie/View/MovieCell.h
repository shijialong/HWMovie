//
//  MovieCell.h
//  HWMovie
//
//  Created by huiwen on 15/7/20.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieModal.h"
#import "StarView.h"

@interface MovieCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *iconImageView;

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

@property (strong, nonatomic) IBOutlet UILabel *yearLabel;

@property (strong, nonatomic) IBOutlet UILabel *averageLabel;


@property (strong, nonatomic) IBOutlet StarView *starView;



@property (nonatomic,strong) MovieModal *modal;



@end
