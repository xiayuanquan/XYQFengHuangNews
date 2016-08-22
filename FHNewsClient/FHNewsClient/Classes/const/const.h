//
//  const.h
//  凤凰新闻客户端
//
//  Created by ma c on 15/11/9.
//  Copyright (c) 2015年 xiayuanquan. All rights reserved.
//

#ifndef ________const_h
#define ________const_h
#import <Foundation/Foundation.h>

extern NSString *const kStringHeadLineURL;
extern NSString *const kStringBeautyGrilURL;
extern NSString *const kStringUserForgetPassWord;
extern NSString *const kStringRecommentURL;
extern NSString *const kStringCarURL;
extern NSString *const kStringEnterTainMentURL;


#define ScreenFrame [UIScreen mainScreen].bounds
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define Screenheight [UIScreen mainScreen].bounds.size.height

#define ITEM_CONTENT_FONT [UIFont systemFontOfSize:17]
#define ITEM_TIME_FONT [UIFont systemFontOfSize:12]

#define INDICATORVIEW_MOVE_DISTANCE 81 
#define PHOTO_GAP 5
#define COLLECTION_CELL_GAP 5

#define SEARCHBAR_HEIGHT 40
#define SCROLLVIEW_HEIGHT 200

#define CELL_SINGLE_PHOTO_HEIGHT 20
#define CELL_MANY_PHOTO_HEIGHT 40

#define PHOTOVIEW_WIDTH  100
#define PHOTOVIEW_HEIGHT 80

#define LABEL_WIDTH 60
#define LABEL_HEIGHT 40

#define CONSTRAINED_SIZE_WIDTH  265
#define CONSTRAINED_SIZE_HEIGHT 100


#define TIME_COMMENT_LABEL_WIDTH  80
#define TIME_COMMENT_LABEL_HEIGHT 20

#define  CAR_COUNT 2

#endif
