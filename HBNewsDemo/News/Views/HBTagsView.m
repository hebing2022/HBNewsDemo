//
//  HBTagsView.m
//  HBNewsDemo
//
//  Created by liqi on 2019/3/6.
//  Copyright © 2019 hebing. All rights reserved.
//

#import "HBTagsView.h"
#import "UIView+HBFrame.h"
#import "HBTitleCell.h"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
@interface HBTagsView ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;

@property(nonatomic, strong) UIImageView *indicatorView;

@end
@implementation HBTagsView

- (instancetype)initWithFrame:(CGRect)frame tagsArray:(NSArray *)tagsArray delegate:(id<HBTagsViewDelegate>)delegate {
    self = [super initWithFrame:frame];
    if (self) {
        self.delegate = delegate;
        self.tagsArray = [self setupTitleModel:tagsArray];
        self.selectColor = [UIColor redColor];
        self.normalColor = [UIColor greenColor];
        self.selectIndex = 0;
        self.indicatorWith = SCREEN_WIDTH/self.tagsArray.count;
        [self addSubview:self.collectionView];
        [self.collectionView addSubview:self.indicatorView];
    }
    return self;
}
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;//滚动方向  水平方向
        layout.minimumLineSpacing = 0; //最小线间距
        layout.minimumInteritemSpacing = 0;
        _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        [_collectionView registerClass:[HBTitleCell class] forCellWithReuseIdentifier:@"tag"];
    }
    return _collectionView;
}
- (UIImageView *)indicatorView {
    if (!_indicatorView) {
        _indicatorView = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.bounds.size.height - 2, self.indicatorWith, 2)];
        _indicatorView.backgroundColor = self.selectColor;
    }
    return _indicatorView;
}
- (NSArray<TitleModel *> *)setupTitleModel:(NSArray *)tagsArray {
    NSMutableArray *tags = @[].mutableCopy;
    for (int i = 0; i <tagsArray.count; i++) {
        TitleModel *model = [[TitleModel alloc] init];
        model.title = tagsArray[i];
        model.selected = i == 0 ? YES : NO;
        [tags addObject:model];
    }
    return [tags copy];
}
- (void)setNormalColor:(UIColor *)normalColor {
    _normalColor = normalColor;
    [self.collectionView reloadData];
}
- (void)setSelectColor:(UIColor *)selectColor {
    _selectColor = selectColor;
    _indicatorView.backgroundColor = _selectColor;
    [self.collectionView reloadData];
}
- (void)setIndicatorWith:(CGFloat)indicatorWith {
    _indicatorWith = indicatorWith;
    _indicatorView.width = _indicatorWith;
    [self.collectionView reloadData];
}
#pragma mark - UICollectionViewDataSource Protocol Methods
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.tagsArray.count;
    
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HBTitleCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"tag" forIndexPath:indexPath];
    cell.titleModel = self.tagsArray[indexPath.row];
    cell.selectColor = self.selectColor;
    cell.normalColor = self.normalColor;
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.indicatorWith, self.height);
}
#pragma mark - UICollectionViewDelegate Protocol Methods
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self setupSelectModel:indexPath.row];
    [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    if ([self.delegate respondsToSelector:@selector(HBTagsView:didSelectItemAtIndexPath:)]) {
        [self.delegate HBTagsView:self didSelectItemAtIndexPath:indexPath];
    }
    [self.collectionView reloadData];
    
}
- (void)didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [UIView animateWithDuration:0.1 animations:^{
        self.indicatorView.centerX = self.indicatorWith/2 + self.indicatorWith * indexPath.row;
    }];
    [self collectionView:self.collectionView didSelectItemAtIndexPath:indexPath];
}
- (void)setupSelectModel:(NSInteger)index {
    for (int i = 0; i < self.tagsArray.count; i++) {
        TitleModel *model = self.tagsArray[i];
        model.selected = index == i ? YES : NO;
    }
}
@end
