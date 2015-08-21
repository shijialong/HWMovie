//
//  CinemaTableViewCell.h
//  HWMovie
//
//  Created by huiwen on 15/7/22.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CinemaListModal.h"

@interface CinemaTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *addressLabel;
@property (strong, nonatomic) IBOutlet UIImageView *seatImageView;

@property (strong, nonatomic) IBOutlet UIImageView *couponImageView;

@property (strong, nonatomic) IBOutlet UILabel *gradeLabel;

@property (strong, nonatomic) IBOutlet UILabel *priceLabel;

@property (nonatomic, retain) CinemaListModal *modal;
@end
