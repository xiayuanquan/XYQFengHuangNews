//
//  TopView.m
//  凤凰新闻客户端
//
//  Created by ma c on 15/11/16.
//  Copyright (c) 2015年 xiayuanquan. All rights reserved.
//

#import "TopView.h"

@implementation TopView
//初始化
-(instancetype)init
{
    self = [super init];
    if (self)
    {

        UILabel *itemLabel = [[UILabel alloc]init];
        itemLabel.frame = CGRectMake(5, 5, 100, 30);
        itemLabel.text = @"点击进入频道";
        itemLabel.textColor = [UIColor lightGrayColor];
        itemLabel.font = [UIFont systemFontOfSize:14];
        [self addSubview:itemLabel];
        
        
        UIBarButtonItem *flexibleItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        
        UIBarButtonItem *item2 = [[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(EditBarButtonItemclicked:)];
        [item2 setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateNormal];
        
        [self setItems:@[flexibleItem,item2]];
    }
    return self;
}

-(void)EditBarButtonItemclicked:(UIBarButtonItem *)sender
{
    
}
@end
