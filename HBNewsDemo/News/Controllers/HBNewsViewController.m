//
//  HBNewsViewController.m
//  HBNewsDemo
//
//  Created by hebing on 16/9/19.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "HBNewsViewController.h"
#import "HBTitleSelectCollectionView.h"
#import "DemoVC1.h"
#import "DemoVC2.h"
#import "DemoVC3.h"
#import "DemoVC4.h"
#import "DemoVC5.h"
#import "DemoVC6.h"
#import "DemoVC7.h"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface HBNewsViewController()<UIScrollViewDelegate,HBTitleSelectCollectionViewDelegate>

@property (nonatomic, strong) HBTitleSelectCollectionView *titleCollection;

@property (nonatomic, strong) UIScrollView *bigScrollView;

@end
@implementation HBNewsViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self initTitleCollection];
    
    [self initBigScrollView];
}
- (void)initTitleCollection
{
    self.titleCollection = [[HBTitleSelectCollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
    self.titleCollection.hbDelegate = self;
    self.titleCollection.titleArray = @[@"测试",@"测试",@"测试",@"测试",@"测试",@"测试",@"测试"];
    [self.view addSubview:self.titleCollection];
}
- (void)initBigScrollView
{
    self.bigScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 40, SCREEN_WIDTH, SCREEN_HEIGHT - 40)];
    self.bigScrollView.bounces = NO;
    self.bigScrollView.pagingEnabled = YES;
    self.bigScrollView.delegate = self;
    [self.view addSubview:self.bigScrollView];
    
    DemoVC1 *VC1 = [[DemoVC1 alloc] init];
    DemoVC2 *VC2 = [[DemoVC2 alloc] init];
    DemoVC3 *VC3 = [[DemoVC3 alloc] init];
    DemoVC4 *VC4 = [[DemoVC4 alloc] init];
    DemoVC5 *VC5 = [[DemoVC5 alloc] init];
    DemoVC6 *VC6 = [[DemoVC6 alloc] init];
    DemoVC7 *VC7 = [[DemoVC7 alloc] init];
    
    
    [self addChildViewController:VC1];
    [self addChildViewController:VC2];
    [self addChildViewController:VC3];
    [self addChildViewController:VC4];
    [self addChildViewController:VC5];
    [self addChildViewController:VC6];
    [self addChildViewController:VC7];
    
    self.bigScrollView.contentSize = CGSizeMake(SCREEN_WIDTH * self.childViewControllers.count, SCREEN_HEIGHT - 40);
    
    VC1.view.frame = self.bigScrollView.bounds;
    [self.bigScrollView addSubview:VC1.view];

}
#pragma mark - UIScrollViewDelegate
/* 滚动结束*/
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self scrollViewDidEndScrollingAnimation:scrollView];
}
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    // 获得索引
    NSUInteger index = scrollView.contentOffset.x / self.bigScrollView.frame.size.width;
    HBBaseViewController *VC = self.childViewControllers[index];
    VC.view.frame = self.bigScrollView.bounds;
    [self.bigScrollView addSubview:VC.view];
    
    NSLog(@"contentOffset==%@",NSStringFromCGPoint(self.bigScrollView.contentOffset));
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:index inSection:0];
    [self.titleCollection didSelectItemAtIndexPath:indexPath];

}
#pragma mark - HBTitleSelectCollectionViewDelegate
- (void)HBTitleSelectCollectionView:(HBTitleSelectCollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{

    [self.bigScrollView setContentOffset:CGPointMake(SCREEN_WIDTH * indexPath.row,0) animated:YES];

}
@end
