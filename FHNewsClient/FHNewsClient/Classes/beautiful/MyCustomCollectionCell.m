//
//  CustomCollectionCell.m
//  凤凰新闻客户端
//
//  Created by ma c on 15/11/13.
//  Copyright (c) 2015年 xiayuanquan. All rights reserved.
//

#import "MyCustomCollectionCell.h"
#import "PicEntity.h"
#import "const.h"
#import "UIImageView+WebCache.h"
#import "SDWebImageManager.h"
#import "LikeCommentShareView.h"

@interface MyCustomCollectionCell()
@property (strong,nonatomic)UIImageView *imageView;                   //显示图片的视图
@property (strong,nonatomic)LikeCommentShareView *likeCommentShareView;//放置赞、评论、分享按钮的视图
@end

@implementation MyCustomCollectionCell
//初始化
-(instancetype)init
{
    self = [super init];
    if (self)
    {
        _imageView = [[UIImageView alloc]init];
        [self.contentView addSubview:_imageView];
        
        _likeCommentShareView = [[LikeCommentShareView alloc]init];
        [self.contentView addSubview:_likeCommentShareView];
    }
    return self;
}

//重写set方法,传递图片实体
-(void)setPicEnity:(PicEntity *)picEnity
{
    _picEnity = picEnity;
    
    //如果视图存在就删除,防止重用
    if (self.imageView)
    {
        [self.imageView removeFromSuperview];
    }
    if (self.likeCommentShareView)
    {
        [self.likeCommentShareView removeFromSuperview];
    }
    
    //取出图片的URL
    NSDictionary *pic = [_picEnity.image firstObject];
    NSString *strURL = [pic objectForKey:@"url"];
    NSURL *URL = [NSURL URLWithString:strURL];
    
 
    //放置图片
    _imageView = [[UIImageView alloc]init];
    _imageView.frame = CGRectMake(0, 0, ScreenWidth, Screenheight-2*SEARCHBAR_HEIGHT);
    [_imageView sd_setImageWithURL:URL placeholderImage:[UIImage imageNamed:@"channel_list_new_default_normal"]];
    [self.contentView addSubview:_imageView];
    
    
    //创建视图
    _likeCommentShareView = [[LikeCommentShareView alloc]init];
    _likeCommentShareView.frame = CGRectMake(0, CGRectGetMaxY(_imageView.frame), ScreenWidth, SEARCHBAR_HEIGHT);
    [_likeCommentShareView setPicEnity:_picEnity];
    [self.contentView addSubview:_likeCommentShareView];
}
@end
