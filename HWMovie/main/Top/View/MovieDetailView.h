//
//  MovieDetailView.h
//  HWMovie
//
//  Created by huiwen on 15/7/28.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieDetailModal.h"



@interface MovieDetailView : UIView
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *directorLabel;
@property (strong, nonatomic) IBOutlet UILabel *actorLabel;
@property (strong, nonatomic) IBOutlet UILabel *typeLabel;
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;


@property (nonatomic,strong) MovieDetailModal *modal;
@end
