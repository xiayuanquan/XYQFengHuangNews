//
//  IFNews.m
//  凤凰新闻客户端
//
//  Created by ma c on 15/11/10.
//  Copyright (c) 2015年 xiayuanquan. All rights reserved.
//

#import "IFItemNews.h"
#import "const.h"
#import "ContentView.h"
#import "PictureView.h"
#import "TimeCommentView.h"

@interface IFItemNews()
@property (assign,nonatomic)CGRect rect;
@end

@implementation IFItemNews
//初始化新闻实体
-(instancetype)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self)
    {
        _thumbnail = [[dic objectForKey:@"thumbnail"]copy];
        _title = [[dic objectForKey:@"title"]copy];
        _updateTime = [[dic objectForKey:@"updateTime"]copy];
        _commentsall = [[dic objectForKey:@"commentsall"]copy];
        _style = [dic objectForKey:@"style"];
        _link = [dic objectForKey:@"link"];
        _styleType = [[dic objectForKey:@"styleType"]copy];
        _hasVideo = [[dic objectForKey:@"hasVideo"]integerValue];
    }
    return self;
}
//格式化时间
-(NSString *)formatDate
{
    NSString *date = self.updateTime;
    NSArray *dateStrs = [date componentsSeparatedByString:@" "];
    date = [[dateStrs lastObject] substringWithRange:NSMakeRange(0, 5)];
    return date;
}

//设置文字换行约束
-(CGRect)SetContraintedSizeWidth:(CGFloat) contrantedSizeWidth
{
   return [self.title boundingRectWithSize:CGSizeMake(contrantedSizeWidth, CONSTRAINED_SIZE_HEIGHT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:ITEM_CONTENT_FONT} context:nil];
}

//布局视图
-(void)caleViewFrame
{
    //单张图片
    if (!self.style)
    {
        self.rect = [self SetContraintedSizeWidth:CONSTRAINED_SIZE_WIDTH];
        self.photoviewFrame = CGRectMake(PHOTO_GAP, PHOTO_GAP, PHOTOVIEW_WIDTH,PHOTOVIEW_HEIGHT);
        self.contentViewFrame = (CGRect){{55,PHOTO_GAP},self.rect.size};
        self.imageViewFrame = self.photoviewFrame;
        
        
        CGFloat x = CGRectGetMaxX(self.photoviewFrame)+2*PHOTO_GAP;
        CGFloat y = CGRectGetMaxY(self.photoviewFrame)-TIME_COMMENT_LABEL_HEIGHT+PHOTO_GAP;
        CGFloat w = ScreenWidth-x-PHOTO_GAP;
        CGFloat h = TIME_COMMENT_LABEL_HEIGHT;
        self.timeCommentViewFrame = CGRectMake(x,y,w,h);
    }
    //多张图片
    if(self.style)
    {
        self.rect = [self SetContraintedSizeWidth:ScreenWidth];
        self.contentViewFrame = CGRectMake(PHOTO_GAP,PHOTO_GAP, self.rect.size.width, self.rect.size.height);
        self.photoviewFrame = CGRectMake(0,CGRectGetMaxY(self.contentViewFrame) + PHOTO_GAP,ScreenWidth,PHOTOVIEW_HEIGHT);
        
        
        CGFloat x = 2*PHOTO_GAP;
        CGFloat y = CGRectGetMaxY(self.photoviewFrame) + PHOTO_GAP;
        CGFloat w = ScreenWidth - 2*x;
        CGFloat h = TIME_COMMENT_LABEL_HEIGHT;
        self.timeCommentViewFrame= CGRectMake(x,y,w,h);
    }
    
    //文字和图片各自所占用的高度
    self.contentHeight = self.rect.size.height;
    self.PhotoHeight = PHOTOVIEW_HEIGHT;
}
@end
