//
//  detailPictureView.m
//  凤凰新闻客户端
//
//  Created by ma c on 15/11/15.
//  Copyright (c) 2015年 xiayuanquan. All rights reserved.
//

#import "detailPictureView.h"
#import "const.h"
#import "PicEntity.h"

@interface detailPictureView()
@property (strong,nonatomic)UIImageView *imageView;      //图像视图
@property (strong,nonatomic)UIToolbar   *ToptoolBar;     //工具栏
@property (strong,nonatomic)UIToolbar   *FoottoolBar;    //工具栏
@property (strong,nonatomic)UIImage     *image;          //当前图片
@end

@implementation detailPictureView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _imageView = [[UIImageView alloc]init];
        _imageView.frame = CGRectMake(0, 60, ScreenWidth, Screenheight-120);
        [self addSubview:_imageView];
        
        _ToptoolBar = [[UIToolbar alloc]init];
        _ToptoolBar.frame = CGRectMake(0, 0, ScreenWidth, 60);
        UILabel *label = [[UILabel alloc]init];
        label.textColor = [UIColor purpleColor];
        label.frame = CGRectMake(120, 15, 200, 40);
        label.text = @"美丽就在那一瞬间";
        [_ToptoolBar addSubview:label];
        [self addSubview:_ToptoolBar];
        
        _FoottoolBar = [[UIToolbar alloc]init];
        _FoottoolBar.frame = CGRectMake(0, Screenheight-60, ScreenWidth, 60);
        [self addSubview:_FoottoolBar];
    }
    return self;
}

-(void)setPicEntity:(PicEntity *)picEntity
{
    _picEntity = picEntity;
    
    //取出图片的URL
    NSDictionary *pic = [_picEntity.image firstObject];
    NSString *strURL = [pic objectForKey:@"url"];
    NSURL *URL = [NSURL URLWithString:strURL];
    NSData *data = [NSData dataWithContentsOfURL:URL];
    self.image = [UIImage imageWithData:data];
    
    //放置图片
    [_imageView setImage:self.image];
    
    
    //创建工具栏按钮
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(CancelBarButtonItemClicked:)];
    
    UIBarButtonItem *FlexibleItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];

    UIBarButtonItem *item2 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(SaveBarButtonItemClicked:)];
    
    [self.FoottoolBar setItems:@[item1,FlexibleItem,item2]];
    
    
    
//    UIButton *button1 = [[UIButton alloc]init];
//    button1.frame = CGRectMake(10, 15, 60, 60);
//    [button1 setImage:[UIImage imageNamed:@"ifeng_live_bottom_back_icon"] forState:UIControlStateNormal];
//    [self.FoottoolBar addSubview:button1];
//    
//    
//    UIButton *button2 = [[UIButton alloc]init];
//    button2.frame = CGRectMake(320, 15, 40, 50);
//    [button2 setImage:[UIImage imageNamed:@"pic_saved_icon"] forState:UIControlStateNormal];
//    [self.FoottoolBar addSubview:button2];
}

//按钮事件,返回
-(void)CancelBarButtonItemClicked:(UIBarButtonItem *)sender
{
    [UIView animateWithDuration:0.5f animations:^
     {
         self.imageView.image = nil;
         self.frame = CGRectMake(2*ScreenWidth, 0, ScreenWidth, Screenheight);
     }];
}

//按钮事件,保存图片
-(void)SaveBarButtonItemClicked:(UIBarButtonItem *)sender
{
    [self didSelectedSave];
}

-(void)didSelectedSave
{
    //开始图像绘制上下文
    UIGraphicsBeginImageContext(self.bounds.size);
    
    //绘制图片
    [self.image drawInRect:self.imageView.frame];
    
    //获取绘制的图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    //结束图像绘制上下文
    UIGraphicsEndImageContext();
    
    //保存图片
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
}
- (void)image: (UIImage *) image
didFinishSavingWithError: (NSError *) error
  contextInfo: (void *) contextInfo
{
    NSString *msg = nil;
    if(error)
    {
        msg = @"图片保存失败";
    }
    else
    {
        msg = @"图片保存成功";
    }
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"保存图片" message:msg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}
@end
