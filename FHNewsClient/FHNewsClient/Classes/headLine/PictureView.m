//
//  PhotoView.m
//  凤凰新闻客户端
//
//  Created by ma c on 15/11/10.
//  Copyright (c) 2015年 xiayuanquan. All rights reserved.
//

#import "PictureView.h"
#import "IFItemNews.h"
#import "UIImageView+WebCache.h"
#import "const.h"

@interface PictureView()

@end

@implementation PictureView

//重写set方法,传递新闻实体
-(void)setItemEntity:(IFItemNews *)itemEntity
{
    _itemEntity = itemEntity;
    
    //获取基本的图片资源
    NSArray *array = [_itemEntity.style objectForKey:@"images"];
    NSInteger count = array.count;
    
    CGFloat x = PHOTO_GAP;
    CGFloat y = 0;
    CGFloat photoWidth = (ScreenWidth-(count+1)*PHOTO_GAP)/count;
    CGFloat photoHeight = PHOTOVIEW_HEIGHT;

    
    //单张图片
    if (!_itemEntity.style)
    {
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.frame = _itemEntity.photoviewFrame;
        NSURL *URL  = [NSURL URLWithString:_itemEntity.thumbnail];
        [imageView sd_setImageWithURL:URL placeholderImage:[UIImage imageNamed:@"channel_list_new_default_normal"]];
        [self addSubview:imageView];
    }
    //多张图片
    if(_itemEntity.style)
    {
        for (int i = 0; i < count; i++)
        {
            UIImageView *imageView = [[UIImageView alloc]init];
            NSURL *URL  = [NSURL URLWithString:array[i]];
            imageView.frame = CGRectMake(x, y, photoWidth, photoHeight);
            x += photoWidth + PHOTO_GAP;
            [imageView sd_setImageWithURL:URL placeholderImage:[UIImage imageNamed:@"channel_list_new_default_normal"]];
            [self addSubview:imageView];
        }
    }
}

@end
