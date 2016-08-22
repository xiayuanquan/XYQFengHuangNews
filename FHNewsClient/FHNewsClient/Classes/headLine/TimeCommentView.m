//
//  TimeCommentView.m
//  凤凰新闻客户端
//
//  Created by ma c on 15/11/11.
//  Copyright (c) 2015年 xiayuanquan. All rights reserved.
//

#import "TimeCommentView.h"
#import "const.h"
#import "IFItemNews.h"
#import "CommentButton.h"

@interface TimeCommentView()
@property (strong,nonatomic)UILabel *updateTimeLabel;      //新闻更新时间标签
@property (strong,nonatomic)CommentButton *commentsbutton; //评论按钮
@end

@implementation TimeCommentView
//初始化
-(instancetype)init
{
    self = [super init];
    if (self)
    {
        self.updateTimeLabel = [[UILabel alloc]init];
        self.updateTimeLabel.font = ITEM_TIME_FONT;
        self.updateTimeLabel.textColor = [UIColor blackColor];
        [self addSubview:self.updateTimeLabel];
        
        
        self.commentsbutton = [[CommentButton alloc]init];
        self.commentsbutton.titleLabel.font = ITEM_TIME_FONT;
        self.commentsbutton.titleLabel.textAlignment = NSTextAlignmentRight;
        [self.commentsbutton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.commentsbutton setImage:[UIImage imageNamed:@"channel_list_new_comment"] forState:UIControlStateNormal];
        [self addSubview:self.commentsbutton];
    }
    return self;
}

//重写set方法,传递新闻实体
-(void)setItemEntity:(IFItemNews *)itemEntity
{
      _itemEntity = itemEntity;
    
    //设置评论数
    [self.commentsbutton setTitle:_itemEntity.commentsall forState:UIControlStateNormal];
    
    if (_itemEntity.commentsall == nil)
    {
        //取消评论
        [self.commentsbutton removeFromSuperview];
    }
    
    if ([_itemEntity.styleType isEqualToString:@"topic"])
    {
        //设置新闻类型
        self.updateTimeLabel.text = @"专题";
        self.updateTimeLabel.textColor = [UIColor redColor];
    }
    
    else if([_itemEntity.styleType isEqualToString:@"live"])
    {
        //设置新闻类型
        self.updateTimeLabel.text = @"直播中...";
        self.updateTimeLabel.textColor = [UIColor redColor];
        
        //取消评论
        [self.commentsbutton removeFromSuperview];
    }
    else
    {
      //设置更新时间
      self.updateTimeLabel.text = [_itemEntity formatDate];
        
        if (_itemEntity.hasVideo == 1)
        {
            UIButton *button = [[UIButton alloc]init];
            button.frame = CGRectMake(32, 5, 15, 10);
            [button setImage:[UIImage imageNamed:@"channel_list_new_play"] forState:UIControlStateNormal];
            [self addSubview:button];
        }
    }
}

//布局子视图
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.updateTimeLabel.frame = CGRectMake(0, 0, TIME_COMMENT_LABEL_WIDTH,TIME_COMMENT_LABEL_HEIGHT);
    
    self.commentsbutton.frame = CGRectMake(self.frame.size.width-70, 0, 60, TIME_COMMENT_LABEL_HEIGHT);
}
@end
