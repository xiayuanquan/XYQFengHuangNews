//
//  CustomHeadView.m
//  凤凰新闻客户端
//
//  Created by ma c on 15/11/17.
//  Copyright (c) 2015年 xiayuanquan. All rights reserved.
//

#import "CustomHeadView.h"
#import "const.h"


@interface CustomHeadView()
@property (strong,nonatomic)UIImageView *imageView;
@end

@implementation CustomHeadView
//初始化
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        NSArray *array= @[[UIImage imageNamed:@"car1.jpg"],[UIImage imageNamed:@"car2.jpg"]];
        for (int i = 0; i < CAR_COUNT; i++)
        {
            _imageView = [[UIImageView alloc]init];
            _imageView.frame  =CGRectMake(i * ScreenWidth, 0, ScreenWidth, 200);
            [_imageView setImage:array[i]];
            [self addSubview:_imageView];
        }
    }
    return self;
}
@end
