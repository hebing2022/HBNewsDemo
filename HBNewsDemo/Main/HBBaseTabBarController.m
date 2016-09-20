//
//  HBBaseTabBarController.m
//  HBNewsDemo
//
//  Created by hebing on 16/9/19.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "HBBaseTabBarController.h"
#import "HBBaseViewController.h"
#import "HBBaseNavgationController.h"
#import "HBNewsViewController.h"
@implementation HBBaseTabBarController
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initChildViewController];
}
- (void)initChildViewController
{
    NSArray *norArray = @[@"tabbar_icon_news_normal",@"tabbar_icon_reader_normal",@"tabbar_icon_media_normal",@"tabbar_icon_found_normal",@"tabbar_icon_me_normal"];
    NSArray *selectArray = @[@"tabbar_icon_news_highlight",@"tabbar_icon_reader_highlight",@"tabbar_icon_media_highlight",@"tabbar_icon_found_highlight",@"tabbar_icon_me_highlight"];
    NSArray *titleArray = @[@"新闻",@"阅读",@"视听",@"发现",@"我"];
    
    for (int i = 0; i < norArray.count; i++) {
     
        i==0 ? [self setNorImage:norArray[i] SelectImage:selectArray[i] title:titleArray[i] controller:[[HBNewsViewController alloc] init]] : [self setNorImage:norArray[i] SelectImage:selectArray[i] title:titleArray[i] controller:[[HBBaseViewController alloc] init]];
    }
    
}
- (void)setNorImage:(NSString *)norName SelectImage:(NSString *)selectName title:(NSString *)title controller:(HBBaseViewController *)controller
{
    controller.tabBarItem.image = [UIImage imageNamed:norName];
    controller.tabBarItem.selectedImage = [UIImage imageNamed:selectName];
    controller.tabBarItem.title = title;
    
    HBBaseNavgationController *nav = [[HBBaseNavgationController alloc] initWithRootViewController:controller];
    [self addChildViewController:nav];
}
@end
