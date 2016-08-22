//
//  etmSectionView.m
//  凤凰新闻客户端
//
//  Created by ma c on 15/11/18.
//  Copyright (c) 2015年 xiayuanquan. All rights reserved.
//

#import "etmSectionView.h"
#import "const.h"
#import "UIImageView+WebCache.h"
#import "etmEntity.h"

@interface etmSectionView()
@property (strong,nonatomic)UIImageView *imageView;
@property (strong,nonatomic)UILabel *label;
@end

@implementation etmSectionView

//初始化
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        //图像
        _imageView = [[UIImageView alloc]init];
        _imageView.backgroundColor = [UIColor purpleColor];
        _imageView.frame  =CGRectMake(0, 0, ScreenWidth, 200);
        [self addSubview:_imageView];
        
        //标题
        _label = [[UILabel alloc]init];
        _label.frame = CGRectMake(5, 160, ScreenWidth, 30);
        _label.textColor = [UIColor whiteColor];
        [self addSubview:_label];
    }
    return self;
}

//重写set方法,接收实体对象
-(void)setEntity:(etmEntity *)entity
{
    _entity = entity;
    
    //设置图片
    NSURL *URL = [NSURL URLWithString:entity.thumbnail];
    [_imageView sd_setImageWithURL:URL placeholderImage:[UIImage imageNamed:@"channel_list_new_default_normal"]];
    
    //设置标题
    _label.text = _entity.title;
}
@end
