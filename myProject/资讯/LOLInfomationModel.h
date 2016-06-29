//
//  LOLInfomationModel.h
//  myProject
//
//  Created by ios on 16/6/29.
//  Copyright © 2016年 dozer. All rights reserved.
//

#import "BaseModel.h"

@class LOLInfomationData;
@interface LOLInfomationModel : BaseModel


@property (nonatomic, assign) NSInteger api;

@property (nonatomic, assign) NSInteger code;

@property (nonatomic, strong) NSArray<LOLInfomationData *> *data;

@property (nonatomic, copy) NSString *message;


@end
@interface LOLInfomationData : BaseModel

@property (nonatomic, assign) NSInteger published;

@property (nonatomic, copy) NSString *Id;

@property (nonatomic, copy) NSString *pic_url;

@property (nonatomic, copy) NSString *platform;

@property (nonatomic, assign) NSInteger recommend;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *video_url;

@property (nonatomic, copy) NSString *weight_new;

@property (nonatomic, copy) NSString *desc;

@end

