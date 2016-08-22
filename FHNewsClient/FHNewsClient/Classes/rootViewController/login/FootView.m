//
//  FootView.m
//  凤凰新闻客户端
//
//  Created by ma c on 15/11/15.
//  Copyright (c) 2015年 xiayuanquan. All rights reserved.
//

#import "FootView.h"

@interface FootView()
@property (strong,nonatomic)UIButton *patternButton;
@property (strong,nonatomic)UIButton *cacheButton;
@property (strong,nonatomic)UIButton *feedbackButton;
@property (strong,nonatomic)UIButton *settingButton;
@end

@implementation FootView
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _patternButton = [[UIButton alloc]initWithFrame:CGRectMake(30, 100, 40, 40)];
        [_patternButton setBackgroundImage:[UIImage imageNamed:@"email_reg_success_icon"] forState:UIControlStateNormal];
        [_patternButton setTitle:@"夜间" forState:UIControlStateNormal];
        [_patternButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_patternButton setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, -60, 0)];
        [self addSubview:_patternButton];
        
        _cacheButton = [[UIButton alloc]initWithFrame:CGRectMake(120, 100, 40, 40)];
        [_cacheButton setBackgroundImage:[UIImage imageNamed:@"my_download"] forState:UIControlStateNormal];
        [_cacheButton setTitle:@"离线" forState:UIControlStateNormal];
        [_cacheButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_cacheButton setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, -60, 0)];
        [self addSubview:_cacheButton];
        
        _feedbackButton = [[UIButton alloc]initWithFrame:CGRectMake(210,100, 40, 40)];
        [_feedbackButton setBackgroundImage:[UIImage imageNamed:@"opinion_feedback"] forState:UIControlStateNormal];
        [_feedbackButton setTitle:@"反馈" forState:UIControlStateNormal];
        [_feedbackButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_feedbackButton setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, -60, 0)];
        [self addSubview:_feedbackButton];
        
        _settingButton = [[UIButton alloc]initWithFrame:CGRectMake(300, 100, 40, 40)];
        [_settingButton setBackgroundImage:[UIImage imageNamed:@"setting"] forState:UIControlStateNormal];
        [_settingButton setTitle:@"设置" forState:UIControlStateNormal];
        [_settingButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_settingButton setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, -60, 0)];
        [self addSubview:_settingButton];
    }
    return self;
}
@end
