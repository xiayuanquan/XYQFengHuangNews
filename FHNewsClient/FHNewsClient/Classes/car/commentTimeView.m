//
//  commentTimeView.m
//  凤凰新闻客户端
//
//  Created by ma c on 15/11/17.
//  Copyright (c) 2015年 xiayuanquan. All rights reserved.
//

#import "commentTimeView.h"
#import "IFCarEntity.h"
#import "CustomIFButton.h"
#import "const.h"

@interface commentTimeView()
@property (strong,nonatomic)UILabel *timeLabel;       //更新时间
@property (strong,nonatomic)CustomIFButton *button;   //评论数
@end

@implementation commentTimeView

//初始化
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        //初始化标签
        _timeLabel = [[UILabel alloc]init];
        _timeLabel.font = ITEM_TIME_FONT;
        _timeLabel.frame = CGRectMake(0, 0, 60, 20);
        [self addSubview:_timeLabel];
        
        //初始化按钮
        _button = [[CustomIFButton alloc]init];
        _button.titleLabel.font = ITEM_TIME_FONT;
        _button.titleLabel.textAlignment = NSTextAlignmentRight;
        _button.frame = CGRectMake(frame.size.width-70, 0, 60, 20);
        [self addSubview:_button];
    }
    return self;
}

//重写set方法,接收实体对象
-(void)setCarEntity:(IFCarEntity *)carEntity
{
    //设置标签上的时间
    _carEntity = carEntity;
    _timeLabel.textColor = [UIColor blackColor];
    _timeLabel.text = [_carEntity formatUpdateTime];
    
    
    //设置按钮上的评论数和图片
    [_button setImage:[UIImage imageNamed:@"channel_list_new_comment"] forState:UIControlStateNormal];
    [_button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_button setTitle:[NSString stringWithFormat:@"%ld",_carEntity.commentsall] forState:UIControlStateNormal];
}
@end
