//
//  HeadView.m
//  凤凰新闻客户端
//
//  Created by ma c on 15/11/15.
//  Copyright (c) 2015年 xiayuanquan. All rights reserved.
//

#import "HeadView.h"
#import "const.h"
#import "LoginViewController.h"

@interface HeadView()
@property (strong,nonatomic)UIButton *cancelButtton;
@property (strong,nonatomic)UIButton *userImgButton;
@property (strong,nonatomic)UILabel  *titleLabel;
@property (strong,nonatomic)UILabel  *subTitleLabel;
@end

@implementation HeadView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _cancelButtton = [[UIButton alloc]initWithFrame:CGRectMake(345, 5, 25, 25)];
        [_cancelButtton setImage:[UIImage imageNamed:@"more"] forState:UIControlStateNormal];
        [_cancelButtton addTarget:self action:@selector(cancelButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_cancelButtton];
        
        
        _userImgButton = [[UIButton alloc]initWithFrame:CGRectMake(120, 10, 120,120)];
        [_userImgButton setImage:[UIImage imageNamed:@"user_unlogined_background"] forState:UIControlStateNormal];
        [_userImgButton addTarget:self action:@selector(Login:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_userImgButton];
        
        
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(146, 135, 80, 30)];
        _titleLabel.text = @"立即登录";
        _titleLabel.textColor = [UIColor whiteColor];
        [self addSubview:_titleLabel];
        
        
        _subTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(140, 167, 100, 15)];
        _subTitleLabel.text = @"赚金币兑大礼";
        _subTitleLabel.font = [UIFont systemFontOfSize:14];
        _subTitleLabel.textColor = [UIColor whiteColor];
        [self addSubview:_subTitleLabel];
    }
    return self;
}
//返回事件
-(void)cancelButtonClicked:(UIButton *)sender
{
    [UIView animateWithDuration:0.2f animations:^{
        self.superview.superview.frame = CGRectMake(-ScreenWidth, 0, ScreenWidth, Screenheight);
    }];
}

//登录事件处理,模态出登陆界面
-(void)Login:(UIButton *)sender
{
    LoginViewController *loginVC= [[LoginViewController alloc]init];
    loginVC.view.backgroundColor = [UIColor lightGrayColor];
    [self.window.rootViewController presentViewController:loginVC animated:nil completion:nil];
}
@end
