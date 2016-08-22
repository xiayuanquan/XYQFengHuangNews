//
//  HeadLineController.m
//  凤凰新闻客户端
//
//  Created by ma c on 15/11/9.
//  Copyright (c) 2015年 xiayuanquan. All rights reserved.
//

#import "HeadLineController.h"
#import "const.h"
#import "ScrollView.h"
#import "AFNetworking.h"
#import "IFItemNews.h"
#import "CustomCell.h"
#import "ScrollView.h"
#import "IFItemNews.h"
#import "DetailViewController.h"

@interface HeadLineController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong,nonatomic)UISearchController *searchController; //搜索吧控制器
@property (strong,nonatomic)UITableView *tableView;           //表格视图
@property (strong,nonatomic)NSMutableArray *itemsArrayM;      //数组存放新闻实体
@property (strong,nonatomic)UIRefreshControl *refreshControl; //刷新控件
@property (strong,nonatomic)ScrollView *scrollView;           //滚动视图
@property (strong,nonatomic)UIActivityIndicatorView *indicatorView;//活动指示视图
@end

@implementation HeadLineController
//初始化
-(instancetype)init
{
    self = [super init];
    if (self) {
        
        //初始化数组
        _itemsArrayM = [NSMutableArray array];
        
        //初始化刷新控件
        _refreshControl = [[UIRefreshControl alloc]init];
        [_refreshControl addTarget:self action:@selector(refreshControl:) forControlEvents:UIControlEventValueChanged];
        _refreshControl.backgroundColor = [UIColor lightGrayColor];
        _refreshControl.tintColor = [UIColor whiteColor];
        
        
        //初始化表格
        self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, SEARCHBAR_HEIGHT, ScreenWidth,Screenheight-SEARCHBAR_HEIGHT) style:UITableViewStyleGrouped];
        
        //初始化活动刷新指示器
        _indicatorView = [[UIActivityIndicatorView alloc]initWithFrame:self.tableView.frame];
        _indicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
        _indicatorView.color = [UIColor redColor];
 
        
        
        //往视图中添加控件
        [self.tableView addSubview:_refreshControl];
        [self.tableView addSubview:_indicatorView];
        [self.view addSubview:self.tableView];
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //设置搜索栏
    [self setSearchBar];
    
    //设置数据源和代理
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    //加载新闻数据
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
    
    self.searchController.searchBar.placeholder = @"巴黎袭击";
    
    [self.view addSubview:self.searchController.searchBar];
}

//加载新闻数据
-(void)loadNewsData
{
    //启动活动指示器
    [self.indicatorView startAnimating];
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    manager.responseSerializer = [[AFJSONResponseSerializer alloc]init];
    
    [manager GET:kStringHeadLineURL parameters:nil
    success:^(AFHTTPRequestOperation *operation, NSArray *responseObject)
    {
        //NSLog(@"%@",responseObject);
        
        //依次取出字典
        [responseObject enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL *stop)
        {
            NSArray *item = [obj objectForKey:@"item"];
            [item enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL *stop)
            {
                 IFItemNews *itemEntity = [[IFItemNews alloc]initWithDic:obj];
                 [self.itemsArrayM addObject:itemEntity];
            }];
        }];
        //刷新表格
        [self.tableView reloadData];
        
        //停止活动指示器
        [self.indicatorView stopAnimating];
        
        //停止刷新
        [self.refreshControl endRefreshing];
        
    }
    failure:^(AFHTTPRequestOperation *operation, NSError *error)
    {
        NSLog(@"%@",error);
    }];
}

#pragma mark - <UITableViewDataSource>
//返回多少组
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
//返回多少行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.itemsArrayM.count;
}
//设置每一个单元格的内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //1.根据reuseIdentifier，先到对象池中去找重用的单元格对象
    static NSString *reuseIdentifier = @"Cell";
    CustomCell *cell = [self.tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    //2.如果没有找到，自己创建单元格对象
    if(cell == nil)
    {
        cell = [[CustomCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
        cell.backgroundColor = [UIColor whiteColor];
    }
    IFItemNews *itemEntity = self.itemsArrayM[indexPath.row];
    [itemEntity caleViewFrame];
    [cell setItemEntity:itemEntity];
    
    return cell;
}

#pragma mark - <UITableViewDelegate>
//设置单元格行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    IFItemNews *itemEntity = [self.itemsArrayM objectAtIndex:indexPath.row];
    
    //判断是否有多张配图来确定单元格的高
    if (!itemEntity.style)
    {
        return CELL_SINGLE_PHOTO_HEIGHT  + itemEntity.PhotoHeight;
    }
    else
    {
        return CELL_MANY_PHOTO_HEIGHT + itemEntity.contentHeight + itemEntity.PhotoHeight;
    }
}

//设置表头视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    self.scrollView = [[ScrollView alloc]init];
    return self.scrollView;
}

//返回表头高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return SCROLLVIEW_HEIGHT;
}

//选中单元格时的处理
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //创建模态窗口并传递数据
    DetailViewController *detailVC= [[DetailViewController alloc]init];
    detailVC.modalTransitionStyle = UIModalTransitionStylePartialCurl;
    [self.view.window.rootViewController presentViewController:detailVC animated:YES completion:^{
        
        //发送通知,将当前单元格的实体发送给详细控制器
        IFItemNews *itemEntity = [self.itemsArrayM objectAtIndex:indexPath.row];
        
        [[NSNotificationCenter defaultCenter]postNotificationName:@"DetailVC" object:itemEntity];
        
        CustomCell *cell = (CustomCell*)[tableView cellForRowAtIndexPath:indexPath];
        cell.selected = NO;
    }];
}

@end
