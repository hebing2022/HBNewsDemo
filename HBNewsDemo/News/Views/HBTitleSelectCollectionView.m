//
//  HBTitleSelectCollectionView.m
//  HBNewsDemo
//
//  Created by hebing on 16/9/19.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "HBTitleSelectCollectionView.h"
#import "HBTitleCell.h"
#import "TitleModel.h"
#import "UIView+HBFrame.h"
@interface HBTitleSelectCollectionView()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) NSMutableArray *titleModelArray;

@property(nonatomic, strong) UIImageView *indicatorView;

@property (nonatomic, assign) CGFloat labelWidth;

@end
@implementation HBTitleSelectCollectionView
- (instancetype)initWithFrame:(CGRect)frame labelWidth:(CGFloat)labelWidth
{
    self.labelWidth = labelWidth ?: 80;
    self.indicatorWidth = labelWidth;
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;//滚动方向  水平方向
    layout.minimumLineSpacing = 0; //最小线间距
    layout.minimumInteritemSpacing = 0;
    layout.itemSize = CGSizeMake(self.labelWidth, frame.size.height);
    self = [super initWithFrame:frame collectionViewLayout:layout];
    
    if (self) {
        self.indicatorView.centerX = self.labelWidth/2;
        self.delegate = self;
        self.dataSource =self;
        self.backgroundColor = [UIColor whiteColor];
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.titleModelArray = [NSMutableArray new];
        [self registerClass:[HBTitleCell class] forCellWithReuseIdentifier:NSStringFromClass([HBTitleCell class])];
    }
    
    return self;
}
- (UIImageView *)indicatorView {
    if (!_indicatorView) {
        _indicatorView = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.bounds.size.height - 2, self.indicatorWidth, 2)];
        [self addSubview:_indicatorView];
    }
    return _indicatorView;
}
- (void)setSelectColor:(UIColor *)selectColor {
    _selectColor = selectColor;
    _indicatorView.backgroundColor = _selectColor;
}
- (void)setIndicatorWidth:(CGFloat)indicatorWidth {
    _indicatorWidth = indicatorWidth;
    _indicatorView.width = _indicatorWidth;
}
- (void)setTitleArray:(NSArray *)titleArray
{
    _titleArray = titleArray;
    [self.titleModelArray removeAllObjects];
    for (int i = 0; i < _titleArray.count; i++) {
        TitleModel *model = [[TitleModel alloc] init];
        model.title = _titleArray[i];
        model.selected = i == 0 ? YES : NO;
        [self.titleModelArray addObject:model];
    }
    [self reloadData];
}
- (void)setSelectIndex:(NSInteger)selectIndex {
    _selectIndex = selectIndex;
    [self setupSelectModel:_selectIndex];
    [self reloadData];
}
#pragma mark - UICollectionViewDataSource Protocol Methods
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.titleModelArray.count;
    
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HBTitleCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([HBTitleCell class]) forIndexPath:indexPath];
    
    cell.titleModel = self.titleModelArray[indexPath.row];
    cell.selectColor = self.selectColor ?: [UIColor redColor];
    cell.normalColor = self.normalColor ?: [UIColor blackColor];
    return cell;
}
#pragma mark - UICollectionViewDelegate Protocol Methods
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self setupSelectModel:indexPath.row];
    [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    if ([self.hbDelegate respondsToSelector:@selector(HBTitleSelectCollectionView:didSelectItemAtIndexPath:)]) {
        [self.hbDelegate HBTitleSelectCollectionView:self didSelectItemAtIndexPath:indexPath];
    }
    [self reloadData];
    
}
- (void)didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [UIView animateWithDuration:0.1 animations:^{
        self.indicatorView.centerX = self.labelWidth/2 + self.labelWidth * indexPath.row;
    }];
    [self collectionView:self didSelectItemAtIndexPath:indexPath];
}
- (void)setupSelectModel:(NSInteger)index {
    for (int i = 0; i < self.titleModelArray.count; i++) {
        TitleModel *model = self.titleModelArray[i];
        model.selected = index == i ? YES : NO;
    }
}
@end
