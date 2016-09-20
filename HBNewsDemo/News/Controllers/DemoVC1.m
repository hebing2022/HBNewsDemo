//
//  DemoVC1.m
//  HBNewsDemo
//
//  Created by hebing on 16/9/19.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "DemoVC1.h"

@implementation DemoVC1
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    self.titleLabel.text = NSStringFromClass([self class]);
    
}
@end
