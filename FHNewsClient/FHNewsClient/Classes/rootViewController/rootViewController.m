//
//  rootViewController.m
//  凤凰新闻客户端
//
//  Created by ma c on 15/11/9.
//  Copyright (c) 2015年 xiayuanquan. All rights reserved.
//

#import "rootViewController.h"
#import "const.h"
#import "loginView.h"
#import "channelViewController.h"

@interface rootViewController()<UIScrollViewDelegate,UITabBarDelegate>
@property (strong,nonatomic)UITabBar *tabBar;        //自定义标签栏
@property (strong,nonatomic)UIView *sliderView;      //自定义滑动条
@property (strong,nonatomic)UIScrollView *scrollView;//滚动式视图,选中按钮时,会滚动
@property (strong,nonatomic)loginView *loginview;    //用户界面
@property (strong,nonatomic)channelViewController *channelVC; //显示频道的控制器
@end

#define SLIDERVIEW_ORIGIN_X 47
#define SLIDERVIEW_ORIGIN_Y 37
#define SLIDERVIEW_ORIGIN_WIDTH 40
#define SLIDERVIEW_ORIGIN_HEIGHT 3

@implementation rootViewController
//初始化
-(instancetype)init
{
    self = [super init];
    if (self) {
        //初始化隐藏用户界面
        _loginview = [[loginView alloc]init];
        _loginview.frame = CGRectMake(-ScreenWidth, 0, ScreenWidth, Screenheight);
        
        //初始化滑动条
        _sliderView = [[UIView alloc]initWithFrame:CGRectMake(SLIDERVIEW_ORIGIN_X, SLIDERVIEW_ORIGIN_Y, SLIDERVIEW_ORIGIN_WIDTH, SLIDERVIEW_ORIGIN_HEIGHT)];
        _sliderView.backgroundColor = [UIColor redColor];
        [self.view addSubview:_sliderView];
    }
    return self;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    
    //设置标签栏
    [self setTabBar];
    
    //设置图像按钮
    [self setImage];
 
    //设置滚动视图
    [self setScrollView];
    
    //创建扫动手势
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipe:)];
    swipe.numberOfTouchesRequired = 1;
    swipe.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipe];
}
//处理手势
-(void)swipe:(UISwipeGestureRecognizer *)sender
{
    if (sender.direction == UISwipeGestureRecognizerDirectionLeft)
    {
        [UIView animateWithDuration:0.2f animations:^{
            _loginview.frame = CGRectMake(-ScreenWidth, 0, ScreenWidth, Screenheight);
        }];
    }
}

//添加图像
-(void)setImage
{
    UIButton *button1 = [[UIButton alloc]init];
    button1.frame = CGRectMake(5, 10, 30, 25);
    [button1 setImage:[UIImage imageNamed:@"logo_menu"]forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(showLoginView:) forControlEvents:UIControlEventTouchUpInside];
    [self.tabBar addSubview:button1];
    
    
    UIButton *button2 = [[UIButton alloc]init];
    button2.frame = CGRectMake(340, 10, 25, 25);
    [button2 setImage:[UIImage imageNamed:@"setting_nav_img"] forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(showChannelName:) forControlEvents:UIControlEventTouchUpInside];
    [self.tabBar addSubview:button2];
}

//图像按钮1事件
-(void)showLoginView:(UIButton *)sender
{
    //动画显示用户界面
    [UIView animateWithDuration:0.2f animations:^{
        _loginview.frame = CGRectMake(0, 0, ScreenWidth, Screenheight);
        [self.view addSubview:_loginview];
    }];
}

//图像按钮2事件
-(void)showChannelName:(UIButton *)sender
{
    //模态出频道控制器窗口
    self.channelVC = [[channelViewController alloc]init];
    [self.view.window.rootViewController presentViewController:self.channelVC animated:nil completion:nil];
}

