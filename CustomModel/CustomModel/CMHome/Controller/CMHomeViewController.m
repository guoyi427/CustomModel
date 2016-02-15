//
//  CMHomeViewController.m
//  CustomModel
//
//  Created by guoyi on 16/2/15.
//  Copyright © 2016年 郭毅. All rights reserved.
//

#import "CMHomeViewController.h"

//  View
#import "CMHomeCollectionView.h"

@interface CMHomeViewController ()

@end

@implementation CMHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _prepareUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Prepare

- (void)_prepareUI {
    self.view.backgroundColor = [UIColor magentaColor];

    CMHomeCollectionView *collectionView = [CMHomeCollectionView collectionViewWithFrame:CGRectMake(0, _height_naviBar + _height_statusBar, _width_screen, _height_screen - _height_tabBar - _height_naviBar - _height_statusBar)];
    [self.view addSubview:collectionView];
}

@end
