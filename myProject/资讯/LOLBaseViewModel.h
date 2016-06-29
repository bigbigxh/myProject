//
//  LOLBaseViewModel.h
//  myProject
//
//  Created by ios on 16/6/29.
//  Copyright © 2016年 dozer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LOLBaseViewModel : NSObject


-(void)refreshDataCompleteHandle:(void(^)(NSError *error))completeHandle;
-(void)getMoreDataCompleteHandle:(void(^)(NSError *error))completeHandle;

@end
