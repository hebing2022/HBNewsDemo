#模仿网易的标签选择，实现懒加载
###1.1首先实现标签选择
这是一个用collectionview实现的选择器，还可以扩展许多功能
```
- (void)initTitleCollection
{
    self.titleCollection = [[HBTitleSelectCollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
    self.titleCollection.hbDelegate = self;
    self.titleCollection.titleArray = @[@"测试",@"测试",@"测试",@"测试",@"测试",@"测试",@"测试"];
    [self.view addSubview:self.titleCollection];
}
```
###1.2下面我们需要创建一个scrollview，并且把子控制器创建好加到HBNewsViewController这个控制器上
```
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
```
代码滚动会掉用这个方法
```
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
```
让滑动也去调用这个方法
```
/* 滚动结束*/
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self scrollViewDidEndScrollingAnimation:scrollView];
}
```

