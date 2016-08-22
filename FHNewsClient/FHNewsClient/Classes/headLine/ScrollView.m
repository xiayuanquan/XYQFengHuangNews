//
//  ScrollView.m
//  凤凰新闻客户端
//
//  Created by ma c on 15/11/9.
//  Copyright (c) 2015年 xiayuanquan. All rights reserved.
//

#import "ScrollView.h"
#import "const.h"
#import "UIImageView+WebCache.h"

@interface ScrollView()
@end

@implementation ScrollView
//初始化
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _scrollView = [[UIScrollView alloc]init];
        _scrollView.frame = CGRectMake(0, 0, ScreenWidth, SCROLLVIEW_HEIGHT);
        [self addSubview:_scrollView];
        [self setScrollView];
    }
    return self;
}

//设置滚动视图
-(void)setScrollView
{
    //设置滚动视图的属性
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;

    CGFloat width = ScreenWidth;
    NSInteger count = 4;
    self.scrollView.contentSize = CGSizeMake(ScreenWidth*count, SCROLLVIEW_HEIGHT);
    
    //设置滚动视图的图片
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = ScreenWidth;
    CGFloat h = SCROLLVIEW_HEIGHT;
    
    for (int i=0; i<count; i++)
    {
        x = width * i;
        
        self.imageView = [[UIImageView alloc]init];
        self.imageView.frame = CGRectMake(x, y, w, h);
        self.imageView.contentMode = UIViewContentModeScaleAspectFill;
        [self.imageView sd_setImageWithURL:nil placeholderImage:[UIImage imageNamed:@"xidada"]];
        [self.scrollView addSubview:self.imageView];
        
        
        UILabel *label = [[UILabel alloc]init];
        label.frame = CGRectMake(x+ScreenWidth-LABEL_WIDTH,SCROLLVIEW_HEIGHT-LABEL_HEIGHT, LABEL_WIDTH, LABEL_HEIGHT);
        label.text = [NSString stringWithFormat:@"%d/%ld",i+1,count];
        label.textColor = [UIColor whiteColor];
        [self finishedLabel:label setPartColor:label.text andRange:NSMakeRange(0, 1)];
        [self.scrollView addSubview:label];
    }
}

//设置标签部分字体的颜色
-(void)finishedLabel:(UILabel *)label setPartColor:(NSString *)text andRange:(NSRange) range
{
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc]initWithString:text];
    [attributeStr addAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]} range:range];
    label.attributedText = attributeStr;
}
@end
