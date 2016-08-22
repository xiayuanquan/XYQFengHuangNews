//
//  RegesterViewController.m
//  凤凰新闻客户端
//
//  Created by ma c on 15/11/16.
//  Copyright (c) 2015年 xiayuanquan. All rights reserved.
//

#import "RegesterViewController.h"
#import "const.h"

@interface RegesterViewController ()
@property (strong,nonatomic)UIToolbar *toolBar;   //工具栏
@property (strong,nonatomic)UIButton *backButton; //工具栏返回按钮
@property (strong,nonatomic)UILabel  *titleLabel; //工具栏标题标签

@property (strong,nonatomic)UILabel   *label;     //视图中的标题标签

@property (strong,nonatomic)UITextField *PhoneNumTextField; //手机号文本框
@property (strong,nonatomic)UITextField *checkNumTextField; //验证码文本框
@property (strong,nonatomic)UIButton   *splitButton;        //分割线按钮
@property (strong,nonatomic)UIImageView *checkNumImageView; //验证码图片视图
@property (strong,nonatomic)UIButton    *checkNumButton;    //验证码提示按钮

@property (strong,nonatomic)UIButton  *agreeButton;         //同意按钮
@property (strong,nonatomic)UIButton  *serverButton;        //服务条款按钮

@property (strong,nonatomic)UIButton  *verifyCodeButton;    //获取验证码按钮
@end

@implementation RegesterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置视图颜色
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    //设置工具栏
    [self addToolBar];
    
    //设置标题标签
    [self addTitleLabel];
    
    //设置文本框
    [self addTextField];
    
    //设置同意和服务条框按钮
    [self addAgreeAndServerButton];
    
    //设置获取验证码按钮
    [self addVerifyCodeButton];
}

//设置工具栏
-(void)addToolBar
{
    //工具栏
    self.toolBar = [[UIToolbar alloc]init];
    self.toolBar.frame = CGRectMake(0, 0, ScreenWidth, 44);
    [self.view addSubview:self.toolBar];
    
    
    //返回按钮
    _backButton = [[UIButton alloc]init];
    _backButton.frame = CGRectMake(5, 2, 40, 40);
    [_backButton setImage:[UIImage imageNamed:@"detail_commment_close_button_icon"] forState:UIControlStateNormal];
    [_backButton addTarget:self action:@selector(backButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    
    //标题标签
    _titleLabel = [[UILabel alloc]init];
    _titleLabel.frame = CGRectMake(170, 5, 40, 30);
    _titleLabel.text = @"注册";
    _titleLabel.font = [UIFont systemFontOfSize:20];
    
    
    //添加控件到工具栏
    [self.toolBar addSubview:_backButton];
    [self.toolBar addSubview:_titleLabel];
}
//按钮事件
-(void)backButtonClicked:(UIButton *)sender
{
    //关闭模态注册窗口
    [self dismissViewControllerAnimated:nil completion:nil];
}


//设置标题标签
-(void)addTitleLabel
{
    self.label = [[UILabel alloc]init];
    self.label.frame = CGRectMake(20, 64, 80, 30);
    self.label.text = @"手机注册";
    [self.view addSubview:self.label];
}
//设置文本框
-(void)addTextField
{
    self.PhoneNumTextField = [[UITextField alloc]init];
    self.PhoneNumTextField.backgroundColor = [UIColor whiteColor];
    self.PhoneNumTextField.frame = CGRectMake(20, 104, ScreenWidth-40, 44);
    self.PhoneNumTextField.placeholder = @"仅限中国大陆地区手机号码";
    self.PhoneNumTextField.textAlignment = NSTextAlignmentLeft;
    
    self.checkNumTextField = [[UITextField alloc]init];
    self.checkNumTextField.backgroundColor = [UIColor whiteColor];
    self.checkNumTextField.frame = CGRectMake(20, 149, ScreenWidth-40, 44);
    self.checkNumTextField.placeholder = @"验证码";
    
    self.splitButton = [[UIButton alloc]init];
    self.splitButton.frame = CGRectMake(167, 149, 2, 44);
    [self.splitButton setImage:[UIImage imageNamed:@"detail_tabbar_cutoff"] forState:UIControlStateNormal];
    
    self.checkNumImageView = [[UIImageView alloc]init];
    self.checkNumImageView.frame = CGRectMake(169, 149, 100, 44);
    self.checkNumImageView.backgroundColor = [UIColor purpleColor];
    
    
    self.checkNumButton = [[UIButton alloc]init];
    self.checkNumButton.frame = CGRectMake(275, 152, 80, 30);
    self.checkNumButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.checkNumButton setTitle:@"换一张" forState:UIControlStateNormal];
    [self.checkNumButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    
    [self.view addSubview:self.PhoneNumTextField];
    [self.view addSubview:self.checkNumTextField];
    [self.view addSubview:self.splitButton];
    [self.view addSubview:self.checkNumImageView];
    [self.view addSubview:self.checkNumButton];
}
//设置同意和服务条框按钮
-(void)addAgreeAndServerButton
{
    self.agreeButton = [[UIButton alloc]init];
    self.agreeButton.frame = CGRectMake(20, 210, 10, 10);
    [self.agreeButton setImage:[UIImage imageNamed:@"vote_press"] forState:UIControlStateNormal];
    
    
    UILabel *label = [[UILabel alloc]init];
    label.frame = CGRectMake(40, 200, 60, 30);
    label.text = @"我同意";

    
    self.serverButton = [[UIButton alloc]init];
    self.serverButton.frame = CGRectMake(88, 200, 80, 30);
    [self.serverButton setTitle:@"服务条款" forState:UIControlStateNormal];
    [self.serverButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    [self.view addSubview:self.agreeButton];
    [self.view addSubview:label];
    [self.view addSubview:self.serverButton];
}
//设置获取验证码按钮
-(void)addVerifyCodeButton
{
    self.verifyCodeButton = [[UIButton alloc]init];
    self.verifyCodeButton.backgroundColor = [UIColor whiteColor];
    self.verifyCodeButton.frame = CGRectMake(20, 240, ScreenWidth-40, 44);
    [self.verifyCodeButton setTitle:@"点击获取短信验证码" forState:UIControlStateNormal];
    [self.verifyCodeButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    
    [self.view addSubview:self.verifyCodeButton];
}
@end
