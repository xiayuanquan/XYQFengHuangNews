//
//  CustomCollectionViewCell.h
//  凤凰新闻客户端
//
//  Created by ma c on 15/11/16.
//  Copyright (c) 2015年 xiayuanquan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCollectionViewCell : UICollectionViewCell

-(void)sendCell:(CustomCollectionViewCell *)cell andIndexPath:(NSIndexPath *)indexPath andSectionArray:(NSArray *)SectionArray;
@end
