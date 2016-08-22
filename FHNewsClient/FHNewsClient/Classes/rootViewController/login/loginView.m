//
//  loginView.m
//  凤凰新闻客户端
//
//  Created by ma c on 15/11/14.
//  Copyright (c) 2015年 xiayuanquan. All rights reserved.
//

#import "loginView.h"
#import "const.h"
#import "HeadView.h"
#import "FootView.h"
#import "LoginViewController.h"
#import "MYOrderView.h"

@interface loginView()<UITableViewDataSource,UITableViewDelegate>
@property (strong,nonatomic)UITableView *tableView;    //表格视图
@property (strong,nonatomic)NSArray *titlesArray;      //单元格内容数组
@property (strong,nonatomic)MYOrderView *myOrderView;  //订阅视图
@end

@implementation loginView

//初始化
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor grayColor];
        
        //表格视图
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, Screenheight) style:UITableViewStyleGrouped];
        _tableView.alwaysBounceVertical = NO;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [self addSubview:_tableView];
        
        //单元格内容数组
        _titlesArray = @[@"消息",@"订阅",@"商城",@"评论",@"收藏"];
        
        
        //订阅视图
        _myOrderView = [[MYOrderView alloc]init];
        _myOrderView.frame = CGRectMake(ScreenWidth, 0, ScreenWidth, Screenheight);
    }
    return self;
}

#pragma mark - <UITableViewDataSource>
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titlesArray.count;
}
//设置每一个单元格的内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //1.根据reuseIdentifier，先到对象池中去找重用的单元格对象
    static NSString *reuseIdentifier = @"Cell";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    //2.如果没有找到，自己创建单元格对象
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    //3.设置单元格对象的内容
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = [self.titlesArray objectAtIndex:indexPath.row];
    return cell;
}
//设置单元格的高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return ceil(267/self.titlesArray.count);
}

#pragma mark - <UITableViewDelegate>
//设置表头视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    HeadView *headview = [[HeadView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 200)];
    headview.backgroundColor = [UIColor brownColor];
    return headview;
}
//设置表头视图的高
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 200;
}


//设置表尾视图
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    FootView *footview = [[FootView alloc]initWithFrame:CGRectMake(0, Screenheight-200, ScreenWidth, 200)];
    footview.backgroundColor = [UIColor brownColor];
    return footview;
}
//设置表尾视图的高
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 200;
}

//选中单元格时的操作
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if ([cell.textLabel.text isEqualToString:@"消息"] || [cell.textLabel.text isEqualToString:@"评论"] || [cell.textLabel.text isEqualToString:@"收藏"])
    {
        LoginViewController *loginVC= [[LoginViewController alloc]init];
        loginVC.view.backgroundColor = [UIColor lightGrayColor];
        [self.window.rootViewController presentViewController:loginVC animated:nil completion:nil];
    }
    
    if ([cell.textLabel.text isEqualToString:@"订阅"])
    {
        [UIView animateWithDuration:0 animations:^{
            
            _myOrderView.backgroundColor = [UIColor whiteColor];
            _myOrderView.frame = CGRectMake(0, 0, ScreenWidth, Screenheight);
            [self.superview addSubview:_myOrderView];
        }];
    }
    
    //取消选中效果
    [cell setSelected:NO];
}
@end
