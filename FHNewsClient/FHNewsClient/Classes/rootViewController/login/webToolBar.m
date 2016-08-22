//
//  webToolBar.m
//  凤凰新闻客户端
//
//  Created by ma c on 15/11/16.
//  Copyright (c) 2015年 xiayuanquan. All rights reserved.
//

#import "webToolBar.h"
#import "LoginViewController.h"

@interface webToolBar()
@property (strong,nonatomic)UIButton *button1;
@property (strong,nonatomic)UIButton *button2;
@property (strong,nonatomic)UIButton *button3;
@property (strong,nonatomic)UIButton *button4;
@end

@implementation webToolBar
//初始化
-(instancetype)init
{
    self = [super init];
    if (self)
    {
        //向左的箭头
        _button1 = [[UIButton alloc]init];
        _button1.frame = CGRectMake(5, 5, 40, 30);
        [_button1 setImage:[UIImage imageNamed:@"ad_detail_back_unpress"] forState:UIControlStateNormal];
        [_button1 addTarget:self action:@selector(cancelButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        //向右的箭头
        _button2 = [[UIButton alloc]init];
        _button2.frame = CGRectMake(60, 5, 40, 30);
        [_button2 setImage:[UIImage imageNamed:@"ad_detail_forward_unpress"] forState:UIControlStateNormal];
        
        //旋转按钮
        _button3 = [[UIButton alloc]init];
        _button3.frame = CGRectMake(270, 0, 50, 44);
        [_button3 setImage:[UIImage imageNamed:@"appwidget_refresh_btn_default"] forState:UIControlStateNormal];
        
        //关闭按钮
        _button4 = [[UIButton alloc]init];
        _button4.frame = CGRectMake(325, 8, 28, 28);
        [_button4 setImage:[UIImage imageNamed:@"ad_detail_close_unpress"] forState:UIControlStateNormal];
        [_button4 addTarget:self action:@selector(cancelButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:_button1];
        [self addSubview:_button2];
        [self addSubview:_button3];
        [self addSubview:_button4];
    }
    return self;
}
//关闭事件
-(void)cancelButtonClicked:(UIButton *)sender
{
    //移除网页视图
    [self.superview removeFromSuperview];
}
@end