//设置标签栏
-(void)setTabBar
{
    //创建标签栏
    self.tabBar = [[UITabBar alloc]init];
    self.tabBar.frame = CGRectMake(0, 0, ScreenWidth, 40);
    
    //设置代理
    self.tabBar.delegate = self;
    
    
    //设置标签栏的外观
    [[UITabBarItem appearance]setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateNormal];
    [[UITabBarItem appearance]setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]} forState:UIControlStateSelected];
    
    
    //设置标签栏的单元项
    UITabBarItem *item1 = [[UITabBarItem alloc]initWithTitle:@"头条" image:nil tag:1];
    UITabBarItem *item2 = [[UITabBarItem alloc]initWithTitle:@"汽车" image:nil tag:2];
    UITabBarItem *item3 = [[UITabBarItem alloc]initWithTitle:@"娱乐" image:nil tag:3];
    UITabBarItem *item4 = [[UITabBarItem alloc]initWithTitle:@"美女" image:nil tag:4];
    NSArray *items = @[item1,item2,item3,item4];
    
    //设置偏移位置
    [item1 setTitlePositionAdjustment:UIOffsetMake(20, -15)];
    [item2 setTitlePositionAdjustment:UIOffsetMake(7, -15)];
    [item3 setTitlePositionAdjustment:UIOffsetMake(-7, -15)];
    [item4 setTitlePositionAdjustment:UIOffsetMake(-20, -15)];
    
    
    //将item全部添加进标签栏中
    [self.tabBar setItems:items];
    
    //默认“头条”选中
    self.tabBar.selectedItem = item1;
    
    //将活动指示器视图添加进标签栏中
    [self.tabBar addSubview:self.sliderView];
    
    //将标签栏添加进视图中
    [self.view addSubview:self.tabBar];
}

//设置滚动视图
-(void)setScrollView
{
    //创建滚动视图
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 40, ScreenWidth, Screenheight-SEARCHBAR_HEIGHT)];
    self.scrollView.pagingEnabled = YES;
    
    //设置滚动视图属性
    self.scrollView.contentSize = CGSizeMake(ScreenWidth*4, Screenheight-SEARCHBAR_HEIGHT);
    self.scrollView.delegate = self;
    
    CGFloat x = 0;
    CGFloat y = 0;
    
    //头条新闻
    self.headVC = [[HeadLineController alloc]init];
    self.headVC.view.frame = CGRectMake(x, y, ScreenWidth, Screenheight);
    self.headVC.view.backgroundColor = [UIColor redColor];
    [self.scrollView addSubview:self.headVC.view];
    
    
    //推荐新闻
    self.carVC = [[CarViewController alloc]init];
    self.carVC.view.frame = CGRectMake(x+ScreenWidth, y, ScreenWidth, Screenheight);
    self.carVC.view.backgroundColor = [UIColor greenColor];
    [self.scrollView addSubview:self.carVC.view];
    

    //娱乐新闻
    self.entertainmentVC = [[EntertainmentController alloc]init];
    self.entertainmentVC.view.frame = CGRectMake(x+2*ScreenWidth, y, ScreenWidth, Screenheight);
    self.entertainmentVC.view.backgroundColor = [UIColor redColor];
    [self.scrollView addSubview:self.entertainmentVC.view];
    
    
    //美女新闻
    self.beautyVC = [[BeautyGrilController alloc]init];
    self.beautyVC.view.frame = CGRectMake(x+3*ScreenWidth, y, ScreenWidth, Screenheight);
    self.beautyVC.view.backgroundColor = [UIColor brownColor];
    [self.scrollView addSubview:self.beautyVC.view];

    
    //将滚动视图添加进视图中
    [self.view addSubview:self.scrollView];
}

#pragma mark - <UIScrollViewDelegate>代理方法
//滚动视图时触发的方法
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //滚动视图的宽
    CGFloat width = scrollView.frame.size.width;
    
    //当前显示第几个视图
    NSInteger number = (int)scrollView.contentOffset.x / width;
    
    //获取对应的单元项item并设置为选中
    UITabBarItem *tempItem = [self.tabBar.items objectAtIndex:number];
    self.tabBar.selectedItem = tempItem;
    
    //滚动指示器视图
    CGRect frame =  self.sliderView.frame;
    frame = CGRectMake(SLIDERVIEW_ORIGIN_X+INDICATORVIEW_MOVE_DISTANCE*number, SLIDERVIEW_ORIGIN_Y, SLIDERVIEW_ORIGIN_WIDTH, SLIDERVIEW_ORIGIN_HEIGHT);
    self.sliderView.frame = frame;
}

#pragma mark - <UITabBarDelegate>
//选中单元格项时触发的方法
-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    CGFloat x = self.scrollView.frame.size.width * (item.tag-1);
    
    self.scrollView.contentOffset = CGPointMake(x, 0);
}
@end
