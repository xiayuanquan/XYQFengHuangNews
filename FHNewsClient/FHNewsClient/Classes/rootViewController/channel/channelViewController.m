//
//  channelViewController.m
//  凤凰新闻客户端
//
//  Created by ma c on 15/11/16.
//  Copyright (c) 2015年 xiayuanquan. All rights reserved.
//

#import "channelViewController.h"
#import "const.h"
#import "TopView.h"
#import "footView.h"
#import "CustomCollectionViewCell.h"

@interface channelViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (strong,nonatomic)UICollectionView *collectionView;        //集合视图
@property (strong,nonatomic)UICollectionViewFlowLayout *flowLayOut;  //流式布局
@property (strong,nonatomic)TopView *topView;                        //头工具栏
@property (strong,nonatomic)footView *footView;                      //尾工具栏
@property (strong,nonatomic)NSArray *sectionOneArray;                //第一组数据源
@property (strong,nonatomic)NSArray *sectionTwoArray;                //第二组数据源
@property (assign,nonatomic)CGFloat  width;                          //单元项宽
@end

static NSString *reuseIndentifier = @"collectionCell";
static NSString *reuserViewIndentifier = @"reuseView";

@implementation channelViewController

//初始化
-(instancetype)init
{
    self = [super init];
    if (self)
    {
        _flowLayOut = [[UICollectionViewFlowLayout alloc]init];
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, SEARCHBAR_HEIGHT, ScreenWidth, Screenheight-2*SEARCHBAR_HEIGHT) collectionViewLayout:_flowLayOut];
        _collectionView.backgroundColor = [UIColor lightGrayColor];
        [self.view addSubview:_collectionView];
        
        
        _topView = [[TopView alloc]init];
        _topView.frame = CGRectMake(0, 0, ScreenWidth, SEARCHBAR_HEIGHT);
        [self.view addSubview:_topView];
        
        
        _footView = [[footView alloc]init];
        _footView.frame = CGRectMake(0, Screenheight-SEARCHBAR_HEIGHT, ScreenWidth, SEARCHBAR_HEIGHT);
        [self.view addSubview:_footView];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置集合视图数据源和代理
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.alwaysBounceVertical = YES;
    
    //设置集合单元格项大小
    self.width = (ScreenWidth - COLLECTION_CELL_GAP * 5) / 4;
    self.flowLayOut.itemSize = CGSizeMake(self.width, 44);
    
    
    //准备数据源
    self.sectionOneArray = @[@"头条",@"推荐",@"娱乐",@"财经",
                             @"北京",@"自媒体",@"时政",@"凤凰卫视",
                             @"美女",@"段子",@"FM",@"萌物",
                             @"军事",@"体育",@"历史",@"科技",
                             @"汽车",@"时尚",@"暖新闻",@"FUN来了",
                             @"直播"];
    self.sectionTwoArray = @[@"国际",@"评论",@"未来",@"主笔",
                             @"星座",@"NBA",@"台湾",@"电影",
                             @"专题",@"国学",@"房产",@"原创",
                             @"深度",@"旅游",@"健康",@"港澳",
                             @"读书",@"数码",@"游戏",@"佛教",
                             @"凤凰影响",@"家居",@"跑步",@"图片",
                             @"创投",@"文化",@"公益",@"博报",
                             @"酒业",@"更多"];
    
    //注册集合视图
    [self.collectionView registerClass:[CustomCollectionViewCell class] forCellWithReuseIdentifier:reuseIndentifier];
    
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:reuserViewIndentifier];
}

#pragma mark - 数据源方法
//多少组
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}
//每一组多行项
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section ==0)
    {
        return 21;
    }
    else
    {
        return 30;
    }
}
//显示conllectionView的单元格
-(CustomCollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //设置重用单元格
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIndentifier forIndexPath:indexPath];
    if(!cell)
    {
        cell = [[CustomCollectionViewCell alloc]init];
    }
    cell.backgroundColor = [UIColor whiteColor];
    
    //设置cell的内容
    if (indexPath.section == 0)
    {
        [cell sendCell:cell andIndexPath:indexPath andSectionArray:self.sectionOneArray];
    }
    else
    {
        [cell sendCell:cell andIndexPath:indexPath andSectionArray:self.sectionTwoArray];
    }
    return cell;
}

#pragma mark - 代理方法
//距离边界的大小
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(COLLECTION_CELL_GAP, COLLECTION_CELL_GAP, COLLECTION_CELL_GAP, COLLECTION_CELL_GAP);
}
//最小列间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return COLLECTION_CELL_GAP;
}
//最小行间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return COLLECTION_CELL_GAP;
}
//设置重用表头视图
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reuseView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:reuserViewIndentifier forIndexPath:indexPath];
    if (!reuseView)
    {
        reuseView = [[UICollectionReusableView alloc]init];
    }
    
    //在第二组表头视图设置文字标签
    if (indexPath.section == 1)
    {
        UILabel *label = [[UILabel alloc]init];
        label.frame = CGRectMake(5, 15, 200, 30);
        label.text = @"更多频道/点击添加";
        label.font = [UIFont systemFontOfSize:15];
        label.textColor = [UIColor whiteColor];
        [reuseView addSubview:label];
    }
    
    return reuseView;
}
//设置表头视图大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return CGSizeMake(ScreenWidth, 20);
    }
    else
    {
        return CGSizeMake(ScreenWidth, 60);
    }
}
@end
