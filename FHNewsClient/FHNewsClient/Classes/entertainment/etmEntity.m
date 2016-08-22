//
//  etmEntity.m
//  凤凰新闻客户端
//
//  Created by ma c on 15/11/18.
//  Copyright (c) 2015年 xiayuanquan. All rights reserved.
//

#import "etmEntity.h"
#import "const.h"

@implementation etmEntity
//初始化
-(instancetype)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self)
    {
        _link = [dic objectForKey:@"link"];
        _thumbnail = [[dic objectForKey:@"thumbnail"]copy];
        _commentsall = [[dic objectForKey:@"commentsall"] integerValue];
        _title = [[dic objectForKey:@"title"]copy];
        _style = [dic objectForKey:@"style"];
        _updateTime = [[dic objectForKey:@"updateTime"]copy];
    }
    return self;
}

//格式化时间
-(NSString *)formatUpdateTime
{
    NSString *date = _updateTime;
    NSArray *dateStrs = [date componentsSeparatedByString:@" "];
    date = [[dateStrs lastObject] substringWithRange:NSMakeRange(0, 5)];
    return date;
}

//获取标题内容frame
-(CGRect)GetTitleContentFrame:(NSString *)titleText andWidth:(CGFloat)width
{
    return [titleText boundingRectWithSize:CGSizeMake(width, 200) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:ITEM_CONTENT_FONT} context:nil];
}

//布局所有的视图
-(void)caleAllFrame
{
    //单张图片
    if (_style == nil)
    {
        //布局图片局域
        _carPhotoViewFrame = CGRectMake(PHOTO_GAP,2*PHOTO_GAP,PHOTOVIEW_WIDTH, PHOTOVIEW_HEIGHT);
        
        //布局标题内容区域
        CGFloat x = CGRectGetMaxX(_carPhotoViewFrame) + PHOTO_GAP;
        CGFloat y = 2*PHOTO_GAP;
        _rect = [self GetTitleContentFrame:_title andWidth:270];
        _titleContentViewFrame = CGRectMake(x, y,_rect.size.width,_rect.size.height);
        
        
        //布局评论时间局域
        y = CGRectGetMaxY(_carPhotoViewFrame) - 20;
        _commentTimeViewFrame = CGRectMake(x, y, 260, 20);
    }
    //多张图片
    else
    {
        //布局标题内容区域
        CGFloat x = PHOTO_GAP;
        CGFloat y = 2*PHOTO_GAP;
        _rect = [self GetTitleContentFrame:_title andWidth:ScreenWidth];
        _titleContentViewFrame = CGRectMake(x, y,ScreenWidth,_rect.size.height);
        
        
        //布局图片局域
        y = CGRectGetMaxY(_titleContentViewFrame) + 2*PHOTO_GAP;
        _carPhotoViewFrame =CGRectMake(x,y,ScreenWidth-2*PHOTO_GAP,PHOTOVIEW_HEIGHT);
        
        
        //布局评论时间局域
        y = CGRectGetMaxY(_carPhotoViewFrame) + 2*PHOTO_GAP;
        _commentTimeViewFrame = CGRectMake(x, y, ScreenWidth-PHOTO_GAP, 20);
    }
    
    //记录单元格要增加的高度
    _photoHeight = PHOTOVIEW_HEIGHT;
    _titleHeight = _rect.size.height;
    _comTimeHeight = 20;
}
@end
