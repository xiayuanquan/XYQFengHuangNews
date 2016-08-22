//
//  LikeCommentShareView.m
//  凤凰新闻客户端
//
//  Created by ma c on 15/11/14.
//  Copyright (c) 2015年 xiayuanquan. All rights reserved.
//

#import "LikeCommentShareView.h"
#import "PicEntity.h"

@interface LikeCommentShareView() 
@property (strong,nonatomic)UIButton *likeButton;          //赞按钮,显示赞的图片
@property (strong,nonatomic)UILabel  *likeLabel;           //赞标签,显示赞的个数
@property (strong,nonatomic)UIButton *commentButton;       //评论按钮
@property (strong,nonatomic)UIButton *shareButton;         //分享按钮,显示分享文字
@property (strong,nonatomic)UILabel  *shareLabel;          //分享标签,显示赞的个数
@property (strong,nonatomic)UIButton *separatedLine1;      //分割线
@property (strong,nonatomic)UIButton *separatedLine2;      //分割线
@end

@implementation LikeCommentShareView

//初始化
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        //赞
        self.likeButton = [[UIButton alloc]init];
        self.likeButton.frame = CGRectMake(30,CGRectGetMinY(self.frame)+8,20,20);
        [self.likeButton setImage:[UIImage imageNamed:@"tag_support_unclick"] forState:UIControlStateNormal];
        
        self.likeLabel = [[UILabel alloc]init];
        self.likeLabel.frame = CGRectMake(50,CGRectGetMinY(self.frame)+8,60,20);
        [self addSubview:self.likeButton];
        [self addSubview:self.likeLabel];
        
        
        //分割线1
        self.separatedLine1 = [[UIButton alloc]init];
        self.separatedLine1.frame = CGRectMake(120, CGRectGetMinY(self.frame)+5, 2, 30);
        self.separatedLine1.backgroundColor = [UIColor lightGrayColor];
        [self.separatedLine1 setImage:[UIImage imageNamed:@"setting_fuction_midline"] forState:UIControlStateNormal];
        [self addSubview:self.separatedLine1];
        
        
        
        //评论按钮
        self.commentButton = [[UIButton alloc]init];
        self.commentButton.frame = CGRectMake(160,CGRectGetMinY(self.frame)+8,60,20);
        [self.commentButton setImage:[UIImage imageNamed:@"channel_list_new_comment"] forState:UIControlStateNormal];
        [self addSubview:self.commentButton];
        
        
        //分割线2
        self.separatedLine2 = [[UIButton alloc]init];
        self.separatedLine2.frame = CGRectMake(250, CGRectGetMinY(self.frame)+5, 2, 30);
        self.separatedLine2.backgroundColor = [UIColor lightGrayColor];
        [self.separatedLine2 setImage:[UIImage imageNamed:@"setting_fuction_midline"] forState:UIControlStateNormal];
        [self addSubview:self.separatedLine2];
        
        
        
        //分享
        self.shareButton = [[UIButton alloc]init];
        self.shareButton.frame = CGRectMake(290,CGRectGetMinY(self.frame)+8,20,20);
        [self.shareButton setImage:[UIImage imageNamed:@"sport_live_new_report_slide"] forState:UIControlStateNormal];
        
        self.shareLabel = [[UILabel alloc]init];
        self.shareLabel.frame = CGRectMake(310,CGRectGetMinY(self.frame)+3,40,30);
        [self addSubview:self.shareButton];
        [self addSubview:self.shareLabel];
    }
    return self;
}

//设置按钮上的文字
-(void)setPicEnity:(PicEntity *)picEnity
{
    _picEnity = picEnity;
    
    [self.likeLabel setText:[NSString stringWithFormat:@"%ld",_picEnity.likes]];
    [self.likeLabel setTextColor:[UIColor grayColor]];
    
    [self.commentButton setTitle:[NSString stringWithFormat:@"%ld",_picEnity.commentsall] forState:UIControlStateNormal];
    [self.commentButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    
    [self.shareLabel setText:@"分享"];
    [self.shareLabel setTextColor:[UIColor grayColor]];
}
@end
