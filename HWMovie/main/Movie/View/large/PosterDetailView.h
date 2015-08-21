//
//  PosterDetailView.h
//  HWMovie
//
//  Created by gj on 15/7/21.
//  Copyright (c) 2015年 www.huiwen.com 杭州汇文教育. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieModal.h"
#import "StarView.h"

@interface PosterDetailView : UIView

@property (weak, nonatomic) IBOutlet UIImageView *movieImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UILabel *englishTitleLable;
@property (weak, nonatomic) IBOutlet UILabel *yearLable;
@property (weak, nonatomic) IBOutlet UILabel *averageLable;

@property (weak, nonatomic) IBOutlet StarView *starView;
@property (nonatomic,strong) MovieModal *modal;

@end
