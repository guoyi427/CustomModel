//
//  CMHomeCellModel.m
//  CustomModel
//
//  Created by guoyi on 16/2/15.
//  Copyright © 2016年 郭毅. All rights reserved.
//

#import "CMHomeCellModel.h"

@implementation CMHomeCellModel

/// 便利构造器
+ (instancetype)cellModelWithDic:(NSDictionary *)dic {
    CMHomeCellModel *model = [[CMHomeCellModel alloc] initWithDic:dic];
    return model;
}

- (instancetype)initWithDic:(NSDictionary *)dic {
    self = [super init];
    if (self) {
        self.imageURL = dic[@"imageURL"];
        self.name = dic[@"name"];
        self.stl = dic[@"stl"];
    }
    return self;
}

@end
