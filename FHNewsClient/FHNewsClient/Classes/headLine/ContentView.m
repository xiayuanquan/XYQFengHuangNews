//
//  ContentView.m
//  凤凰新闻客户端
//
//  Created by ma c on 15/11/10.
//  Copyright (c) 2015年 xiayuanquan. All rights reserved.
//

#import "ContentView.h"
#import "IFItemNews.h"
#import "const.h"

@interface ContentView()

@end

@implementation ContentView
//初始化
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _itemContentLabel = [[UILabel alloc]init];
        _itemContentLabel.numberOfLines = 0;
        _itemContentLabel.font = ITEM_CONTENT_FONT;
        [self addSubview:_itemContentLabel];
    }
    return self;
}

//重写set方法，传递新闻实体
-(void)setItemEntity:(IFItemNews *)itemEntity
{
    _itemEntity = itemEntity;
    self.itemContentLabel.frame = _itemEntity.contentViewFrame;
    _itemContentLabel.text = _itemEntity.title;
}
@end
