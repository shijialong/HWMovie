//
//  MovieDetailViewController.m
//  HWMovie
//
//  Created by huiwen on 15/7/28.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import "MovieDetailViewController.h"
#import "MovieDetailModal.h"
#import "common.h"
#import "UIImageView+WebCache.h"
#import "ImageCollectionViewCell.h"
#import "DataService.h"
#import "MovieCommetModal.h"
#import "MovieCommentTableViewCell.h"
#import "UIViewExt.h"
#import "CommetTableViewCell.h"



@interface MovieDetailViewController ()

@end

@implementation MovieDetailViewController



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"电影详情";
    }
    
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _loadDataOfMovieDetail];
    [self _loadDataOfMovieComment];
    
    [self _createTableView];
    [self _createHeaderView];
    
    [self _createHeaderMovieDetailView];
    
    [self _createImageCollectionView];
    
    
    // Do any additional setup after loading the view.
}


#pragma mark - Create SubViews

- (void)_createHeaderView {
    _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 64+186+10+(kwidth-50)/4)];
    _headerView.backgroundColor = [UIColor clearColor];
    _tableView.tableHeaderView = _headerView;
    //[self.view addSubview:_headerView];
    
    
    //_tableView.contentInset = UIEdgeInsetsMake(64+186+10+(kwidth-50)/4, 0, 0, 0);
}
    
    
    
    
    
- (void)_createHeaderMovieDetailView {
    NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"HeaderMovieDetailView" owner:self options:nil];

    _movieDetailView = [views lastObject];
    _movieDetailView.frame = CGRectMake(0, 64, kwidth, 186);

    _movieDetailView.modal = _modal;
    [self.view addSubview:_movieDetailView];
}

- (void)_createImageCollectionView {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake((kwidth-50)/4, (kwidth-50)/4);
    layout.minimumInteritemSpacing = 5;
    
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 260, kwidth, (kwidth-50)/4+10) collectionViewLayout:layout];
    
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    //_collectionView.backgroundColor = [UIColor redColor];
    [_collectionView registerClass:[ImageCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    [self.view addSubview:_collectionView];

}


- (void)_createTableView {
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_tableView];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
//    UINib *nib = [UINib nibWithNibName:@"MovieCommentTableViewCell" bundle:nil];
//    [_tableView registerNib:nib forCellReuseIdentifier:@"cell1"];
    [_tableView registerClass:[CommetTableViewCell class] forCellReuseIdentifier:@"cell1"];
    
}


#pragma mark - loadData

- (void)_loadDataOfMovieDetail {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"movie_detail.json" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    
    NSDictionary *movieDetailDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    _modal = [[MovieDetailModal alloc] init];
    _modal.image = [movieDetailDic objectForKey:@"image"];
    
    _modal.titleCn = [movieDetailDic objectForKey:@"titleCn"];
    _modal.directors = [movieDetailDic objectForKey:@"directors"];
    _modal.actors = [movieDetailDic objectForKey:@"actors"];
    _modal.type = [movieDetailDic objectForKey:@"type"];
    _modal.date = [[movieDetailDic objectForKey:@"release"]objectForKey:@"date"];

    _modal.location = [[movieDetailDic objectForKey:@"release"]objectForKey:@"location"];
    _modal.images = [movieDetailDic objectForKey:@"images"];
    
  // _movieDetailView.modal = _modal;
    
    
}


- (void)_loadDataOfMovieComment {
    _movieCommentModalArray = [[NSMutableArray alloc] init];
    NSDictionary *dic = [DataService getJsonDataFromFile:@"movie_comment.json"];
    NSArray *list = [dic objectForKey:@"list"];
    for (NSDictionary *dic in list) {
        MovieCommetModal *modal = [[MovieCommetModal alloc] init];
        
        [modal setValuesForKeysWithDictionary:dic];
        
        [_movieCommentModalArray addObject:modal];
    }
}

#pragma mark - UICollectionViewDataSouce Delegate

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _modal.images.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:_modal.images[indexPath.row]]];
    
    //UIImageView *imageView = [[UIImageView alloc] init];
   // [cell.imageView sd_setImageWithURL:[NSURL URLWithString:_modal.images[indexPath.row]]];
   // NSLog(@"%@",_modal.images[indexPath.row]);
   // [cell.contentView addSubview:imageView];
    return cell;
}


#pragma mark - TableView Delegate



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _movieCommentModalArray.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CommetTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1" forIndexPath:indexPath];
    cell.modal = _movieCommentModalArray[indexPath.row];
    cell.isSelected = _isSelected;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_isSelected) {
        MovieCommetModal *modal = _movieCommentModalArray[indexPath.row];
        
        NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:18]};
        CGSize contenSize = [modal.content boundingRectWithSize:CGSizeMake(kwidth-100, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
        
        return contenSize.height+100;
    }else {
        return 90;
    }
//    _isSelected = !_isSelected;
//    return 90;
    
}
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//    return 380;
//}



- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offY = scrollView.contentOffset.y;
    
    //NSLog(@"%f",offY);
    if (offY >-64) {
        _movieDetailView.top = -offY;
        _collectionView.top = _movieDetailView.bottom;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    _isSelected = !_isSelected;
     NSIndexPath *path = [NSIndexPath indexPathForRow:indexPath.row inSection:0];
    [tableView reloadRowsAtIndexPaths:@[path]withRowAnimation:UITableViewRowAnimationBottom];
    
    
    
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
