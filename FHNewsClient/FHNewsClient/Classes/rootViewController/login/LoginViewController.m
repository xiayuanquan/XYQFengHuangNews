//
//  LoginViewController.m
//  凤凰新闻客户端
//
//  Created by ma c on 15/11/15.
//  Copyright (c) 2015年 xiayuanquan. All rights reserved.
//

#import "LoginViewController.h"
#import "const.h"
#import "webToolBar.h"
#import "RegesterViewController.h"

@interface LoginViewController ()<UIWebViewDelegate>
@property (strong,nonatomic)UIToolbar *toolBar;    //工具栏
@property (strong,nonatomic)UIButton *weixinButton;//微信按钮
@property (strong,nonatomic)UIButton *qqButton;    //qq按钮
@property (strong,nonatomic)UIButton *sinaButton;  //新浪按钮
@property (strong,nonatomic)UIButton *loginButton; //登陆按钮
@property (strong,nonatomic)UITextField *accounrNumberTextField;//输入账号的文本框
@property (strong,nonatomic)UITextField *loginPasswordTextField;//输入密码的文本框
@property (strong,nonatomic)UIButton  *forgetPasswordbutton; //忘记密码按钮
@property (strong,nonatomic)UIButton  *regesterbutton; //注册按钮
@property (strong,nonatomic)UIWebView *webView; //网页视图
@property (strong,nonatomic)UIActivityIndicatorView *activityIndicatorView;//活动视图
@property (strong,nonatomic)UIToolbar *webToolBar; //网页视图的工具栏
@end

