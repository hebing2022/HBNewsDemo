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
@interface HBTitleSelectCollectionView()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) NSMutableArray *titleModelArray;

@end
@implementation HBTitleSelectCollectionView
- (instancetype)initWithFrame:(CGRect)frame
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;//滚动方向  水平方向
    layout.minimumLineSpacing = 0; //最小线间距
    layout.minimumInteritemSpacing = 0;
    layout.itemSize = CGSizeMake(80, frame.size.height);
    //self.collectionViewLayout = layout;
    
    self = [super initWithFrame:frame collectionViewLayout:layout];
    
    if (self) {
        
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
    
    return cell;
}
#pragma mark - UICollectionViewDelegate Protocol Methods
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    for (int i = 0; i < self.titleModelArray.count; i++) {
        
        TitleModel *model = self.titleModelArray[i];
        model.selected = indexPath.row == i ? YES : NO;
    }
    
    [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    
    if ([self.hbDelegate respondsToSelector:@selector(HBTitleSelectCollectionView:didSelectItemAtIndexPath:)]) {
        
        [self.hbDelegate HBTitleSelectCollectionView:self didSelectItemAtIndexPath:indexPath];
    }
    
    [self reloadData];
    
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
- (void)didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self collectionView:self didSelectItemAtIndexPath:indexPath];
}
@end
