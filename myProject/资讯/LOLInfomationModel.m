//
//  LOLInfomationModel.m
//  myProject
//
//  Created by ios on 16/6/29.
//  Copyright © 2016年 dozer. All rights reserved.
//

#import "LOLInfomationModel.h"

@implementation LOLInfomationModel


+ (NSDictionary *)objectClassInArray{
    return @{@"data" : [LOLInfomationData class]};
}
@end
@implementation LOLInfomationData

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"Id":@"id"};
}

@end


