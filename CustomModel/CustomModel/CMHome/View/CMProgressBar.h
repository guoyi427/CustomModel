//
//  CMProgressBar.h
//  CustomModel
//
//  Created by guoyi on 16/2/16.
//  Copyright © 2016年 郭毅. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CMProgressBar : UIView

+ (instancetype)progressBarWithFrame:(CGRect)frame;

- (void)updateProgress:(float)progressValue;

@end
