//
//  LOLInfomationCon.m
//  myProject
//
//  Created by ios on 16/6/29.
//  Copyright © 2016年 dozer. All rights reserved.
//

#import "LOLInfomationCon.h"
#import "LOLInfomationCell.h"
#import "LOLInfomationVM.h"

@interface LOLInfomationCon ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)LOLInfomationVM *viewModel;

@end

@implementation LOLInfomationCon

static NSString * const InfoResufier = @"Infomation";
static NSString * const DefaultResufier = @"DefaultCell";
static NSInteger const spaceToLeft = 15;
static NSInteger const spaceToRight = -15;
static NSInteger const spaceToTop = 15;
static NSInteger const spaceToLast = 10;

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kWindowW, kWindowH) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 82;
        _tableView.showsVerticalScrollIndicator = NO;//隐藏滚动条
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:DefaultResufier];
        [_tableView registerClass:[LOLInfomationCell class] forCellReuseIdentifier:InfoResufier];
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.viewModel refreshDataCompleteHandle:^(NSError *error) {
                [_tableView.mj_header endRefreshing];
                [_tableView reloadData];
            }];
        }];
        _tableView.mj_footer = [MJRefreshBackFooter footerWithRefreshingBlock:^{
            [self.viewModel getMoreDataCompleteHandle:^(NSError *error) {
                [self.tableView.mj_footer endRefreshing];
                [_tableView reloadData];
            }];
        }];
    }
    return _tableView;
}
- (LOLInfomationVM *)viewModel{
    if (!_viewModel) {
        _viewModel = [[LOLInfomationVM alloc]initWithLoLInfoListType:LoLInfoListTypeZuiXin];
    }
    return _viewModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"资讯";
    [self.view addSubview:self.tableView];
    
    [self.tableView.mj_header beginRefreshing];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.viewModel.rowNum == 0) {
//        这里应该弹出提示框
        return 0;
    }
    return self.viewModel.rowNum;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([self.viewModel picForRow:indexPath.row].length > 4) {
        LOLInfomationCell *cell = [tableView dequeueReusableCellWithIdentifier:InfoResufier];
        [cell.videoView  sd_setImageWithURL:[NSURL URLWithString:[self.viewModel picForRow:indexPath.row]]];
        cell.titleLb.text = [self.viewModel titleForRow:indexPath.row];
        cell.descLb.text = [self.viewModel descForRow:indexPath.row];
        
        return cell;
    }else{
        UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:DefaultResufier];
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        cell.textLabel.text = [self.viewModel titleForRow:indexPath.row];
        [cell.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(spaceToLeft);
            make.top.mas_equalTo(spaceToTop);
        }];
        cell.detailTextLabel.font = [UIFont systemFontOfSize:13];
        cell.detailTextLabel.text = [self.viewModel descForRow:indexPath.row];
        [cell.detailTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(spaceToLeft);
            make.top.mas_equalTo(cell.textLabel.mas_bottom).mas_equalTo(spaceToLast);
            make.right.mas_equalTo(spaceToRight);
        }];
#pragma mark - 这里要对Color做分类
        cell.detailTextLabel.textColor = [UIColor grayColor];
        cell.detailTextLabel.numberOfLines = 0;
        
        return cell;
    }
}

kRemoveCellSeparator;
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
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
