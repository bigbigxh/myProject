//
//  UIColor+mycolor.m
//  testRuntime
//
//  Created by ios on 16/6/23.
//  Copyright © 2016年 raaawww. All rights reserved.
//

#import "UIColor+mycolor.h"

@implementation UIColor (mycolor)

/*
 思路：在程序启动时注册NSUserDefaults的kindModel为day,即默认模式为日间模式
      然后写两个plist文件保存日间模式和夜间模式下的各种背景颜色啊，文字的颜色啊等等。。
      最后写个category，在这里判断NSUserDefaults里存的当前模式是什么（在需要的地方，改变NSUserDefaults的值就好），去相应的文件读取rgb数据，然后通过类方法返回。
 
 tip:plist的类型要为array，array下为dictionary，每个dictionary装rgb，在本例子中只写了cell的背景颜色和label的字体颜色。。。在两个文件中，装cell的背景颜色的dic和装label字体颜色的dic 在array里的顺序要一样！！！
     在本day/night.plist文件中，item0代表label字体颜色的dic，item1代表cell背景颜色的dic
 orange,后面加的
 */
//资讯
+ (UIColor *)InfoCellTitleColor{
    //这里不用判断是因为 NSUserDefaults存的直接就是文件的名字
    NSString *str = [[NSUserDefaults standardUserDefaults] objectForKey:@"kindModel"];
    NSString *path = [[NSBundle mainBundle] pathForResource:str ofType:@"plist"];
    
    NSArray *arr = [NSArray arrayWithContentsOfFile:path];
    //255 255 255 是纯白，查看day.plist可以看到item1存的rgb才是白色的，所以item1才是背景颜色的dic 。才是Cell的背景颜色，在night.plist文件中也是一样
    //所以item0才是label的文字颜色
    NSDictionary *dic = [arr objectAtIndex:0];
    NSInteger r = [[dic valueForKey:@"r"] integerValue];
    NSInteger g = [[dic valueForKey:@"g"] integerValue];
    NSInteger b = [[dic valueForKey:@"b"] integerValue];
    
    UIColor *theColor = [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0];
    
    return theColor;
}
+ (UIColor *)InfoCellDescColor{
    NSString *str = [[NSUserDefaults standardUserDefaults] objectForKey:@"kindModel"];
    NSString *path = [[NSBundle mainBundle] pathForResource:str ofType:@"plist"];
    
    NSArray *arr = [NSArray arrayWithContentsOfFile:path];
    NSDictionary *dic = [arr objectAtIndex:1];
    NSInteger r = [[dic valueForKey:@"r"] integerValue];
    NSInteger g = [[dic valueForKey:@"g"] integerValue];
    NSInteger b = [[dic valueForKey:@"b"] integerValue];
    
    UIColor *theColor = [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0];
    
    return theColor;
}

