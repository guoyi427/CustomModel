//
//  CMDetailViewController.m
//  CustomModel
//
//  Created by guoyi on 16/2/15.
//  Copyright © 2016年 郭毅. All rights reserved.
//

#import "CMDetailViewController.h"

//Model
#import "CMHomeCellModel.h"
#import "CMRequestManager.h"

@interface CMDetailViewController ()

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
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = _model.modelID;
    
    [[CMRequestManager sharedRequestManager] downloadStlFileWithUrlString:@"http://image.3dhoo.com:8010/Code/DownLoad.cfm?stl=mSLDxXP0CXk7F12pU%2FrPoeQEgYWz1XME3vx8VCVJ0G1kZQAjS9Mdom8wHajhuBKx&dlname=消防车1"];
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
