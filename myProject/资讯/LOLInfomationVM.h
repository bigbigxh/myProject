//
//  LOLInfomationVM.h
//  myProject
//
//  Created by ios on 16/6/29.
//  Copyright © 2016年 dozer. All rights reserved.
//

#import "LOLBaseViewModel.h"
#import "LOLListNetManager.h"

@interface LOLInfomationVM : LOLBaseViewModel

@property(nonatomic,strong)NSMutableArray *dataArr;//用来存储请求下来的数据
@property(nonatomic)NSInteger rowNum;//返回数组的长度
@property(nonatomic)NSInteger CurrentPage;//当前返回信息的页数

- (NSString *)titleForRow:(NSInteger)row;//返回标题
- (NSString *)descForRow:(NSInteger)row;//返回详情信息
- (NSString *)picForRow:(NSInteger)row;//返回图片地址
- (NSString *)videoForRow:(NSInteger)row;//视频地址
- (NSString *)IdForRow:(NSInteger)row;//返回Id作为参数传入详情页面

//区分是请求哪个类型的数据
@property(nonatomic)LoLInfoListType type;
- (id)initWithLoLInfoListType:(LoLInfoListType)type;


@end
