//
//  HBTitleCell.m
//  HBNewsDemo
//
//  Created by hebing on 16/9/19.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "HBTitleCell.h"
@interface HBTitleCell()

@property (nonatomic, strong) UILabel *titleLabel;

@end
@implementation HBTitleCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        _titleLabel = [UILabel new];
        _titleLabel.frame = CGRectMake(0, 0, 80, 40);
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = [UIColor blackColor];
        [self.contentView addSubview:_titleLabel];
        
    }
    
    return self;
}
- (void)setTitleModel:(TitleModel *)titleModel
{
    _titleModel = titleModel;
    
    _titleLabel.text = _titleModel.title;
    _titleLabel.textColor = _titleModel.isSelected ? [UIColor redColor] : [UIColor blackColor];
    _titleLabel.font = _titleModel.isSelected ? [UIFont systemFontOfSize:17] : [UIFont systemFontOfSize:14];
}
@end
