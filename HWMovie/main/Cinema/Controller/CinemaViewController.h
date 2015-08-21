//
//  CinemaViewController.h
//  HWMovie
//
//  Created by huiwen on 15/7/17.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface CinemaViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>

{
    UITableView *_cinemaTableView;
    NSMutableArray *_districtModalArray;
    NSMutableArray *_cinemaListModalArray;

    BOOL flags[100];
    NSMutableArray *_cinemaInDistrict;
}
@end
