//
//  PicEntity.m
//  凤凰新闻客户端
//
//  Created by ma c on 15/11/12.
//  Copyright (c) 2015年 xiayuanquan. All rights reserved.
//

#import "PicEntity.h"

@implementation PicEntity

//初始化
-(instancetype)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self)
    {
        _commentsall = [[dic objectForKey:@"commentsall"]integerValue];
        _likes = [[dic objectForKey:@"likes"]integerValue];
        _image = [dic objectForKey:@"img"];
        _thumbnail = [dic objectForKey:@"thumbnail"];
    }
    return self;
}
@end
