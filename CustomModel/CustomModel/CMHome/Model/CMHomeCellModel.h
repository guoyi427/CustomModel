//
//  CMHomeCellModel.h
//  CustomModel
//
//  Created by guoyi on 16/2/15.
//  Copyright © 2016年 郭毅. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CMHomeCellModel : NSObject

/// 图片链接
@property (nonatomic, strong) NSURL *imageURL;
/// 模型stl编码
@property (nonatomic, strong) NSString *stl;
/// 模型名称
@property (nonatomic, strong) NSString *name;

/// 便利构造器
+ (instancetype)cellModelWithDic:(NSDictionary *)dic;

@end
