//
//  CMDetailViewController.m
//  CustomModel
//
//  Created by guoyi on 16/2/15.
//  Copyright © 2016年 郭毅. All rights reserved.
//

#import "CMDetailViewController.h"

#import <SceneKit/SceneKit.h>

//  Model
#import "CMHomeCellModel.h"
#import "CMRequestManager.h"
#import "CMFileManager.h"

//  View
#import "CMProgressBar.h"
#import "CMModelView.h"

@interface CMDetailViewController () <CMRequestManagerDelegate>
{
    //  Scene
    CMModelView *_modelView;
    
    //  View
    CMProgressBar *_progressBar;
}
@end

@implementation CMDetailViewController

- (instancetype)initWithModel:(CMHomeCellModel *)model {
    self = [super init];
    if (self) {
        self.model = model;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _prepareData];
    [self _prepareUI];
}

- (void)viewWillDisappear:(BOOL)animated {
    [[CMRequestManager sharedRequestManager] cancelDownload];
    [CMRequestManager sharedRequestManager].cmDelegate = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Prepare

- (void)_prepareData {
   
    
    if ([[CMFileManager sharedFileManager] isExistFileWithName:_model.name]) {
        [self _prepareSecenKitView];
    } else {
        [CMRequestManager sharedRequestManager].cmDelegate = self;
        [[CMRequestManager sharedRequestManager] downloadStlFileWithStl:_model.stl andName:_model.name];
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(downloadStlFinishNotification:)
                                                 name:kSaveStlFileSuccessNotification object:nil];
}

- (void)_prepareUI {
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = _model.name;

    /// 下载进度
    [self _prepareProgressBar];
}

- (void)_prepareProgressBar {
    _progressBar = [CMProgressBar progressBarWithFrame:CGRectMake(0, _height_naviBar + _height_statusBar, _width_screen, 3)];
    [self.view addSubview:_progressBar];
}

- (void)_prepareSecenKitView {
    _modelView = [CMModelView modelViewWithFrame:self.view.bounds andSTLFileName:_model.name];
    [self.view addSubview:_modelView];
}

#pragma mark - NSNotificationCenter - Action

- (void)downloadStlFinishNotification:(NSNotification *)notification {
    [_modelView removeFromSuperview];
    _modelView = nil;
    [self _prepareSecenKitView];
}

#pragma mark - CMRequestManager - Delegate

- (void)requestManager:(CMRequestManager *)requestManager downloadProgress:(float)progress {
    [_progressBar updateProgress:progress];
}

@end