+ (UIColor *)InfoCellBackGroundColor{
    NSString *str = [[NSUserDefaults standardUserDefaults] objectForKey:@"kindModel"];
    NSString *path = [[NSBundle mainBundle] pathForResource:str ofType:@"plist"];
    
    NSArray *arr = [NSArray arrayWithContentsOfFile:path];
    NSDictionary *dic = [arr objectAtIndex:2];
    NSInteger r = [[dic valueForKey:@"r"] integerValue];
    NSInteger g = [[dic valueForKey:@"g"] integerValue];
    NSInteger b = [[dic valueForKey:@"b"] integerValue];
    
    UIColor *theColor = [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0];
    
    return theColor;
}
//视频
+ (UIColor *)VideoItemTypeColor{
    NSString *str = [[NSUserDefaults standardUserDefaults] objectForKey:@"kindModel"];
    NSString *path = [[NSBundle mainBundle] pathForResource:str ofType:@"plist"];
    
    NSArray *arr = [NSArray arrayWithContentsOfFile:path];
    NSDictionary *dic = [arr objectAtIndex:3];
    NSInteger r = [[dic valueForKey:@"r"] integerValue];
    NSInteger g = [[dic valueForKey:@"g"] integerValue];
    NSInteger b = [[dic valueForKey:@"b"] integerValue];
    
    UIColor *theColor = [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0];
    
    return theColor;
}
+ (UIColor *)VideoItemBackGroundColor{
    NSString *str = [[NSUserDefaults standardUserDefaults] objectForKey:@"kindModel"];
    NSString *path = [[NSBundle mainBundle] pathForResource:str ofType:@"plist"];
    
    NSArray *arr = [NSArray arrayWithContentsOfFile:path];
    NSDictionary *dic = [arr objectAtIndex:4];
    NSInteger r = [[dic valueForKey:@"r"] integerValue];
    NSInteger g = [[dic valueForKey:@"g"] integerValue];
    NSInteger b = [[dic valueForKey:@"b"] integerValue];
    
    UIColor *theColor = [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0];
    
    return theColor;
}
+ (UIColor *)VideoItemImgBorderColor{
    NSString *str = [[NSUserDefaults standardUserDefaults] objectForKey:@"kindModel"];
    NSString *path = [[NSBundle mainBundle] pathForResource:str ofType:@"plist"];
    
    NSArray *arr = [NSArray arrayWithContentsOfFile:path];
    NSDictionary *dic = [arr objectAtIndex:5];
    NSInteger r = [[dic valueForKey:@"r"] integerValue];
    NSInteger g = [[dic valueForKey:@"g"] integerValue];
    NSInteger b = [[dic valueForKey:@"b"] integerValue];
    
    UIColor *theColor = [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0];
    
    return theColor;
}
//周免英雄
+ (UIColor *)HeroNameColor{
    NSString *str = [[NSUserDefaults standardUserDefaults] objectForKey:@"kindModel"];
    NSString *path = [[NSBundle mainBundle] pathForResource:str ofType:@"plist"];
    
    NSArray *arr = [NSArray arrayWithContentsOfFile:path];
    NSDictionary *dic = [arr objectAtIndex:6];
    NSInteger r = [[dic valueForKey:@"r"] integerValue];
    NSInteger g = [[dic valueForKey:@"g"] integerValue];
    NSInteger b = [[dic valueForKey:@"b"] integerValue];
    
    UIColor *theColor = [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0];
    
    return theColor;
}
+ (UIColor *)HeroCointColor{
    NSString *str = [[NSUserDefaults standardUserDefaults] objectForKey:@"kindModel"];
    NSString *path = [[NSBundle mainBundle] pathForResource:str ofType:@"plist"];
    
    NSArray *arr = [NSArray arrayWithContentsOfFile:path];
    NSDictionary *dic = [arr objectAtIndex:7];
    NSInteger r = [[dic valueForKey:@"r"] integerValue];
    NSInteger g = [[dic valueForKey:@"g"] integerValue];
    NSInteger b = [[dic valueForKey:@"b"] integerValue];
    
    UIColor *theColor = [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0];
    
    return theColor;
}
+ (UIColor *)HeroCellBackGroundColor{
    NSString *str = [[NSUserDefaults standardUserDefaults] objectForKey:@"kindModel"];
    NSString *path = [[NSBundle mainBundle] pathForResource:str ofType:@"plist"];
    
    NSArray *arr = [NSArray arrayWithContentsOfFile:path];
    NSDictionary *dic = [arr objectAtIndex:8];
    NSInteger r = [[dic valueForKey:@"r"] integerValue];
    NSInteger g = [[dic valueForKey:@"g"] integerValue];
    NSInteger b = [[dic valueForKey:@"b"] integerValue];
    
    UIColor *theColor = [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0];
    
    return theColor;
}
//社区
+ (UIColor *)CommunityNameColor{
    NSString *str = [[NSUserDefaults standardUserDefaults] objectForKey:@"kindModel"];
    NSString *path = [[NSBundle mainBundle] pathForResource:str ofType:@"plist"];
    
    NSArray *arr = [NSArray arrayWithContentsOfFile:path];
    NSDictionary *dic = [arr objectAtIndex:9];
    NSInteger r = [[dic valueForKey:@"r"] integerValue];
    NSInteger g = [[dic valueForKey:@"g"] integerValue];
    NSInteger b = [[dic valueForKey:@"b"] integerValue];
    
    UIColor *theColor = [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0];
    
    return theColor;
}
+ (UIColor *)CommunityNickNameColor{
    NSString *str = [[NSUserDefaults standardUserDefaults] objectForKey:@"kindModel"];
    NSString *path = [[NSBundle mainBundle] pathForResource:str ofType:@"plist"];
    
    NSArray *arr = [NSArray arrayWithContentsOfFile:path];
    NSDictionary *dic = [arr objectAtIndex:10];
    NSInteger r = [[dic valueForKey:@"r"] integerValue];
    NSInteger g = [[dic valueForKey:@"g"] integerValue];
    NSInteger b = [[dic valueForKey:@"b"] integerValue];
    
    UIColor *theColor = [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0];
    
    return theColor;
}
+ (UIColor *)CommunityMsgColor{
    NSString *str = [[NSUserDefaults standardUserDefaults] objectForKey:@"kindModel"];
    NSString *path = [[NSBundle mainBundle] pathForResource:str ofType:@"plist"];
    
    NSArray *arr = [NSArray arrayWithContentsOfFile:path];
    NSDictionary *dic = [arr objectAtIndex:11];
    NSInteger r = [[dic valueForKey:@"r"] integerValue];
    NSInteger g = [[dic valueForKey:@"g"] integerValue];
    NSInteger b = [[dic valueForKey:@"b"] integerValue];
    
    UIColor *theColor = [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0];
    
    return theColor;
}
+ (UIColor *)CommunityCellBackGroundColor{
    NSString *str = [[NSUserDefaults standardUserDefaults] objectForKey:@"kindModel"];
    NSString *path = [[NSBundle mainBundle] pathForResource:str ofType:@"plist"];
    
    NSArray *arr = [NSArray arrayWithContentsOfFile:path];
    NSDictionary *dic = [arr objectAtIndex:12];
    NSInteger r = [[dic valueForKey:@"r"] integerValue];
    NSInteger g = [[dic valueForKey:@"g"] integerValue];
    NSInteger b = [[dic valueForKey:@"b"] integerValue];
    
    UIColor *theColor = [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0];
    
    return theColor;
}
//更多
+ (UIColor *)MoreMenuTextColor{
    NSString *str = [[NSUserDefaults standardUserDefaults] objectForKey:@"kindModel"];
    NSString *path = [[NSBundle mainBundle] pathForResource:str ofType:@"plist"];
    
    NSArray *arr = [NSArray arrayWithContentsOfFile:path];
    NSDictionary *dic = [arr objectAtIndex:13];
    NSInteger r = [[dic valueForKey:@"r"] integerValue];
    NSInteger g = [[dic valueForKey:@"g"] integerValue];
    NSInteger b = [[dic valueForKey:@"b"] integerValue];
    
    UIColor *theColor = [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0];
    
    return theColor;
}
+ (UIColor *)MoreItemBackGroundColor{
    NSString *str = [[NSUserDefaults standardUserDefaults] objectForKey:@"kindModel"];
    NSString *path = [[NSBundle mainBundle] pathForResource:str ofType:@"plist"];
    
    NSArray *arr = [NSArray arrayWithContentsOfFile:path];
    NSDictionary *dic = [arr objectAtIndex:14];
    NSInteger r = [[dic valueForKey:@"r"] integerValue];
    NSInteger g = [[dic valueForKey:@"g"] integerValue];
    NSInteger b = [[dic valueForKey:@"b"] integerValue];
    
    UIColor *theColor = [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0];
    
    return theColor;
}

@end
