//
//  HBTagsView.h
//  HBNewsDemo
//
//  Created by liqi on 2019/3/6.
//  Copyright © 2019 hebing. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class HBTagsView;
@protocol HBTagsViewDelegate <NSObject>

- (void)HBTagsView:(HBTagsView *)tagsView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;

@end
@interface HBTagsView : UIView

@property (nonatomic, weak) id<HBTagsViewDelegate> delegate;

@property (nonatomic, copy) NSArray *tagsArray;

@property (nonatomic, strong) UIColor *normalColor;

@property (nonatomic, strong) UIColor *selectColor;

@property (nonatomic, copy) NSString *selectIndicatorImage;

@property (nonatomic, assign) NSInteger selectIndex;

@property (nonatomic, assign) CGFloat indicatorWith;

- (instancetype)initWithFrame:(CGRect)frame
                    tagsArray:(NSArray *)tagsArray
                     delegate:(id<HBTagsViewDelegate>)delegate;

- (void)didSelectItemAtIndexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
