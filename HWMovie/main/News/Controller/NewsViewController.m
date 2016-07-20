//
//  NewsViewController.m
//  HWMovie
//
//  Created by huiwen on 15/7/17.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import "NewsViewController.h"
#import "BaesNavigationController.h"
#import "BaseViewController.h"
#import "NewsModal.h"
#import "NewsTableViewCell.h"
#import "common.h"
#import "UIViewExt.h"
#import "UIImageView+WebCache.h"
#import "NewImageListViewController.h"
#import "NewsDetailViewController.h"


@interface NewsViewController ()

@end

@implementation NewsViewController


#pragma mark - MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"新闻是的是的";
//        self.title = @"新闻是的是的";
//        self.title = @"新闻是的是的";
//        self.title = @"新闻是的是的";
    }
 
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _createNewsTableView];
    [self _createHeaderView];
    
    [self _loadData];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - LoadData

- (void)_loadData {
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"news_list.json" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    
    _newsModalArray = [[NSMutableArray alloc] init];
    
    NSArray *newsArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
//    for (int i=0; i<listArray.count; i++) {
//        NSDictionary *news = newsArray[i];
//        NewsModal *modal = [[NewsModal alloc] init];
//        modal.title = [news objectForKey:@"title"];
//        modal.summary = [news objectForKey:@"summary"];
//        modal.image = [news objectForKey:@"image"];
//        
//        NSNumber *number = [news objectForKey:@"type"];
//        modal.type = [number integerValue];
//        
//        [_newsModalArray addObject:modal];
//    }
    for (NSDictionary *dic in newsArray) {
        NewsModal *modal = [[NewsModal alloc] init];
        
        [modal setValuesForKeysWithDictionary:dic];
        
        [_newsModalArray addObject:modal];
    }
    
    //设置头条新闻
    
    NewsModal *modal1 = _newsModalArray[0];
    [_headerLabel setText:modal1.title];
    //_headerLabel.text = modal1.title;
    NSLog(@"%@",modal1.title);
    NSLog(@"%@",_headerLabel.text);
    NSURL *url = [NSURL URLWithString:modal1.image];
    [_headerImageView sd_setImageWithURL:url];
    
    [_newsModalArray removeObjectAtIndex:0];
}


#pragma mark - CreateSubViews



- (void)_createHeaderView {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 200)];
    headerView.backgroundColor = [UIColor clearColor];
    _newsTableView.tableHeaderView = headerView;
    
    _headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, kNavHeight, kwidth, 200)];
    
    _headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kwidth, 30)];

    _headerLabel.textColor = [UIColor whiteColor];
    
    //_headerImageView.image = [UIImage imageNamed:@"1"];
    _headerLabel.bottom = _headerImageView.bottom;
    
    
    [self.view addSubview:_headerImageView];
    [self.view addSubview:_headerLabel];
}

- (void)_createNewsTableView {
    _newsTableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    
    //设置tabbar 和 navigationBar 为透明
    self.tabBarController.tabBar.translucent = YES;
    self.navigationController.navigationBar.translucent = YES;
    
    _newsTableView.dataSource = self;
    _newsTableView.delegate = self;
    
    [self.view addSubview:_newsTableView];
    
    //注册单元格
    UINib *nib = [UINib nibWithNibName:@"NewsTableViewCell" bundle:[NSBundle mainBundle]];
    [_newsTableView registerNib:nib forCellReuseIdentifier:@"cell"];
}


#pragma mark - UITableView Delgate 

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _newsModalArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    NewsModal *modal = _newsModalArray[indexPath.row];
    cell.modal = modal;
    
    //添加一个向左的指示箭头
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NewsModal *modal = _newsModalArray[indexPath.row];
    
    if (modal.type == 0) {
        NewsDetailViewController *vc = [[NewsDetailViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else {
        NewImageListViewController *vc = [[NewImageListViewController alloc] init];
        
        [self.navigationController pushViewController:vc animated:YES];
    }
   
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat offY = scrollView.contentOffset.y;
    
    if (offY > -64) {
        _headerImageView.top = -offY;
        _headerLabel.bottom = _headerImageView.bottom;
        
    }else {
        CGFloat newHeight = ABS(offY)-64+200;
        CGFloat newWidth = kwidth/200*newHeight;
        
        _headerImageView.frame =CGRectMake((kwidth - newWidth)/2, 64, newWidth, newHeight);
        _headerLabel.bottom = _headerImageView.bottom;
    }
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
