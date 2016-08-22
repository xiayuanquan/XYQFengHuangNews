//
//  PicEntity.h
//  凤凰新闻客户端
//
//  Created by ma c on 15/11/12.
//  Copyright (c) 2015年 xiayuanquan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PicEntity : NSObject
@property (assign,nonatomic)NSInteger commentsall;  //总评论数
@property (assign,nonatomic)NSInteger likes;        //点赞数
@property (copy,nonatomic)NSArray *image;           //集合视图中的缩略图
@property (assign,nonatomic)NSString *thumbnail;    //图像视图中的浏览图


-(instancetype)initWithDic:(NSDictionary *)dic;     //自定义一个初始化方法,初始化图片实体
@end
