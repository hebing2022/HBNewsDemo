//
//  TitleModel.h
//  HBNewsDemo
//
//  Created by hebing on 16/9/19.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TitleModel : NSObject

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign, getter=isSelected) BOOL selected;

@end
