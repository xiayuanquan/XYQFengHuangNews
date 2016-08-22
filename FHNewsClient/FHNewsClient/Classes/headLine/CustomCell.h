//
//  CustomCell.h
//  凤凰新闻客户端
//
//  Created by ma c on 15/11/10.
//  Copyright (c) 2015年 xiayuanquan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class IFItemNews;
@interface CustomCell : UITableViewCell
@property (strong,nonatomic)IFItemNews *itemEntity;  //新闻实体
@end
