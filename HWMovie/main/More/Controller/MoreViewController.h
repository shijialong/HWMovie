//
//  MoreViewController.h
//  HWMovie
//
//  Created by huiwen on 15/7/17.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "BaesNavigationController.h"

@interface MoreViewController : BaseViewController<UITableViewDelegate,UITableViewDataSource>

{
    UITableView *_tableView;
    NSArray *_imageNames;
    NSArray *_titles;
}

@end
