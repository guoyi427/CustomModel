//
//  CMHomeCollectionView.m
//  CustomModel
//
//  Created by guoyi on 16/2/15.
//  Copyright © 2016年 郭毅. All rights reserved.
//

#import "CMHomeCollectionView.h"

//  View
#import "CMHomeCell.h"
//  Model
#import "CMHomeCellModel.h"

@interface CMHomeCollectionView () <UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    //  Model
    NSMutableArray<CMHomeCellModel *> *_modelList;
}
@end

static NSString *Identifer_Cell = @"homeCollectionCell";

@implementation CMHomeCollectionView

+ (instancetype)collectionViewWithFrame:(CGRect)frame {
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(CGRectGetWidth(frame) / 3.0f, CGRectGetWidth(frame) / 3.0f);
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 0;
    
    CMHomeCollectionView *v_collection = [[CMHomeCollectionView alloc] initWithFrame:frame
                                                                collectionViewLayout:flowLayout];
    return v_collection;
}

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        [self _prepareData];
        [self _prepareUI];
    }
    return self;
}

#pragma mark - Prepare

- (void)_prepareData {
    _modelList = [[NSMutableArray alloc] init];
    NSArray *imageURLs = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"ModelResource" ofType:@"plist"]];
    for (int i = 0; i < 30; i ++) {
        CMHomeCellModel *cellModel = [CMHomeCellModel cellModelWithDic:imageURLs[i]];
        [_modelList addObject:cellModel];
    }
    [self reloadData];
}

- (void)_prepareUI {
    self.backgroundColor = [UIColor whiteColor];
    self.delegate = self;
    self.dataSource = self;
    [self registerClass:[CMHomeCell class] forCellWithReuseIdentifier:Identifer_Cell];
}

#pragma mark - UICollectionView - Datasource

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    return _modelList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CMHomeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:Identifer_Cell
                                                                           forIndexPath:indexPath];
    CMHomeCellModel *cellModel = nil;
    if (_modelList.count > indexPath.row) {
        cellModel = _modelList[indexPath.row];
        [cell updateCellWithModel:cellModel];
    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    CMHomeCellModel *cellModel = nil;
    if (_modelList.count > indexPath.row) {
        cellModel = _modelList[indexPath.row];
    }
    
    if (_homeDelegate &&
        [_homeDelegate respondsToSelector:@selector(homeCollectionView:didSelectedCellAtModel:)]) {
        [_homeDelegate homeCollectionView:self didSelectedCellAtModel:cellModel];
    }
}

#pragma mark - UICollectionView Layout - Delegate



@end
