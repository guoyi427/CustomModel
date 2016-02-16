//
//  CMProgressBar.m
//  CustomModel
//
//  Created by guoyi on 16/2/16.
//  Copyright © 2016年 郭毅. All rights reserved.
//

#import "CMProgressBar.h"

@interface CMProgressBar ()
{
    //  Model
    float _progressValue;
}

@end

@implementation CMProgressBar

+ (instancetype)progressBarWithFrame:(CGRect)frame {
    CMProgressBar *pBar = [[CMProgressBar alloc] initWithFrame:frame];
    return pBar;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
// Drawing code
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 0)];
    float offset_x = [UIScreen mainScreen].bounds.size.width * _progressValue;
    [path addLineToPoint:CGPointMake(offset_x, 0)];
    [[UIColor greenColor] setStroke];
    path.lineWidth = 3;
    [path stroke];
}


- (void)updateProgress:(float)progressValue {
    _progressValue = progressValue;
    [self setNeedsDisplay];
}


@end
