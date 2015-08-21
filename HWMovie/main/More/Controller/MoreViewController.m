//
//  MoreViewController.m
//  HWMovie
//
//  Created by huiwen on 15/7/17.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import "MoreViewController.h"
#import "BaesNavigationController.h"
#import "BaseViewController.h"

@interface MoreViewController ()


@end

@implementation MoreViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"更多";
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [_tableView reloadData];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self _loadData];
    [self _createTableView];

    // Do any additional setup after loading the view.
}


- (void)_loadData {
    
    _imageNames = @[@"moreClear",@"moreScore",@"moreVersion",@"moreBusiness",@"moreWelcome",@"moreAbout"];
    _titles = @[@"清除缓存",@"给个评价",@"检查新版本",@"商务合作",@"欢迎页",@"关于"];
}
- (void)_createTableView {
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _titles.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
        cell.backgroundColor = [UIColor clearColor];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 40, 40)];
        imageView.tag = 1;
        [cell.contentView addSubview:imageView];
        
        
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 15, 200, 30)];
        titleLabel.tag = 2;
        titleLabel.font = [UIFont boldSystemFontOfSize:18];
        titleLabel.textColor = [UIColor whiteColor];
        [cell.contentView addSubview:titleLabel];
    }
    cell.imageView.image = [UIImage imageNamed:_imageNames[indexPath.row]];
    cell.textLabel.text = _titles[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"是否清除缓存" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确认", nil];
       [alert show];
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
