//
//  LOLInfomationCell.h
//  myProject
//
//  Created by ios on 16/6/29.
//  Copyright © 2016年 dozer. All rights reserved.
//  LOLInfomationCell：资讯首页带图片的Cell
//  默认没有图片的Cell:即系统自带的UITableViewCell

#import <UIKit/UIKit.h>

@interface LOLInfomationCell : UITableViewCell

@property(nonatomic,strong)UIImageView *videoView;
@property(nonatomic,strong)UILabel *titleLb;
@property(nonatomic,strong)UILabel *descLb;

@end
