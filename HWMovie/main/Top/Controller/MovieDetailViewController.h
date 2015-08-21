//
//  MovieDetailViewController.h
//  HWMovie
//
//  Created by huiwen on 15/7/28.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import "BaseViewController.h"
#import "MovieDetailView.h"
#import "MovieDetailModal.h"

@interface MovieDetailViewController : BaseViewController<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UITableViewDataSource,UITableViewDelegate>

{
    MovieDetailView *_movieDetailView;
    MovieDetailModal *_modal;
    
    UICollectionView *_collectionView;
    
    NSMutableArray *_movieCommentModalArray;
    UITableView *_tableView;
    
    UIView *_headerView;
    BOOL _isSelected;
}

@end
