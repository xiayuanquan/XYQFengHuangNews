//
//  ContentView.h
//  凤凰新闻客户端
//
//  Created by ma c on 15/11/10.
//  Copyright (c) 2015年 xiayuanquan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class IFItemNews;
@interface ContentView : UIView
@property (strong,nonatomic)IFItemNews *itemEntity;    //新闻实体
@property (strong,nonatomic)UILabel *itemContentLabel; //文字内容标签
@end
