//
//  LOLInfomationVM.m
//  myProject
//
//  Created by ios on 16/6/29.
//  Copyright © 2016年 dozer. All rights reserved.
//

#import "LOLInfomationVM.h"

@implementation LOLInfomationVM

- (NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray new];
    }
    return _dataArr;
}
- (NSInteger)rowNum{
    return self.dataArr.count;
}
- (LOLInfomationData *)lolDataModelForRow:(NSInteger)row{
    if (self.dataArr.count == 0) {
        return nil;
    }
    return self.dataArr[row];
}
- (NSString *)titleForRow:(NSInteger)row{
    return [self lolDataModelForRow:row].title;
}
- (NSString *)descForRow:(NSInteger)row{
    return [self lolDataModelForRow:row].desc;
}
- (NSString *)picForRow:(NSInteger)row{
    return [self lolDataModelForRow:row].pic_url;
}
- (NSString *)videoForRow:(NSInteger)row{
    return [self lolDataModelForRow:row].video_url;
}
- (NSString *)IdForRow:(NSInteger)row{
    return [self lolDataModelForRow:row].Id;
}
//网络请求
- (void)getDataCompleteHandle:(void(^)(NSError *error))completeHandle{
    [LOLListNetManager getLolListType:_type page:_CurrentPage complettionHandle:^(LOLInfomationModel *model, NSError *error) {
        if (_CurrentPage == 1) {
            [self.dataArr removeAllObjects];
        }
        [self.dataArr addObjectsFromArray:model.data];
        completeHandle(error);
    }];
}

- (void)refreshDataCompleteHandle:(void (^)(NSError *))completeHandle{
    _CurrentPage = 1;
    [self getDataCompleteHandle:completeHandle];
}

- (void)getMoreDataCompleteHandle:(void (^)(NSError *))completeHandle{
    _CurrentPage += 1;
    [self getDataCompleteHandle:completeHandle];
}

- (id)initWithLoLInfoListType:(LoLInfoListType)type{
    if (self = [super init]) {
        _type = type;
    }
    return self;
}

@end
