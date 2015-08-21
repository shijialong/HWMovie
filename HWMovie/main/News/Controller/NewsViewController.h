//
//  NewsViewController.h
//  HWMovie
//
//  Created by huiwen on 15/7/17.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface NewsViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>

{
    UITableView *_newsTableView;
    NSMutableArray *_newsModalArray;
    UIImageView *_headerImageView;
    UILabel *_headerLabel;
}
@end
