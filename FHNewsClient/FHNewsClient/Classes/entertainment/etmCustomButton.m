//
//  etmCustomButton.m
//  凤凰新闻客户端
//
//  Created by ma c on 15/11/18.
//  Copyright (c) 2015年 xiayuanquan. All rights reserved.
//

#import "etmCustomButton.h"

@implementation etmCustomButton

//设置文字的位置
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(0, 0, 40, 20);
}
//设置图片的位置
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(40, 0, 20, 20);
}

@end
