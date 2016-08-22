//
//  EntertainmentController.m
//  凤凰新闻客户端
//
//  Created by ma c on 15/11/9.
//  Copyright (c) 2015年 xiayuanquan. All rights reserved.
//

#import "EntertainmentController.h"
#import "const.h"
#import "AFNetworking.h"
#import "etmEntity.h"
#import "etmCustomCell.h"
#import "etmSectionView.h"
#import "DetailViewController.h"

@interface EntertainmentController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong,nonatomic)UISearchController *searchController;
@property (strong,nonatomic)UITableView *tableView; //表格视图
@property (strong,nonatomic)NSMutableArray *entityArray; //存放新闻实体
@property (strong,nonatomic)UIRefreshControl *refreshControl; //刷新控件
@property (strong,nonatomic)UIActivityIndicatorView *indicatorView;//活动指示视图
@end

@implementation EntertainmentController

//初始化
-(instancetype)init
{
    self = [super init];
    if (self)
    {
        //创建表格视图
        CGRect rect = CGRectMake(0, SEARCHBAR_HEIGHT, ScreenWidth, Screenheight-SEARCHBAR_HEIGHT);
        _tableView = [[UITableView alloc]initWithFrame:rect style:UITableViewStyleGrouped];
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        [self.view addSubview:_tableView];
        
        //创建数组
        _entityArray = [NSMutableArray array];
        
        
        //初始化刷新控件
        _refreshControl = [[UIRefreshControl alloc]init];
        [_refreshControl addTarget:self action:@selector(refreshControl:) forControlEvents:UIControlEventValueChanged];
        _refreshControl.backgroundColor = [UIColor lightGrayColor];
        _refreshControl.tintColor = [UIColor whiteColor];
        [self.tableView addSubview:_refreshControl];
        
        
        //初始化活动刷新指示器
        _indicatorView = [[UIActivityIndicatorView alloc]initWithFrame:self.tableView.frame];
        _indicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
        _indicatorView.color = [UIColor redColor];
        [self.tableView addSubview:_indicatorView];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
 
    //设置搜索栏
    [self setSearchBar];
    
    //设置数据源
    self.tableView.dataSource = self;
    
    //加载数据
    [self loadNewsData];
}

//下拉刷新
-(void)refreshControl:(UIRefreshControl *)sender
{
    //开始刷新
    [sender beginRefreshing];
    
    //设置刷新时的文字提示
    NSAttributedString *str = [[NSAttributedString alloc]initWithString:@"正在加载..." attributes:@{NSForegroundColorAttributeName:[UIColor redColor],NSFontAttributeName:ITEM_CONTENT_FONT}];
    sender.attributedTitle = str;
    
    //重新加载新闻数据
    [self loadNewsData];
}

//设置搜索栏
-(void)setSearchBar
{
    self.searchController = [[UISearchController alloc]initWithSearchResultsController:nil];
    self.searchController.searchBar.frame = CGRectMake(0, 0, ScreenWidth, SEARCHBAR_HEIGHT);
    [self.view addSubview:self.searchController.searchBar];
}

//加载数据
-(void)loadNewsData
{
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    manager.responseSerializer = [[AFJSONResponseSerializer alloc]init];
    
    [manager GET:kStringEnterTainMentURL parameters:nil
     
         success:^(AFHTTPRequestOperation *operation, NSArray *responseObject) {
             
             //NSLog(@"%@",responseObject);
             
             [responseObject enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL *stop) {
                 
                 NSArray *items = [obj objectForKey:@"item"];
                 
                 [items enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL *stop) {
                     
                     etmEntity *Entity = [[etmEntity alloc]initWithDic:obj];
                     
                     [self.entityArray addObject:Entity];
                 }];
                 
             }];
             
             //刷新表格
             [self.tableView reloadData];
             
             //停止活动指示器
             [self.indicatorView stopAnimating];
             
             //停止刷新
             [self.refreshControl endRefreshing];
             
         }
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             
             NSLog(@"%@",error);
         }];
}

#pragma mark - 数据源方法
//多少组
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
//多少行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.entityArray.count - 1;
}
//设置每一个单元格的内容
-(etmCustomCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //1.根据reuseIdentifier，先到对象池中去找重用的单元格对象
    static NSString *reuseIdentifier = @"Cell";
    etmCustomCell *cell = [self.tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    
    //2.如果没有找到，自己创建单元格对象
    if(cell == nil)
    {
        cell = [[etmCustomCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    
    //3.设置单元格对象的内容
    etmEntity *Entity = [self.entityArray objectAtIndex:indexPath.row];
    [Entity caleAllFrame];
    [cell setEtmEntity:Entity];
    
    return cell;
}

#pragma mark - 代理方法

//返回单元个的高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    etmEntity *Entity = [self.entityArray objectAtIndex:indexPath.row];
    if (Entity.style == nil)
    {
        return CELL_SINGLE_PHOTO_HEIGHT  + Entity.photoHeight;
    }
    else
    {
        return CELL_MANY_PHOTO_HEIGHT + Entity.titleHeight + Entity.photoHeight + Entity.comTimeHeight;
    }
}
//返回表头
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    etmSectionView *sectionView = [[etmSectionView alloc]initWithFrame:CGRectMake(0, SEARCHBAR_HEIGHT, ScreenWidth, 200)];
    sectionView.pagingEnabled = YES;
    sectionView.contentSize = CGSizeMake(ScreenWidth, 200);
    sectionView.showsHorizontalScrollIndicator = NO;
    [sectionView setEntity:[self.entityArray lastObject]];
    return sectionView;
}

//返回表头的高
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 200;
}

//选中单元格时的处理
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //创建模态窗口并传递数据
    DetailViewController *detailVC= [[DetailViewController alloc]init];
    detailVC.modalTransitionStyle = UIModalTransitionStylePartialCurl;
    [self.view.window.rootViewController presentViewController:detailVC animated:YES completion:^{
        
        //发送通知,将当前单元格的实体发送给详细控制器
        etmEntity *Entity = [self.entityArray objectAtIndex:indexPath.row];
        
        [[NSNotificationCenter defaultCenter]postNotificationName:@"DetailVC" object:Entity];
        
        etmCustomCell *cell = (etmCustomCell*)[tableView cellForRowAtIndexPath:indexPath];
        cell.selected = NO;
    }];
}
@end
