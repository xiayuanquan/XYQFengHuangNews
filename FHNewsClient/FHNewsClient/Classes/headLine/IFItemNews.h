//
//  IFNews.h
//  凤凰新闻客户端
//
//  Created by ma c on 15/11/10.
//  Copyright (c) 2015年 xiayuanquan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IFItemNews : UIView
@property (copy,nonatomic)NSString *thumbnail;     //单的张缩略图
@property (copy,nonatomic)NSString *title;         //标题
@property (copy,nonatomic)NSString *updateTime;    //更新时间
@property (copy,nonatomic)NSString *commentsall;   //所有评论数
@property (strong,nonatomic)NSDictionary *style;   //字典，可以用来判断是否有多张配图
@property (strong,nonatomic)NSDictionary *link;    //每一个标题对应的具体信息
@property (copy,nonatomic)NSString *styleType;     //新闻类型
@property (assign,nonatomic)NSInteger hasVideo;    //视频录像


//自定义初始化方法,初始化新闻实体
-(instancetype)initWithDic:(NSDictionary *)dic;

@property (assign,nonatomic)CGFloat contentHeight;      //获取的文字内容高度
@property (assign,nonatomic)CGFloat PhotoHeight;        //获取的图片高度


@property (assign,nonatomic)CGRect MyscrollviewFrame;   //滚动视图的frame
@property (assign,nonatomic)CGRect contentViewFrame;    //文字内容视图的frame
@property (assign,nonatomic)CGRect photoviewFrame;      //图片视图的frame
@property (assign,nonatomic)CGRect timeCommentViewFrame;//更新时间和评论视图的frame
@property (assign,nonatomic)CGRect imageViewFrame;      //图像视图的frame


//格式化新闻更新时间
-(NSString *)formatDate;

//布局所有的子视图
-(void)caleViewFrame;
@end
