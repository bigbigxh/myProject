//
//  LOLInfomationWeb.m
//  myProject
//
//  Created by ios on 16/7/1.
//  Copyright © 2016年 dozer. All rights reserved.
//

#import "LOLInfomationWeb.h"
#import <WebKit/WebKit.h>


@interface LOLInfomationWeb ()<WKNavigationDelegate,WKUIDelegate,UIScrollViewDelegate>

@property(nonatomic,strong)WKWebView *webView;

@property(nonatomic,getter=isHiddenBar)BOOL hiddenBar;

@property(nonatomic,strong)UIPanGestureRecognizer *pangesture;

@end

@implementation LOLInfomationWeb

- (WKWebView *)webView{
    if (!_webView) {
        WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc]init];
        configuration.suppressesIncrementalRendering = YES;
        _webView = [[WKWebView alloc]initWithFrame:CGRectMake(0, 0, kWindowW, kWindowH) configuration:configuration];
        _webView.navigationDelegate = self;
        _webView.UIDelegate = self;
        _webView.allowsBackForwardNavigationGestures = YES;
//        _webView.scrollView.delegate = self;
        //地址为详情地址
        NSString *path = [NSString stringWithFormat:@"http://lol.zhangyoubao.com/mobiles/item/%@?v_=400606&token=9106edd4bac1f8ab738adc3a17630480839b&user_id=13360447&size=middle&t=1446431148",_Id];
        NSURL *url = [NSURL URLWithString:path];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [_webView loadRequest:request];
    }
    return _webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.webView];
    self.hiddenBar = NO;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(HiddenBarOrShowBar)];
    
    [self.webView addGestureRecognizer:tap];
}
//添加点击一下隐藏导航栏
- (void)HiddenBarOrShowBar{
    
    NSLog(@"00000");
    self.hiddenBar = !self.isHiddenBar;
    if (self.isHiddenBar == YES) {
        [UIView animateWithDuration:0.7 animations:^{
            [self.navigationController setNavigationBarHidden:YES animated:YES];
            self.webView.frame = CGRectMake(0, 20, kWindowW, kWindowH - 20);
        }];
    }else if (self.isHiddenBar == NO){
        [UIView animateWithDuration:0.7 animations:^{
            [self.navigationController setNavigationBarHidden:NO animated:YES];
            self.webView.frame = CGRectMake(0, 64, kWindowW, kWindowH - 64);
        }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    NSLog(@"开始请求");
    
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    self.navigationItem.title = self.webView.title;
    NSLog(@"请求完成");
}

- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error{
    NSLog(@"加载失败");
}



//通过判断上下滑动的速率进行 隐藏UINavigationBar
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    UIPanGestureRecognizer *pan = scrollView.panGestureRecognizer;
//    CGFloat velocity = [pan velocityInView:self.webView].y;
//    if (velocity < -100) {
//        [UIView animateWithDuration:0.5 animations:^{
//            [self.navigationController setNavigationBarHidden:YES animated:YES];
//            self.webView.frame = CGRectMake(0, 20, kWindowW, kWindowH - 20);
//        }];
//    }else if (velocity > 100){
//        [UIView animateWithDuration:0.7 animations:^{
//            [self.navigationController setNavigationBarHidden:NO animated:YES];
//            self.webView.frame = CGRectMake(0, 64, kWindowW, kWindowH - 64);
//        }];
//    }
//}

@end
