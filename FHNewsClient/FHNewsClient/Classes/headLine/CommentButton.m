//
//  CommentButton.m
//  凤凰新闻客户端
//
//  Created by ma c on 15/11/12.
//  Copyright (c) 2015年 xiayuanquan. All rights reserved.
//

#import "CommentButton.h"

@implementation CommentButton
//重新布局评论按钮的文字的frame
-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(0, 0, 40, 20);
}
//重新布局评论按钮中图片的frame
-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(40, 0, 20, 20);
}

@end
