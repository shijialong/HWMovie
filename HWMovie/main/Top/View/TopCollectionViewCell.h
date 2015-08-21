//
//  TopCollectionViewCell.h
//  HWMovie
//
//  Created by huiwen on 15/7/21.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopModal.h"
#import "StarView.h"

@interface TopCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) IBOutlet UIImageView *iconImageView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet StarView *starView;

@property (strong, nonatomic) IBOutlet UILabel *averageLabel;
@property (nonatomic,strong) TopModal *modal;
@end
