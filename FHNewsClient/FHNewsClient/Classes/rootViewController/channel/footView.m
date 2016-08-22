//
//  footView.m
//  凤凰新闻客户端
//
//  Created by ma c on 15/11/16.
//  Copyright (c) 2015年 xiayuanquan. All rights reserved.
//

#import "footView.h"

@implementation footView
//初始化
-(instancetype)init
{
    self = [super init];
    if (self)
    {
        UIButton *button = [[UIButton alloc]init];
        button.frame = CGRectMake(335, 5, 25, 25);
        [button setImage:[UIImage imageNamed:@"ifeng_bottom_back"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(dismissModalWindows:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
    }
    return self;
}

//按钮事件
-(void)dismissModalWindows:(UIBarButtonItem *)sender
{
    //关闭频道的模态窗口
    [self.superview.window.rootViewController dismissViewControllerAnimated:nil completion:nil];
}
@end
