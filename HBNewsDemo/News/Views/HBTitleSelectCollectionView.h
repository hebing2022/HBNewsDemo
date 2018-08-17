//
//  HBTitleSelectCollectionView.h
//  HBNewsDemo
//
//  Created by hebing on 16/9/19.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HBTitleSelectCollectionView;

@protocol HBTitleSelectCollectionViewDelegate <NSObject>

- (void)HBTitleSelectCollectionView:(HBTitleSelectCollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;

@end
@interface HBTitleSelectCollectionView : UICollectionView

@property (nonatomic, copy) NSArray *titleArray;
/**
 选中的颜色
 */
@property(nonatomic, strong) UIColor *selectColor;

@property(nonatomic, strong) UIColor *normalColor;

@property(nonatomic, assign) CGFloat indicatorWidth;
/**
 默认选中第几个
 */
@property(nonatomic, assign) NSInteger selectIndex;

@property (nonatomic ,weak) id <HBTitleSelectCollectionViewDelegate> hbDelegate;

/**
 创建title collectionView

 @param frame collectionview的大小
 @param labelWidth titleLabel的宽度
 @return instancetype
 */
- (instancetype)initWithFrame:(CGRect)frame labelWidth:(CGFloat)labelWidth;

- (void)didSelectItemAtIndexPath:(NSIndexPath *)indexPath;

@end
