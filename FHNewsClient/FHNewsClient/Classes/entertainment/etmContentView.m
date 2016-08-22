//
//  etmContentView.m
//  凤凰新闻客户端
//
//  Created by ma c on 15/11/18.
//  Copyright (c) 2015年 xiayuanquan. All rights reserved.
//

#import "etmContentView.h"
#import "etmEntity.h"

@interface etmContentView()
@property (strong,nonatomic)UILabel *titleLabel;
@end

@implementation etmContentView

//初始化
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.numberOfLines = 0;
        _titleLabel.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        [self addSubview:_titleLabel];
    }
    return self;
}

//重写set方法,接收实体对象
-(void)setEtmEntity:(etmEntity *)etmEntity
{
    _etmEntity = etmEntity;
    
    _titleLabel.text = _etmEntity.title;
}

@end
