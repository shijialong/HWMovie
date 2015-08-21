//
//  MovieViewController.m
//  HWMovie
//
//  Created by huiwen on 15/7/17.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import "MovieViewController.h"
#import "BaesNavigationController.h"
#import "BaseViewController.h"
#import "MovieModal.h"
#import "MovieCell.h"


@interface MovieViewController ()


@end

@implementation MovieViewController

#pragma mark - MainViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"电影";
    }
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    //self.view.backgroundColor = [UIColor redColor];
    [self _createNav];
    [self _createPosterView];
    [self _createMovieTableView];
    
    [self _loadData];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}

#pragma mark - LoadData

- (void)_loadData {
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"us_box.json" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    
    _movieModalArray = [[NSMutableArray alloc] init];
    //直接把文件里的数据解析放到 数组或者字典
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    
    NSArray *subjects = [dic objectForKey:@"subjects"];
    
    for (NSDictionary *dic in subjects) {
        NSDictionary *subject = [dic objectForKey:@"subject"];
        MovieModal *modal = [[MovieModal alloc] init];
        modal.title = [subject objectForKey:@"title"];
        modal.year = [subject objectForKey:@"year"];
        modal.images = [subject objectForKey:@"images"];
        NSNumber *number = [[subject objectForKey:@"rating"]objectForKey:@"average"];
        modal.average = [number floatValue];
        [_movieModalArray addObject:modal];
    }
    
    _posterView.movieModalArray = _movieModalArray;
        
}

#pragma mark - CreateSubViews

- (void)_createNav {
    
    UIView *flipView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn1 setImage:[UIImage imageNamed:@"list_home"] forState:UIControlStateNormal];
    [btn1 setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home"] forState:UIControlStateNormal];
    
    btn1.tag = 1;
    
    [btn1 sizeToFit];
    [btn1 addTarget:self action:@selector(flipAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [flipView addSubview:btn1];
    
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn2 setImage:[UIImage imageNamed:@"poster_home"] forState:UIControlStateNormal];
    [btn2 setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home"] forState:UIControlStateNormal];
    
    btn2.tag = 2;
    
    [btn2 sizeToFit];
    [btn2 addTarget:self action:@selector(flipAction:) forControlEvents:UIControlEventTouchUpInside];
    [flipView addSubview:btn2];
    btn2.hidden = YES;
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:flipView];
    
    self.navigationItem.rightBarButtonItem = item;
}


- (void)_createPosterView {
    _posterView = [[PosterView alloc] initWithFrame:self.view.bounds];
    //_posterView.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:_posterView];
}


- (void)_createMovieTableView {
    
    _movieTableView = [[UITableView alloc] initWithFrame:self.view.bounds];

    _movieTableView.dataSource = self;
    _movieTableView.delegate = self;
    
    _movieTableView.hidden = YES;
    [self.view addSubview:_movieTableView];
    
    //注册 单元格 当创建cell对象的时候不是调用alloc创建，会调用awakeFromNib
    UINib *nib = [UINib nibWithNibName:@"MovieCell" bundle:[NSBundle mainBundle]];
    [_movieTableView registerNib:nib forCellReuseIdentifier:@"cell"];
}


#pragma mark - Action
- (void)flipAction:(UIButton *)button {
    
    UIView *flipView = self.navigationItem.rightBarButtonItem.customView;
    
    UIButton *btn1 = (UIButton *)[flipView viewWithTag:1];
    UIButton *btn2 = (UIButton *)[flipView viewWithTag:2];
    
    BOOL isLeft = btn2.hidden;
    
    [self _flipView:flipView isLeft:isLeft];
    [self _flipView:self.view isLeft:isLeft];
    
    btn1.hidden = !btn1.hidden;
    btn2.hidden = !btn2.hidden;
    
    _posterView.hidden = !_posterView.hidden;
    _movieTableView.hidden = !_movieTableView.hidden;
}

#pragma mark - Tools
- (void)_flipView:(UIView *)view isLeft:(BOOL)left {
    
    UIViewAnimationOptions option = left?UIViewAnimationOptionTransitionFlipFromLeft:UIViewAnimationOptionTransitionFlipFromRight;
    
    [UIView transitionWithView:view duration:0.5 options:option animations:nil completion:nil];
}


#pragma mark - UITableView Delgate


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _movieModalArray.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //只要注册 cell一定不为nil
    MovieCell  *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    MovieModal *modal = _movieModalArray[indexPath.row];
    
    cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
    cell.modal = modal;
    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
//    }
//    MovieModal *modal = _movieModalArray[indexPath.row];
//    cell.textLabel.text = modal.title;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90;
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
