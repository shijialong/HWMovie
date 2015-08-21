//
//  CinemaViewController.m
//  HWMovie
//
//  Created by huiwen on 15/7/17.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import "CinemaViewController.h"
#import "BaesNavigationController.h"
#import "BaseViewController.h"
#import "DataService.h"
#import "DistrictModal.h"
#import "CinemaListModal.h"
#import "CinemaTableViewCell.h"



@interface CinemaViewController ()

@end

@implementation CinemaViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"影院";
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
     [self _loadData];
    [self _createArrayCinemaInDistrict];
    
    [self _createCinemaTabelView];
    
   
    // Do any additional setup after loading the view.
}


#pragma mark - loadData

- (void)_loadData {
   
    
    //下载地区列表
    _districtModalArray = [[NSMutableArray alloc] init];
    
    NSDictionary *dic = [DataService getJsonDataFromFile:@"district_list.json"];
    NSArray *districtList = [dic objectForKey:@"districtList"];
    for (NSDictionary *dic in districtList) {
        DistrictModal *modal = [[DistrictModal alloc] init];
        

        [modal setValuesForKeysWithDictionary:dic];
        
        [_districtModalArray addObject:modal];
    }
    
    //下载影院列表
    
    _cinemaListModalArray = [[NSMutableArray alloc] init];
    
    NSDictionary *cinemaDic = [DataService getJsonDataFromFile:@"cinema_list.json"];
    NSArray *cinemaList = [cinemaDic objectForKey:@"cinemaList"];
    for (NSDictionary *dic in cinemaList) {
        CinemaListModal *modal = [[CinemaListModal alloc] init];
        [modal setValuesForKeysWithDictionary:dic];
        [_cinemaListModalArray addObject:modal];
    }
    
}

/**把地区与电影院对应
 *
 *  {
 *   1      { name : "朝阳区"
 *            cinema : modal 1   modal 2    modal 3
 *          }
 *   2     {
 *
 *          }
 *   3
 *
 *  }
 */

- (void)_createArrayCinemaInDistrict {
    _cinemaInDistrict = [[NSMutableArray alloc] init];
    for (int i = 0; i<_districtModalArray.count; i++) {
        NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
        NSMutableArray *array = [[NSMutableArray alloc ] init];
        
        for (int j= 0; j<_cinemaListModalArray.count; j++) {
            if ([[_districtModalArray[i] id] isEqualToString:[_cinemaListModalArray[j] districtId]]) {
                [array addObject:_cinemaListModalArray
                 [j]];
            }
        }
        [dic setValue:[_districtModalArray[i] name] forKey:@"name"];
        [dic setObject:array forKey:@"cinema"];
        [_cinemaInDistrict addObject:dic];
       // NSLog(@"%@",_cinemaInDistrict);
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - CreateSubViews

- (void)_createCinemaTabelView {
    _cinemaTableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    _cinemaTableView.dataSource = self;
    _cinemaTableView.delegate = self;
    
    [self.view addSubview:_cinemaTableView];
    
    UINib *nib = [UINib nibWithNibName:@"CinemaTableViewCell" bundle:[NSBundle mainBundle]];
    [_cinemaTableView registerNib:nib forCellReuseIdentifier:@"cell"];
}


#pragma mark - UITableView Delgate


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _cinemaInDistrict.count;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
   // _cinemaInDistrict = [[NSMutableArray alloc] init];
    
   // DistrictModal *districtModal = [[DistrictModal alloc] init];
    //districtModal = _districtModalArray[section];
    
   // CinemaListModal *cinemaModal = [[CinemaListModal alloc] init];
    
    
    //for (int i = 0; i < _cinemaListModalArray.count; i++) {
//        cinemaModal = _cinemaListModalArray[i];
//        if ([districtModal.id isEqualToString:cinemaModal.districtId]) {
//            [_cinemaInDistrict addObject:cinemaModal];
//        }
//        
//    }
    
    NSDictionary *dic = _cinemaInDistrict[section];
    
    NSArray *cinema = [dic objectForKey:@"cinema"];
    if (flags[section] == 0) {
        return 0;
    }
   // NSLog(@"%ld",_cinemaInDistrict.count);
    return cinema.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CinemaTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    
    NSDictionary *dic = _cinemaInDistrict[indexPath.section];
    NSArray *cinema = [dic objectForKey:@"cinema"];
    CinemaListModal *modal =  cinema[indexPath.row];
    cell.modal = modal;
    
    //添加一个向左的指示箭头
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
  
    return cell;
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}



- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIButton *button = [[UIButton alloc] init];
    //    [button setBackgroundImage:[UIImage imageNamed:@"tableCell_common"] forState:UIControlStateNormal];
    
    DistrictModal *modal = [[DistrictModal alloc] init];
    modal = _districtModalArray[section];
    NSString *name = modal.name;
    [button setBackgroundImage:[UIImage imageNamed:@"btnbg_blue"] forState:UIControlStateNormal];
    [button setTitle:name forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    //设置让button的title左对齐
    // button.titleLabel.textAlignment = NSTextAlignmentLeft; 这句无效
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
   // button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    
    button.tag = section;
    
    [button addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    return button;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 60;
}



- (void)btnAction:(UIButton *)button {
    NSInteger index = button.tag;
    
    flags[index] = !flags[index];
    
    //指定刷新组
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:index];
    [_cinemaTableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationFade];
    
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
