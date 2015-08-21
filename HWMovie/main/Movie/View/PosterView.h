//
//  PosterView.h
//  HWMovie
//
//  Created by huiwen on 15/7/27.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IndexCollectionView.h"
#import "PosterColletionView.h"


@interface PosterView : UIView
{
    
    UIView *_headerView;
    UILabel *_bottomTitleLabel;
    IndexCollectionView *_indexCollectionView;
    PosterColletionView *_posterCollectionView;
    
    UIControl *_coverView;
    
}
@property (nonatomic, retain) NSArray *movieModalArray;
@end