@implementation LoginViewController
//初始化
-(instancetype)init
{
    self = [super init];
    if (self)
    {
        //工具栏
        _toolBar = [[UIToolbar alloc]init];
        [_toolBar setBarTintColor:[UIColor whiteColor]];
        _toolBar.frame = CGRectMake(0, 0, ScreenWidth, 44);
        [self.view addSubview:_toolBar];
        
        //微信按钮
        _weixinButton = [[UIButton alloc]init];
        _weixinButton.frame = CGRectMake(5, 80, 115, 115);
        [_weixinButton setImage:[UIImage imageNamed:@"account_wechat_bg"] forState:UIControlStateNormal];
        UILabel *weixinLabel = [[UILabel alloc]init];
        weixinLabel.frame = CGRectMake(40, 70, 60, 40);
        weixinLabel.text = @"微信";
        weixinLabel.textColor = [UIColor whiteColor];
        [_weixinButton addSubview:weixinLabel];
        [self.view addSubview:_weixinButton];
        
        //QQ按钮
        _qqButton = [[UIButton alloc]init];
        _qqButton.frame = CGRectMake(130, 80, 115, 115);
        [_qqButton setImage:[UIImage imageNamed:@"account_qzone_bg"] forState:UIControlStateNormal];
        UILabel *qqLabel = [[UILabel alloc]init];
        qqLabel.frame = CGRectMake(45, 70, 60, 40);
        qqLabel.text = @"QQ";
        qqLabel.textColor = [UIColor whiteColor];
        [_qqButton addSubview:qqLabel];
        [self.view addSubview:_qqButton];
        
        //新浪按钮
        _sinaButton = [[UIButton alloc]init];
        _sinaButton.frame = CGRectMake(254, 80, 115, 115);
        [_sinaButton setImage:[UIImage imageNamed:@"account_weibo_bg"] forState:UIControlStateNormal];
        UILabel *sinaLabel = [[UILabel alloc]init];
        sinaLabel.frame = CGRectMake(25, 70, 80, 40);
        sinaLabel.text = @"新浪微博";
        sinaLabel.textColor = [UIColor whiteColor];
        [_sinaButton addSubview:sinaLabel];
        [self.view addSubview:_sinaButton];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
 
    //创建工具栏按钮
    [self addBarButtonItem];
    
    //设置间隔线
    [self setSplitLine];
    
    //设置文本框
    [self setTextField];
    
    //设置忘记密码和注册按钮
    [self setForgetAndRegseterButton];
}

//创建工具栏按钮和标题
-(void)addBarButtonItem
{
    
    //返回按钮
    UIButton *button = [[UIButton alloc]init];
    button.frame = CGRectMake(5, 2, 40, 40);
    [button setImage:[UIImage imageNamed:@"detail_commment_close_button_icon"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(backBarButtonItemClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    
    //登陆标题
    UILabel *titleLabel =[[UILabel alloc]initWithFrame:CGRectMake(170, 0, 40, 40)];
    titleLabel.text = @"登陆";
    titleLabel.font = [UIFont systemFontOfSize:20];
    
    
    [self.toolBar addSubview:titleLabel];
    [self.toolBar addSubview:button];
}

//关闭模态窗口
-(void)backBarButtonItemClicked:(UIBarButtonItem *)sender
{
    [self.view.window.rootViewController dismissViewControllerAnimated:nil completion:nil];
}

//设置间隔线
-(void)setSplitLine
{
    UIButton *splitLine1 = [[UIButton alloc]init];
    splitLine1.frame = CGRectMake(0, 230, 170, 1);
    [splitLine1 setImage:[UIImage imageNamed:@"comment_dotted_divider"] forState:UIControlStateNormal];
    [self.view addSubview:splitLine1];
    
    UILabel *label = [[UILabel alloc]init];
    label.frame = CGRectMake(177, 220, 20, 20);
    label.text = @"或";
    label.textColor = [UIColor whiteColor];
    [self.view addSubview:label];
    
    UIButton *splitLine2 = [[UIButton alloc]init];
    splitLine2.frame = CGRectMake(200, 230, 172, 1);
    [splitLine2 setImage:[UIImage imageNamed:@"comment_dotted_divider"] forState:UIControlStateNormal];
    [self.view addSubview:splitLine2];
}

//设置文本框
-(void)setTextField
{
    //账号
    self.accounrNumberTextField = [[UITextField alloc]init];
    self.accounrNumberTextField.backgroundColor = [UIColor whiteColor];
    self.accounrNumberTextField.frame = CGRectMake(0, 350, ScreenWidth, 44);
    self.accounrNumberTextField.placeholder = @"手机号/邮箱";
    [self.accounrNumberTextField setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:self.accounrNumberTextField];
    
    //账号用户图像按钮
    UIButton *logolButton1 = [[UIButton alloc]init];
    logolButton1.frame = CGRectMake(0, 350, 44, 44);
    [logolButton1 setImage:[UIImage imageNamed:@"head_icon"] forState:UIControlStateNormal];
    [self.view addSubview:logolButton1];
    
    
    //密码
    self.loginPasswordTextField = [[UITextField alloc]init];
    self.loginPasswordTextField.backgroundColor = [UIColor whiteColor];
    self.loginPasswordTextField.frame = CGRectMake(0, 395, ScreenWidth, 44);
    self.loginPasswordTextField.placeholder = @"密码";
    self.loginPasswordTextField.secureTextEntry = YES;
    [self.loginPasswordTextField setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:self.loginPasswordTextField];
    
    //密码锁图像按钮
    UIButton *logolButton2 = [[UIButton alloc]init];
    logolButton2.frame = CGRectMake(0, 395, 44, 44);
    [logolButton2 setImage:[UIImage imageNamed:@"password_icon"] forState:UIControlStateNormal];
    [self.view addSubview:logolButton2];
    
    
    //登陆
    self.loginButton = [[UIButton alloc]init];
    self.loginButton.frame =CGRectMake(0, 450, ScreenWidth, 44);
    [self.loginButton setTitle:@"登陆" forState:UIControlStateNormal];
    [self.loginButton addTarget:self action:@selector(loginButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    self.loginButton.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:self.loginButton];
}
//登陆事件
-(void)loginButtonClicked:(UIButton *)sender
{
    if(self.accounrNumberTextField.text.length > 0 && self.loginPasswordTextField.text.length > 0)
    {
        //清空账号和密码
        self.accounrNumberTextField.text = @"";
        self.loginPasswordTextField.text = @"";
        
        NSLog(@"可以登陆!");
    }
}

//设置忘记密码和注册按钮
-(void)setForgetAndRegseterButton
{
    //忘记密码
    self.forgetPasswordbutton = [[UIButton alloc]init];
    self.forgetPasswordbutton.frame = CGRectMake(120, 580, 60, 40);
    self.forgetPasswordbutton.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.forgetPasswordbutton addTarget:self action:@selector(findPassword:) forControlEvents:UIControlEventTouchUpInside];
    [self.forgetPasswordbutton setTitle:@"忘记密码" forState:UIControlStateNormal];
    [self.view addSubview:self.forgetPasswordbutton];
    
    //分割线
    UIButton *splitButton = [[UIButton alloc]init];
    splitButton.frame = CGRectMake(190, 590, 1, 20);
    [splitButton setImage:[UIImage imageNamed:@"detail_tabbar_cutoff"] forState:UIControlStateNormal];
    [self.view addSubview:splitButton];
    
    //注册账号
    self.regesterbutton = [[UIButton alloc]init];
    self.regesterbutton.frame = CGRectMake(200, 580, 60, 40);
    self.regesterbutton.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.regesterbutton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.regesterbutton addTarget:self action:@selector(regesterbuttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.regesterbutton setTitle:@"注册账号" forState:UIControlStateNormal];
    [self.view addSubview:self.regesterbutton];
}

//处理按钮事件,找回按钮
-(void)findPassword:(UIButton *)sender
{
    
    //网页视图
    self.webView = [[UIWebView alloc]init];
    self.webView.frame = self.view.bounds;
    self.webView.backgroundColor = [UIColor lightGrayColor];
    self.webView.delegate = self;
    
    //网页视图工具栏
    self.webToolBar = [[webToolBar alloc]init];
    self.webToolBar.barTintColor = [UIColor whiteColor];
    self.webToolBar.frame = CGRectMake(0, Screenheight-44, ScreenWidth, 44);
    
    
    [self.webView addSubview:self.webToolBar];
    [self.view addSubview:self.webView];
    
    
    //发送请求
    NSURL *URL = [NSURL URLWithString:kStringUserForgetPassWord];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    [self.webView loadRequest:request];
}

//开始加载网页时的处理
-(void)webViewDidStartLoad:(UIWebView *)webView
{
    self.activityIndicatorView  = [[UIActivityIndicatorView alloc]init];
    self.activityIndicatorView.frame = self.webView.frame;
    [self.webView addSubview:self.activityIndicatorView];
    
    self.activityIndicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
    self.activityIndicatorView.color = [UIColor redColor];
    
    //开始活动
    [self.activityIndicatorView startAnimating];
    
}
//加载网页成功后的处理事件,使内容使用屏幕大小
- (void)webViewDidFinishLoad:(UIWebView *)theWebView
{
    //停止活动
    [self.activityIndicatorView stopAnimating];
    
    CGSize contentSize = theWebView.scrollView.contentSize;
    CGSize viewSize = self.view.bounds.size;
    
    float rw = viewSize.width / contentSize.width;
    float rh = 0.78;
    
    theWebView.scrollView.minimumZoomScale = rw;
    theWebView.scrollView.maximumZoomScale = rw;
    
    theWebView.scrollView.maximumZoomScale = rh;
    
    theWebView.scrollView.zoomScale = rw;
    theWebView.scrollView.zoomScale = rh;
}
//加载失败时的处理
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    //停止活动
    [self.activityIndicatorView stopAnimating];
    
    
    //加载失败时的图片
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.frame = CGRectMake(100, 200, 150, 150);
    [imageView setImage:[UIImage imageNamed:@"loading_fail"]];
    
    
    //加载失败时提示的文字
    UIButton *button = [[UIButton alloc]init];
    button.frame = CGRectMake(90, 345, 200, 40);
    [button setTitle:@"加载失败,点击重新加载" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(findPassword:) forControlEvents:UIControlEventTouchDragInside];
    
    [self.webView addSubview:button];
    [self.webView addSubview:imageView];
}

//注册事件处理
-(void)regesterbuttonClicked:(UIButton *)sender
{
    //模态出注册界面控制器
    RegesterViewController *regesterVC = [[RegesterViewController alloc]init];
    
    [self presentViewController:regesterVC animated:nil completion:nil];
}
@end
