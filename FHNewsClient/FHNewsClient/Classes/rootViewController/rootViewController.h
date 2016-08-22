//
//  rootViewController.h
//  凤凰新闻客户端
//
//  Created by ma c on 15/11/9.
//  Copyright (c) 2015年 xiayuanquan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HeadLineController.h"
#import "CarViewController.h"
#import "BeautyGrilController.h"
#import "EntertainmentController.h"
#import "const.h"

@interface rootViewController : UIViewController
@property (strong,nonatomic)HeadLineController *headVC;
@property (strong,nonatomic)CarViewController *carVC;
@property (strong,nonatomic)BeautyGrilController *beautyVC;
@property (strong,nonatomic)EntertainmentController *entertainmentVC;
@end
