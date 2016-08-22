//
//  etmCustomCell.m
//  凤凰新闻客户端
//
//  Created by ma c on 15/11/18.
//  Copyright (c) 2015年 xiayuanquan. All rights reserved.
//

#import "etmCustomCell.h"
#import "const.h"
#import "etmContentView.h"
#import "etmEntity.h"
#import "etmPhotoView.h"
#import "etmTimeCommentView.h"

@interface etmCustomCell()
@property (strong,nonatomic)etmPhotoView *PhotoView;             //娱乐图片视图
@property (strong,nonatomic)etmContentView *ContentView;         //标题内容视图
@property (strong,nonatomic)etmTimeCommentView *TimeCommentView; //评论时间视图
@end

@implementation etmCustomCell

//初始化
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self)
    {
        //创建图片视图
        _PhotoView = [[etmPhotoView alloc]init];
        [self.contentView addSubview:_PhotoView];
        
        //创建标题内容视图
        _ContentView = [[etmContentView alloc]init];
        [self.contentView addSubview:_ContentView];
        
        //创建评论时间视图
        _TimeCommentView = [[etmTimeCommentView alloc]init];
        [self.contentView addSubview:_TimeCommentView];
    }
    return self;
}

//重写set方法,接受实体对象
-(void)setEtmEntity:(etmEntity *)etmEntity
{
    _etmEntity = etmEntity;
    
    //移除视图,解决单元格重用问题
    if (_PhotoView)
    {
        [_PhotoView removeFromSuperview];
    }
    if (_ContentView)
    {
        [_ContentView removeFromSuperview];
    }
    if (_TimeCommentView)
    {
        [_TimeCommentView removeFromSuperview];
    }
    
    //创建图片视图
    _PhotoView = [[etmPhotoView alloc]initWithFrame:_etmEntity.carPhotoViewFrame];
    [_PhotoView setEtmEntity:_etmEntity];
    [self.contentView addSubview:_PhotoView];
    
    
    //创建标题内容视图
    _ContentView = [[etmContentView alloc]initWithFrame:_etmEntity.titleContentViewFrame];
    [_ContentView setEtmEntity:_etmEntity];
    [self.contentView addSubview:_ContentView];
    
    
    //创建评论时间视图
    _TimeCommentView = [[etmTimeCommentView alloc]initWithFrame:_etmEntity.commentTimeViewFrame];
    [_TimeCommentView setEtmEntity:_etmEntity];
    [self.contentView addSubview:_TimeCommentView];
}

@end
