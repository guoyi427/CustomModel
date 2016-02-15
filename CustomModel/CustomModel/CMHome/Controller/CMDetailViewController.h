//
//  CMDetailViewController.h
//  CustomModel
//
//  Created by guoyi on 16/2/15.
//  Copyright © 2016年 郭毅. All rights reserved.
//

#import "CMBaseViewController.h"

@class CMHomeCellModel;
@interface CMDetailViewController : CMBaseViewController

@property (nonatomic, strong) CMHomeCellModel *model;

- (instancetype)initWithModel:(CMHomeCellModel *)model;

@end
