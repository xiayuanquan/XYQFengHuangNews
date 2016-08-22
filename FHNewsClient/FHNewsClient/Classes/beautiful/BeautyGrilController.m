//
//  FinanceController.m
//  凤凰新闻客户端
//
//  Created by ma c on 15/11/9.
//  Copyright (c) 2015年 xiayuanquan. All rights reserved.
//

#import "BeautyGrilController.h"
#import "const.h"
#import "AFNetworking.h"
#import "MyCustomCollectionCell.h"
#import "PicEntity.h"
#import "detailPictureView.h"

@interface BeautyGrilController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (strong,nonatomic)UISearchController *searchController;   //搜索吧控制器
@property (strong,nonatomic)UICollectionView *collectionView;       //集合视图
@property (strong,nonatomic)UICollectionViewFlowLayout *flowLayout; //流式布局
@property (strong,nonatomic)NSMutableArray *picEntitys;             //数组存放图片实体
@property (strong,nonatomic)UIRefreshControl *refreshControl;       //刷新控件
@property (strong,nonatomic)detailPictureView *detailPicView;       //显示选中的图片
@end

@implementation BeautyGrilController

//初始化
-(instancetype)init
{
    self = [super init];
    if (self)
    {
        _flowLayout = [[UICollectionViewFlowLayout alloc]init];
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, SEARCHBAR_HEIGHT, ScreenWidth, Screenheight-SEARCHBAR_HEIGHT) collectionViewLayout:_flowLayout];
        _collectionView.backgroundColor = [UIColor lightGrayColor];
        [self.view addSubview:_collectionView];
        
        
        _detailPicView = [[detailPictureView alloc]init];
        _detailPicView.frame = CGRectMake(2*ScreenWidth, 0,ScreenWidth, Screenheight);
        
        
        _refreshControl = [[UIRefreshControl alloc]init];
        [self.refreshControl addTarget:self action:@selector(refreshEvent:) forControlEvents:UIControlEventValueChanged];
        [self.collectionView addSubview:_refreshControl];
    }
    return self;
}

//懒加载数组
-(NSMutableArray *)picEntitys
{
    if (!_picEntitys)
    {
        _picEntitys = [NSMutableArray array];
    }
    return _picEntitys;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置数据源和代理
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
    //注册单元格
    [self.collectionView registerClass:[MyCustomCollectionCell class] forCellWithReuseIdentifier:@"collectionCell"];
    
    self.flowLayout.itemSize = CGSizeMake(ScreenWidth,Screenheight-SEARCHBAR_HEIGHT);
    
    //设置搜索栏
    [self setSearchBar];
    
    //加载图片数据
    [self loadPictureSource];
}

//刷新处理
-(void)refreshEvent:(UIRefreshControl *)sender
{
    //启动刷新控件
    [sender beginRefreshing];
    
    NSAttributedString *str = [[NSAttributedString alloc]initWithString:@"正在加载..." attributes:@{NSForegroundColorAttributeName:[UIColor redColor],NSFontAttributeName:ITEM_CONTENT_FONT}];
    sender.attributedTitle = str;

    //重新加载数据
    [self loadPictureSource];
}

//设置搜索栏
-(void)setSearchBar
{
    self.searchController = [[UISearchController alloc]initWithSearchResultsController:nil];
    self.searchController.searchBar.frame = CGRectMake(0, 0, ScreenWidth, SEARCHBAR_HEIGHT);
    self.searchController.searchBar.placeholder = @"刘亦菲";
    [self.view addSubview:self.searchController.searchBar];
}

//加载图片数据
-(void)loadPictureSource
{
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    manager.responseSerializer = [[AFJSONResponseSerializer alloc]init];
    
    [manager POST:kStringBeautyGrilURL parameters:nil
     
    success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject)
    {
        
        NSArray *array = [responseObject objectForKey:@"body"];
        
        [array enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL *stop)
        {
            //用没举出的图片字典初始化
            PicEntity *picEntity = [[PicEntity alloc]initWithDic:obj];
            
            //将图片字典存放到数组中
            [self.picEntitys addObject:picEntity];
        }];
        
        //刷新表格
        [self.collectionView reloadData];
        
        //停止刷新
        [self.refreshControl endRefreshing];
    }
    failure:^(AFHTTPRequestOperation *operation, NSError *error)
    {
        NSLog(@"%@",error);
    }];
}

#pragma mark - 数据源方法
//返回组数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

//返回集合视图单元项
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.picEntitys.count;
}

//显示conllectionView的单元格
-(MyCustomCollectionCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //设置重用单元格
    static NSString *reuseIndentifier = @"collectionCell";
    MyCustomCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIndentifier forIndexPath:indexPath];
    if(!cell)
    {
        cell = [[MyCustomCollectionCell alloc]init];
    }
    
    //取出当前图片字典实体
    PicEntity *picEntity = [self.picEntitys objectAtIndex:indexPath.item];
    [cell setPicEnity:picEntity];
    cell.backgroundColor = [UIColor whiteColor];
    
    return cell;
}

#pragma mark - 代理方法
//返回单元项距离边界的距离
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}
//最小行间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 5;
}
//选中单元格时的处理
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [UIView animateWithDuration:0.5f animations:^
    {
        self.detailPicView.frame = CGRectMake(0, 0, ScreenWidth, Screenheight);
        self.detailPicView.backgroundColor = [UIColor lightGrayColor];
        [self.view.window.rootViewController.view addSubview:self.detailPicView];
        
    } completion:^(BOOL finished) {
        
        PicEntity *picEntity = [self.picEntitys objectAtIndex:indexPath.item];
        [self.detailPicView setPicEntity:picEntity];
    }];
}
@end
