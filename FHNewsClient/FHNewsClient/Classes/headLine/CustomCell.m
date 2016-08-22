//
//  CustomCell.m
//  凤凰新闻客户端
//
//  Created by ma c on 15/11/10.
//  Copyright (c) 2015年 xiayuanquan. All rights reserved.
//

#import "CustomCell.h"
#import "const.h"
#import "IFItemNews.h"
#import "ContentView.h"
#import "PictureView.h"
#import "TimeCommentView.h"


@interface CustomCell()
@property (strong,nonatomic)ContentView *itemContentView;      //文字内容视图
@property (strong,nonatomic)PictureView *photoview;              //图片视图
@property (strong,nonatomic)TimeCommentView *timeCommentView;  //更新时间和评论视图
@end

@implementation CustomCell
//初始化重用单元格
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        //创建图片视图
        self.photoview = [[PictureView alloc]init];
        
        //创建内容视图
        self.itemContentView = [[ContentView alloc]init];
        
        //创建时间评论视图
        self.timeCommentView = [[TimeCommentView alloc]init];
    }
    return self;
}
//重写set方法,传递新闻实体
-(void)setItemEntity:(IFItemNews *)itemEntity
{
    _itemEntity = itemEntity;
    
    //移除图片视图,解决单元格重用问题
    if (self.photoview)
    {
        [self.photoview removeFromSuperview];
    }
    
    //移除时间评论视图,解决单元格重用问题
    if (self.timeCommentView)
    {
        [self.timeCommentView removeFromSuperview];
    }
    
    //设置图片区域
    self.photoview = [[PictureView alloc]init];
    [self.photoview setItemEntity:_itemEntity];
    self.photoview.frame = _itemEntity.photoviewFrame;
    [self.contentView addSubview:self.photoview];
    
    
    //设置内容区域
    self.itemContentView.frame = _itemEntity.contentViewFrame;
    [self.itemContentView setItemEntity:_itemEntity];
    [self.contentView addSubview:self.itemContentView];
    
    
    //设置时间评论局域
    self.timeCommentView = [[TimeCommentView alloc]init];
    self.timeCommentView.frame = _itemEntity.timeCommentViewFrame;
    [self.timeCommentView setItemEntity:_itemEntity];
    [self.contentView addSubview:self.timeCommentView];
}
@end
