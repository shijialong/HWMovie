//
//  PosterView.m
//  HWMovie
//
//  Created by huiwen on 15/7/27.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import "PosterView.h"
#import "common.h"
#import "UIViewExt.h"
#import "MovieModal.h"

#define kHeaderViewH 136 //头部视图高度
#define kIndexCollectionViewH 100 //小海报高度
#define kBottomTitleLabelH 35  //底部标题栏高度

#define kBottomTitleLabelY (kheight-kTabBarHeight-kBottomTitleLabelH) //底部标题栏的Y坐标
#define kHeaderOffH 36 //头部视图向上偏移的距离
#define kPosterCollectionViewY 100 //大海报Y
#define kPosterCollectionViewH (kheight-kPosterCollectionViewY-kTabBarHeight-kBottomTitleLabelH) //大海报高度


@implementation PosterView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self _createPosterCollectionView];
        [self _createBottomTitleLable];
        
        [self _createCoverView];
        
        [self _createHeaderView];
        [self _createGesture];
        
        //增加观察者
        [_indexCollectionView addObserver:self forKeyPath:@"currentIndex" options:NSKeyValueObservingOptionNew context:nil];
        [_posterCollectionView addObserver:self forKeyPath:@"currentIndex" options:NSKeyValueObservingOptionNew context:nil];
       
    }
    return self;
    
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    NSNumber *number = [change objectForKey:@"new"];
    
    NSInteger index = [number integerValue];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    
    //小海报动了
    if ([object isKindOfClass:[IndexCollectionView class]] && _posterCollectionView.currentIndex != index) {
        
        [_posterCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        
        _posterCollectionView.currentIndex = index;
        
        
    }else if([object isKindOfClass:[PosterColletionView class]] && _indexCollectionView.currentIndex!= index){
        
        [_indexCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        
        _indexCollectionView.currentIndex = index;
    }
    //更新 标题
     MovieModal *modal = _movieModalArray[index];
    _bottomTitleLabel.text = modal.title;
}





#pragma mark - subViews

//创建头部视图
- (void)_createHeaderView{
    
    _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, -kHeaderOffH, kwidth, kHeaderViewH)];
    _headerView.backgroundColor = [UIColor clearColor];
    // _headerView.backgroundColor = [UIColor greenColor];
    
    //01 背景视图
    UIImage *image = [UIImage imageNamed:@"indexBG_home"];
    image = [image stretchableImageWithLeftCapWidth:0 topCapHeight:1];
    UIImageView *bgImageView = [[UIImageView alloc] initWithFrame:_headerView.bounds];
    bgImageView.image = image;
    [_headerView addSubview:bgImageView];
    
    
    
    //02  小海报视图
    //     = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kIndexCollectionViewH)];
    //    indexView.backgroundColor = [UIColor redColor];
    //    [_headerView addSubview:indexView];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    
    _indexCollectionView = [[IndexCollectionView alloc] initWithFrame:CGRectMake(0, 0, kwidth, kIndexCollectionViewH) collectionViewLayout:layout];
    
    _indexCollectionView.itemWidth = kwidth/5;
    //  _indexCollectionView.backgroundColor = [UIColor greenColor];
    
    [_headerView addSubview:_indexCollectionView];
    
    
    
    //03 按钮视图
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake((kwidth-20)/2, kHeaderViewH-25, 20, 20)];
    // button.backgroundColor = [UIColor redColor];
    [button setImage:[UIImage imageNamed:@"down_home"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"up_home"] forState:UIControlStateSelected];
    
    button.tag = 100;
    [button addTarget:self action:@selector(pullAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [_headerView addSubview:button];
    
    
    
    [self addSubview:_headerView];
    
}


//创建大海报视图
- (void)_createPosterCollectionView{
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    //layout.itemSize
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    //间距
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    
    
    
    _posterCollectionView = [[PosterColletionView alloc] initWithFrame:CGRectMake(0, kPosterCollectionViewY, kwidth, kPosterCollectionViewH) collectionViewLayout:layout];
    _posterCollectionView.itemWidth = kwidth*3/4;
    
    //  _posterColletionView.backgroundColor = [UIColor blueColor];
    
    [self addSubview:_posterCollectionView];
    
}

//创建底部标题视图
- (void)_createBottomTitleLable{
    
    
    _bottomTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, kBottomTitleLabelY, kwidth, kBottomTitleLabelH)];
    
    _bottomTitleLabel.textColor = [UIColor whiteColor];
    _bottomTitleLabel.textAlignment = NSTextAlignmentCenter;
    
    
    _bottomTitleLabel.backgroundColor = [UIColor grayColor];
    
    MovieModal *modal = _movieModalArray[0];
    _bottomTitleLabel.text = modal.title;
    [self addSubview:_bottomTitleLabel];
}


- (void)_createCoverView{
    
    
    _coverView = [[UIControl alloc]initWithFrame:self.bounds];
    _coverView.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.8];
    _coverView.hidden = YES;
    
    [_coverView addTarget:self action:@selector(coverTapAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_coverView];
    
    
    
}

//创建清扫手势
- (void)_createGesture{
    
    UISwipeGestureRecognizer *swipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeDownAction)];
    //设置清扫方向
    swipeDown.direction = UISwipeGestureRecognizerDirectionDown;
    
    [self addGestureRecognizer:swipeDown];
    
    
}



#pragma mark - Action

- (void)swipeDownAction{
    
    //NSLog(@"清扫 ");
    //动画
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:.3];
    
    
    [self showHeader];
    
    UIButton *button = (UIButton*)[_headerView viewWithTag:100];
    
    button.selected = !button.selected;
    
    [UIView commitAnimations];
    
}


- (void)coverTapAction:(UIControl *)control{
    //动画
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:.3];
    
    
    [self hideHeader];
    
    UIButton *button = (UIButton*)[_headerView viewWithTag:100];
    
    button.selected = !button.selected;
    
    [UIView commitAnimations];
    
    
    
}
- (void)pullAction:(UIButton *)button{
    
    //动画
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:.3];
    
    if (button.selected == NO) {
        [self showHeader];
    }else{
        [self hideHeader];
    }
    button.selected = !button.selected;
    
    [UIView commitAnimations];
}


- (void)showHeader{
    
    _headerView.top = kNavHeight;
    _coverView.hidden = NO;
    
    
}

- (void)hideHeader{
    
    _headerView.top = -kHeaderOffH;
    _coverView.hidden = YES;
    
    
}
- (void)setMovieModalArray:(NSArray *)movieModalArray{
    
    _movieModalArray = movieModalArray;
    _posterCollectionView.movieModalArray = movieModalArray;
    _indexCollectionView.movieModalArray = movieModalArray;
    //更新 标题
    MovieModal *modal = _movieModalArray[0];
    _bottomTitleLabel.text = modal.title;
    
    
}



@end
