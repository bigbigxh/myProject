//
//  LOLListNetManager.h
//  myProject
//
//  Created by ios on 16/6/29.
//  Copyright © 2016年 dozer. All rights reserved.
//

#import "BaseNetManager.h"
#import "LOLInfomationModel.h"

typedef NS_ENUM(NSUInteger, LoLInfoListType) {
    LoLInfoListTypeZuiXin, //最新
    LoLInfoListTypeXinWen, //新闻
    LoLInfoListTypeSaiShi, //赛事
    LoLInfoListTypeYuLe,   //娱乐
};

@interface LOLListNetManager : BaseNetManager

//通过type来区分 请求的地址
+(id)getLolListType:(LoLInfoListType)type page:(NSInteger)page complettionHandle:(void(^)(LOLInfomationModel *model,NSError *error))completionHandle;

@end
