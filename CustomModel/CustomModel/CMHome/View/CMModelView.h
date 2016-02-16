//
//  CMModelView.h
//  CustomModel
//
//  Created by guoyi on 16/2/16.
//  Copyright © 2016年 郭毅. All rights reserved.
//

#import <SceneKit/SceneKit.h>

@interface CMModelView : SCNView

+ (instancetype)modelViewWithFrame:(CGRect)frame andSTLFileName:(NSString *)fileName;

@end
