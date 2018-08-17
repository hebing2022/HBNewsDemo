//
//  HBTitleCell.h
//  HBNewsDemo
//
//  Created by hebing on 16/9/19.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TitleModel.h"
@interface HBTitleCell : UICollectionViewCell

@property (nonatomic, strong) TitleModel *titleModel;

@property(nonatomic, strong) UIColor *selectColor;

@property(nonatomic, strong) UIColor *normalColor;

@end
