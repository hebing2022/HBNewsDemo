//
//  HBTitleCell.m
//  HBNewsDemo
//
//  Created by hebing on 16/9/19.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "HBTitleCell.h"
#import "UIView+HBFrame.h"
@interface HBTitleCell()

@property (nonatomic, strong) UILabel *titleLabel;

@end
@implementation HBTitleCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        _titleLabel = [UILabel new];
        _titleLabel.frame = CGRectMake(0, 0, self.width, self.height);
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_titleLabel];
    }
    
    return self;
}
- (void)setTitleModel:(TitleModel *)titleModel
{
    _titleModel = titleModel;
    _titleLabel.text = _titleModel.title;
    _titleLabel.font = _titleModel.isSelected ? [UIFont systemFontOfSize:17] : [UIFont systemFontOfSize:14];
}
- (void)setSelectColor:(UIColor *)selectColor {
    _selectColor = selectColor;
    _titleLabel.textColor = _titleModel.isSelected ? self.selectColor : self.normalColor;
}
@end
