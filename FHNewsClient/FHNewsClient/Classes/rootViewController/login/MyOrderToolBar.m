//
//  MyOrderToolBar.m
//  凤凰新闻客户端
//
//  Created by ma c on 15/11/16.
//  Copyright (c) 2015年 xiayuanquan. All rights reserved.
//

#import "MyOrderToolBar.h"
#import "const.h"

@interface MyOrderToolBar()
@property (strong,nonatomic)UIButton *Backbutton;
@property (strong,nonatomic)UILabel  *titleLabel;
@property (strong,nonatomic)UIButton *Morebutton;
@end

@implementation MyOrderToolBar

//初始化
-(instancetype)init
{
    self = [super init];
    if (self)
    {
        _Backbutton = [[UIButton alloc]init];
        _Backbutton.frame = CGRectMake(10, 3, 25, 40);
        [_Backbutton setImage:[UIImage imageNamed:@"ifeng_bottom_back"] forState:UIControlStateNormal];
        _Backbutton.transform = CGAffineTransformMakeRotation(-M_PI_2);
        [_Backbutton addTarget:self action:@selector(BackButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_Backbutton];
        
        
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.frame = CGRectMake(150, 0, 100, 44);
        _titleLabel.text = @"我的订阅";
        _titleLabel.textColor = [UIColor blackColor];
        [self addSubview:_titleLabel];
        
        
        _Morebutton = [[UIButton alloc]init];
        _Morebutton.frame = CGRectMake(300, 0, 60, 44);
        [_Morebutton setTitle:@"更多" forState:UIControlStateNormal];
        [_Morebutton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self addSubview:_Morebutton];
    }
    return self;
}

//按钮事件,返回
-(void)BackButtonClicked:(UIButton *)sender
{
    [UIView animateWithDuration:0 animations:^{
        
        self.superview.frame = CGRectMake(ScreenWidth, 0, ScreenWidth, Screenheight);
    }];
}
@end
