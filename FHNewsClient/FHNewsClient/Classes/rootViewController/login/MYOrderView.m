//
//  MYOrderView.m
//  凤凰新闻客户端
//
//  Created by ma c on 15/11/16.
//  Copyright (c) 2015年 xiayuanquan. All rights reserved.
//

#import "MYOrderView.h"
#import "const.h"
#import "MyOrderToolBar.h"
#import "LoginViewController.h"

@interface MYOrderView()
@property (strong,nonatomic)MyOrderToolBar *toolBar; //工具栏
@property (strong,nonatomic)UIImageView *imageView;  //图像视图
@property (strong,nonatomic)UIButton  *Loginbutton;  //登陆按钮
@end

@implementation MYOrderView

-(instancetype)init
{
    self = [super init];
    if (self)
    {
        //工具栏
        _toolBar = [[MyOrderToolBar alloc]init];
        _toolBar.barTintColor = [UIColor lightGrayColor];
        _toolBar.frame = CGRectMake(0, 0, ScreenWidth, 44);
        [self addSubview:_toolBar];
        
        
        //图像视图
        _imageView = [[UIImageView alloc]init];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        _imageView.frame = CGRectMake(20, 60, ScreenWidth-60, 440);
        [_imageView setImage:[UIImage imageNamed:@"mysub_empty.jpg"]];
        [self addSubview:_imageView];
        
        
        //登陆按钮
        _Loginbutton = [[UIButton alloc]init];
        _Loginbutton.frame = CGRectMake(30, 550, 300, 44);
        _Loginbutton.backgroundColor = [UIColor purpleColor];
        [_Loginbutton setTitle:@"立即登陆" forState:UIControlStateNormal];
        _Loginbutton.layer.cornerRadius = 8;
        _Loginbutton.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_Loginbutton addTarget:self action:@selector(LoginbuttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_Loginbutton];
    }
    return self;
}

//按钮事件处理,模态出登陆界面
-(void)LoginbuttonClicked:(UIButton *)sender
{
    LoginViewController *loginVC= [[LoginViewController alloc]init];
    loginVC.view.backgroundColor = [UIColor lightGrayColor];
    [self.window.rootViewController presentViewController:loginVC animated:nil completion:nil];
}
@end
