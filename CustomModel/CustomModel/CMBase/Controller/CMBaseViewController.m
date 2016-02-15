//
//  CMBaseViewController.m
//  CustomModel
//
//  Created by guoyi on 16/2/15.
//  Copyright © 2016年 郭毅. All rights reserved.
//

#import "CMBaseViewController.h"

@interface CMBaseViewController ()

@end

@implementation CMBaseViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _width_screen = [UIScreen mainScreen].bounds.size.width;
        _height_screen = [UIScreen mainScreen].bounds.size.height;
        _height_naviBar = 30;
        _height_tabBar = 49;
        _height_statusBar = 20;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
