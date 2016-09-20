//
//  HBBaseViewController.m
//  HBNewsDemo
//
//  Created by hebing on 16/9/19.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "HBBaseViewController.h"

@implementation HBBaseViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor greenColor];
    
    UILabel *titleLabel = [UILabel new];
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.frame = CGRectMake(0, 0, 100, 40);
    titleLabel.center = self.view.center;
    self.titleLabel = titleLabel;
    [self.view addSubview:self.titleLabel];
}
@end
