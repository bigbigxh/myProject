//
//  LOLInfomationCollection.m
//  myProject
//
//  Created by ios on 16/6/29.
//  Copyright © 2016年 dozer. All rights reserved.
//

#import "LOLInfomationCollection.h"
#import "LOLInfomationVM.h"
#import "LOLInfomationCon.h"

@interface LOLInfomationCollection ()

@end

@implementation LOLInfomationCollection

- (instancetype)init{
    if (self = [super init]) {
        self.titles = [self itemNames];
        self.viewControllerClasses = [self ControllersClassess];
        self.keys = [self vckeys];
        self.values = [self vcValues];
    }
    return self;
}

- (NSArray *)vckeys{
    NSMutableArray *arr = [NSMutableArray new];
    for (id obj in [self itemNames]) {
        [arr addObject:@"infoType"];
    }
    return [arr copy];
}
- (NSArray *)vcValues{
    NSMutableArray *arr = [NSMutableArray new];
    for (NSInteger i=0; i<4; i++) {
        [arr addObject:@(i)];
    }
    return arr;
}
- (NSArray *)itemNames{
    return @[@"最新",@"新闻",@"娱乐",@"赛事"];
}

- (NSArray *)ControllersClassess{
    NSMutableArray *arr = [NSMutableArray new];
    for (id obj in [self itemNames]) {
        [arr addObject:[LOLInfomationCon class]];
    }
    return [arr copy];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.values = [self ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
