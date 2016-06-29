//
//  LOLListNetManager.m
//  myProject
//
//  Created by ios on 16/6/29.
//  Copyright © 2016年 dozer. All rights reserved.
//

#import "LOLListNetManager.h"

@implementation LOLListNetManager

+ (id)getLolListType:(LoLInfoListType)type page:(NSInteger)page complettionHandle:(void (^)(LOLInfomationModel *, NSError *))completionHandle{
    //需要根据不同的类型，设置对应的请求地址
    
    NSString *path = nil;
    switch (type) {
        case LoLInfoListTypeZuiXin:
            path = [NSString stringWithFormat:@"http://lol.zhangyoubao.com/apis/rest/ItemsService/lists?catid=10178&cattype=news&page=%@&i_=866002024907023&t_=1445516521737&p_=7556&v_=400603&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=19&cha=baiduMartket&u_=&",@(page)];
            break;
        case LoLInfoListTypeXinWen:
            path = [NSString stringWithFormat:@"http://lol.zhangyoubao.com/apis/rest/ItemsService/lists?catid=10000&cattype=news&page=%@&i_=866002024907023&t_=1445516566355&p_=21410&v_=400603&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=19&cha=baiduMartket&u_=&",@(page)];
            break;
        case LoLInfoListTypeSaiShi:
            path = [NSString stringWithFormat:@"http://lol.zhangyoubao.com/apis/rest/ItemsService/lists?catid=10006&cattype=news&page=%@&i_=866002024907023&t_=1445520098311&p_=27278&v_=400603&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=19&cha=baiduMartket&u_=&",@(page)];
            break;
        case LoLInfoListTypeYuLe:
            path = [NSString stringWithFormat:@"http://lol.zhangyoubao.com/apis/rest/ItemsService/lists?catid=10179&cattype=news&page=%@&i_=866002024907023&t_=1445516575968&p_=20249&v_=400603&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=19&cha=baiduMartket&u_=&",@(page)];
            break;
            
        default:
            break;
    }
    //只要请求下来的数据共用一个解析类就可以合写
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([LOLInfomationModel mj_objectWithKeyValues:responseObj],error);
    }];
}

@end
