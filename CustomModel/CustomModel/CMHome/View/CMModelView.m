//
//  CMModelView.m
//  CustomModel
//
//  Created by guoyi on 16/2/16.
//  Copyright © 2016年 郭毅. All rights reserved.
//

#import "CMModelView.h"

#import "CMFileManager.h"

@implementation CMModelView

+ (instancetype)modelViewWithFrame:(CGRect)frame andSTLFileName:(NSString *)fileName {
    CMModelView *view = [[CMModelView alloc] initWithFrame:frame andSTLFileName:fileName];
    return view;
}

- (instancetype)initWithFrame:(CGRect)frame andSTLFileName:(NSString *)fileName {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blackColor];
        NSURL *fileURL = [[NSURL alloc] initFileURLWithPath:[[CMFileManager sharedFileManager] pathWithFile:fileName]];
        SCNScene *scene = [SCNScene sceneWithURL:fileURL options:nil error:nil];
        self.scene = scene;
        self.allowsCameraControl = YES;
    }
    return self;
}

@end
