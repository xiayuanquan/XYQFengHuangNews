//
//  DetailViewController.m
//  凤凰新闻客户端
//
//  Created by ma c on 15/11/14.
//  Copyright (c) 2015年 xiayuanquan. All rights reserved.
//

#import "DetailViewController.h"
#import "const.h"
#import "IFItemNews.h"

@interface DetailViewController ()
@property (strong,nonatomic)UIView  *topView;
@property (strong,nonatomic)UIButton *backButton;
@property (strong,nonatomic)UIWebView *webView;
@end

@implementation DetailViewController

-(instancetype)init
{
    self = [super init];
    if (self)
    {
        _topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 40)];
        _topView.backgroundColor = [UIColor lightGrayColor];
        
        
        _backButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 5, 80, 30)];
        [_backButton setTitle:@"返回" forState:UIControlStateNormal];
        [_backButton setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
        [_backButton setImage:[UIImage imageNamed:@"appwidget_pre_btn_default"] forState:UIControlStateNormal];
        
        
        self.webView = [[UIWebView alloc]init];
        self.webView.backgroundColor = [UIColor lightGrayColor];
        self.webView.frame = CGRectMake(0, 40, ScreenWidth, Screenheight - 40);
        
        
        [_topView addSubview:_backButton];
        [self.view addSubview:_topView];
        [self.view addSubview:self.webView];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //注册成为通知中心观察者
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(showDetailText:) name:@"DetailVC" object:nil];
    
    [_backButton addTarget:self action:@selector(dismissModalWindow:) forControlEvents:UIControlEventTouchUpInside];
}

//处理通知事件
-(void)showDetailText:(NSNotification *)notification
{
    IFItemNews *itemEntity = notification.object;
    
    NSDictionary *dic = itemEntity.link;
    NSURL *URL = [NSURL URLWithString:[dic objectForKey:@"url"]];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    [self.webView loadRequest:request];
}

//关闭模态窗口
-(void)dismissModalWindow:(UIButton *)sender
{
    [self.view.window.rootViewController dismissViewControllerAnimated:YES completion:nil];
    [self.backButton setImage:nil forState:UIControlStateNormal];
    [self.backButton setTitle:@"" forState:UIControlStateNormal];
}

//取消通知
-(void)dealloc
{
  [[NSNotificationCenter defaultCenter]removeObserver:self name:@"DetailVC" object:nil];
}
@end
