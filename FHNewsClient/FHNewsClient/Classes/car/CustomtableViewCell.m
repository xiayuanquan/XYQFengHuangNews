//
//  CustomtableViewCell.m
//  凤凰新闻客户端
//
//  Created by ma c on 15/11/16.
//  Copyright (c) 2015年 xiayuanquan. All rights reserved.
//

#import "CustomtableViewCell.h"
#import "carPhotoView.h"
#import "titleContentView.h"
#import "commentTimeView.h"
#import "IFCarEntity.h"

@interface CustomtableViewCell()
@property (strong,nonatomic)carPhotoView *carPhotoView;          //汽车图片视图
@property (strong,nonatomic)titleContentView *titleContentView;  //标题内容视图
@property (strong,nonatomic)commentTimeView *commentTimeView;    //评论时间视图
@end

@implementation CustomtableViewCell

//初始化
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self)
    {
        //创建图片视图
        _carPhotoView = [[carPhotoView alloc]init];
        [self.contentView addSubview:_carPhotoView];
        
        //创建标题内容视图
        _titleContentView = [[titleContentView alloc]init];
        [self.contentView addSubview:_titleContentView];
        
        //创建评论时间视图
        _commentTimeView = [[commentTimeView alloc]init];
        [self.contentView addSubview:_commentTimeView];
    }
    return self;
}

//重写set方法,接受实体对象
-(void)setCarEntity:(IFCarEntity *)carEntity
{
    _carEntity = carEntity;
    
    //移除视图,解决单元格重用问题
    if (_carPhotoView)
    {
        [_carPhotoView removeFromSuperview];
    }
    if (_titleContentView)
    {
        [_titleContentView removeFromSuperview];
    }
    if (_commentTimeView)
    {
        [_commentTimeView removeFromSuperview];
    }
    
    //创建图片视图
    _carPhotoView = [[carPhotoView alloc]initWithFrame:_carEntity.carPhotoViewFrame];
    [_carPhotoView setCarEntity:_carEntity];
    [self.contentView addSubview:_carPhotoView];
    
    
    //创建标题内容视图
    _titleContentView = [[titleContentView alloc]initWithFrame:_carEntity.titleContentViewFrame];
    [_titleContentView setCarEntity:_carEntity];
    [self.contentView addSubview:_titleContentView];
    
    
    //创建评论时间视图
    _commentTimeView = [[commentTimeView alloc]initWithFrame:_carEntity.commentTimeViewFrame];
    [_commentTimeView setCarEntity:_carEntity];
    [self.contentView addSubview:_commentTimeView];
}
@end
