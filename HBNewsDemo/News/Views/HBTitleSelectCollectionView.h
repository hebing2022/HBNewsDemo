//
//  HBTitleSelectCollectionView.h
//  HBNewsDemo
//
//  Created by hebing on 16/9/19.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HBTitleSelectCollectionView;

@protocol HBTitleSelectCollectionViewDelegate <NSObject>

- (void)HBTitleSelectCollectionView:(HBTitleSelectCollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;

@end
@interface HBTitleSelectCollectionView : UICollectionView

@property (nonatomic, copy) NSArray *titleArray;


@property (nonatomic ,weak) id <HBTitleSelectCollectionViewDelegate> hbDelegate;

- (void)didSelectItemAtIndexPath:(NSIndexPath *)indexPath;

@end
