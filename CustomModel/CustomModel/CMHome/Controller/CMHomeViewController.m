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
//  Controller
#import "CMDetailViewController.h"

@interface CMHomeViewController () <CMHomeCollectionViewDelegate>

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

    CMHomeCollectionView *collectionView = [CMHomeCollectionView collectionViewWithFrame:CGRectMake(0, 0, _width_screen, _height_screen)];
    collectionView.homeDelegate = self;
    [self.view addSubview:collectionView];
}

#pragma mark - CMHomeCollectionView - Delegate

- (void)homeCollectionView:(CMHomeCollectionView *)collectionView didSelectedCellAtModel:(CMHomeCellModel *)model {
    CMDetailViewController *detailVC = [[CMDetailViewController alloc] initWithModel:model];
    [self.navigationController pushViewController:detailVC animated:YES];
}

@end
