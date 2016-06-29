//
//  LOLInfomationCell.m
//  myProject
//
//  Created by ios on 16/6/29.
//  Copyright © 2016年 dozer. All rights reserved.
//

#import "LOLInfomationCell.h"

static NSInteger const videoWidth = 50;
static NSInteger const videoHeight = 50;
static NSInteger const spaceToLeft = 15;
static NSInteger const spaceToRight = -15;
static NSInteger const spaceToTop = 15;
static NSInteger const spaceToLast = 10;

@implementation LOLInfomationCell

- (UIImageView *)videoView{
    if (!_videoView) {
        _videoView = [[UIImageView alloc]init];
        [self.contentView addSubview:_videoView];
        [_videoView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(spaceToLeft);
            make.size.mas_equalTo(CGSizeMake(videoWidth, videoHeight));
        }];
    }
    return _videoView;
}
- (UILabel *)titleLb{
    if (!_titleLb) {
        _titleLb = [[UILabel alloc]init];
        _titleLb.font = [UIFont systemFontOfSize:15];
//        _titleLb.textAlignment = NSTextAlignmentLeft;Default is Left
#pragma mark - 这里要对Color写分类，做模式切换
        _titleLb.textColor = [UIColor blackColor];
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.videoView.mas_right).mas_equalTo(spaceToLeft);
            make.top.mas_equalTo(spaceToTop);
        }];
    }
    return _titleLb;
}
- (UILabel *)descLb{
    if (!_descLb) {
        _descLb = [[UILabel alloc]init];
        _descLb.font = [UIFont systemFontOfSize:13];
//        _descLb.textAlignment = NSTextAlignmentLeft;Default is Left
#pragma mark - 这里要对Color写分类，做模式切换
        _descLb.textColor = [UIColor grayColor];
        [self.contentView addSubview:_descLb];
        [_descLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.videoView.mas_right).mas_equalTo(spaceToLeft);
            make.top.mas_equalTo(self.titleLb.mas_bottom).mas_equalTo(spaceToLast);
            make.right.mas_equalTo(spaceToRight);
        }];
    }
    return _descLb;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
