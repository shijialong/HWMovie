//
//  MovieViewController.h
//  HWMovie
//
//  Created by huiwen on 15/7/17.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "PosterView.h"

@interface MovieViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_movieTableView;
    PosterView *_posterView;
    NSMutableArray *_movieModalArray;
}
@end
