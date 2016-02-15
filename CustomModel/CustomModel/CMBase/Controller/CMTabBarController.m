//
//  CMTabBarController.m
//  CustomModel
//
//  Created by guoyi on 16/2/15.
//  Copyright © 2016年 郭毅. All rights reserved.
//

#import "CMTabBarController.h"

#import "CMHomeViewController.h"

@interface CMTabBarController ()

@end

@implementation CMTabBarController

#pragma mark - View Lifecycle

+ (instancetype)sharedTabBarController {
    static CMTabBarController *c_tabBar = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        c_tabBar = [[CMTabBarController alloc] init];
    });
    return c_tabBar;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self _prepareViewControllers];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Prepare

- (void)_prepareViewControllers {
    CMHomeViewController *homeVC = [[CMHomeViewController alloc] init];
    homeVC.title = @"首页";
    UINavigationController *naviHomeC = [[UINavigationController alloc] initWithRootViewController:homeVC];
    self.viewControllers = @[naviHomeC];
}

@end
