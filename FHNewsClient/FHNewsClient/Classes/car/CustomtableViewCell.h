//
//  CustomtableViewCell.h
//  凤凰新闻客户端
//
//  Created by ma c on 15/11/16.
//  Copyright (c) 2015年 xiayuanquan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class IFCarEntity;
@interface CustomtableViewCell : UITableViewCell
@property (strong,nonatomic)IFCarEntity *carEntity;  //汽车实体
@end
