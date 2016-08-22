//
//  CustomCollectionViewCell.m
//  凤凰新闻客户端
//
//  Created by ma c on 15/11/16.
//  Copyright (c) 2015年 xiayuanquan. All rights reserved.
//

#import "CustomCollectionViewCell.h"
#import "const.h"

@interface CustomCollectionViewCell()
@property (strong,nonatomic)UIButton *button;         //在单元项放文字
@property (assign,nonatomic)CGFloat  width;           //单元项宽
@end

@implementation CustomCollectionViewCell
//初始化
-(instancetype)init
{
    self = [super init];
    if (self)
    {
        self.button = [[UIButton alloc]init];
        [self.contentView addSubview:self.button];
    }
    return self;
}
//接受参数
-(void)sendCell:(CustomCollectionViewCell *)cell andIndexPath:(NSIndexPath *)indexPath andSectionArray:(NSArray *)SectionArray
{
    //如果label存在就从父视图移除,防止单元格重用
    if (self.button)
    {
        [self.button removeFromSuperview];
    }
    
    //设置文字
    self.width = (ScreenWidth - COLLECTION_CELL_GAP * 5) / 4;
    self.button = [[UIButton alloc]init];
    self.button.frame = CGRectMake(0, 0, self.width, 44);
    [self.button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.button.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.button setTitle:[SectionArray objectAtIndex:indexPath.item] forState:UIControlStateNormal];
    [self.contentView addSubview:self.button];
    
    
    //设置第一组第一个项文字为红色
    if (indexPath.section == 0 && indexPath.item == 0)
    {
        [self.button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];

    }
    
    //设置第二组最后一项文字为红色,而且单元格只有边框
    if (indexPath.section == 1 && indexPath.item == SectionArray.count-1)
    {
        self.button.backgroundColor = [UIColor lightGrayColor];
        [self.button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        self.button.layer.borderColor = [[UIColor whiteColor]CGColor];
        self.button.layer.borderWidth = 0.5;
    }
}

@end
