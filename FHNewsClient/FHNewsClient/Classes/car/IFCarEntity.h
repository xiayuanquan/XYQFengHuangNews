//
//  IFReEntity.h
//  凤凰新闻客户端
//
//  Created by ma c on 15/11/16.
//  Copyright (c) 2015年 xiayuanquan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IFCarEntity : NSObject
@property (strong,nonatomic)NSDictionary *link;    //详细内容链接
@property (copy,nonatomic)NSString *thumbnail;     //单张缩略图
@property (copy,nonatomic)NSString *title;         //标题
@property (assign,nonatomic)NSInteger commentsall; //评论数
@property (strong,nonatomic)NSDictionary *style;   //风格,判断是否有多张图片的依据
@property (copy,nonatomic)NSString *updateTime;    //更新时间


@property (assign,nonatomic)CGRect carPhotoViewFrame;     //图片视图frame
@property (assign,nonatomic)CGRect titleContentViewFrame; //标题内容frame
@property (assign,nonatomic)CGRect commentTimeViewFrame;  //评论时间frame


@property (assign,nonatomic)CGRect  rect;         //测量的标题的frame
@property (assign,nonatomic)CGFloat photoHeight;  //记录图片的高度
@property (assign,nonatomic)CGFloat titleHeight;  //记录标题的高度
@property (assign,nonatomic)CGFloat comTimeHeight;//记录时间评论高度


-(NSString *)formatUpdateTime;//格式化时间
-(instancetype)initWithDic:(NSDictionary *)dic;    //声明一个初始化实体的方法
-(void)caleAllFrame; //布局所有的视图
@end
