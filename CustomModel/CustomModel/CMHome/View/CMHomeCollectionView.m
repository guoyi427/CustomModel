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
    NSArray *imageURLs = @[@"http://image.3dhoo.com:8010/NewsDescImages/20150214/150214_170207_29075281.jpg",
                           @"http://image.3dhoo.com:8010/NewsDescImages/20150214/150214_170226_62815208.jpg",
                           @"http://image.3dhoo.com:8010/NewsDescImages/20150214/150214_170245_59676832.jpg",
                           @"http://image.3dhoo.com:8010/NewsDescImages/20150214/150214_170207_91889022.jpg",
                           @"http://image.3dhoo.com:8010/NewsDescImages/20150214/150214_170227_61248521.jpg",
                           @"http://image.3dhoo.com:8010/NewsDescImages/20150214/150214_170229_89755171.jpg",
                           @"http://image.3dhoo.com:8010/NewsDescImages/20150212/150212_170206_42464757.jpg",
                           @"http://image.3dhoo.com:8010/NewsDescImages/20150212/150212_170227_29546651.jpg",
                           @"http://image.3dhoo.com:8010/NewsDescImages/20150212/150212_170250_59002721.jpg",
                           @"http://image.3dhoo.com:8010/NewsDescImages/20150212/150212_170207_99621168.jpg",
                           @"http://image.3dhoo.com:8010/NewsDescImages/20150212/150212_170215_59201283.jpg",
                           @"http://image.3dhoo.com:8010/NewsDescImages/20150212/150212_170231_56423797.jpg",
                           @"http://image.3dhoo.com:8010/NewsDescImages/20150212/150212_170244_85581797.jpg",
                           @"http://image.3dhoo.com:8010/NewsDescImages/20150212/150212_170254_38003807.jpg",
                           @"http://image.3dhoo.com:8010/NewsDescImages/20150212/150212_170214_27712086.jpg",
                           @"http://image.3dhoo.com:8010/NewsDescImages/20150212/150212_170235_38999193.jpg",
                           @"http://image.3dhoo.com:8010/NewsDescImages/20150212/150212_170259_18731749.jpg",
                           @"http://image.3dhoo.com:8010/NewsDescImages/20150212/150212_170213_91712516.jpg",
                           @"http://image.3dhoo.com:8010/NewsDescImages/20150212/150212_170227_92036643.jpg",
                           @"http://image.3dhoo.com:8010/NewsDescImages/20150212/150212_170225_82180581.jpg",
                           @"http://image.3dhoo.com:8010/NewsDescImages/20150209/150209_180220_86973091.jpg",
                           @"http://image.3dhoo.com:8010/NewsDescImages/20150209/150209_180224_27557438.jpg",
                           @"http://image.3dhoo.com:8010/NewsDescImages/20150209/150209_170222_81968430.jpg",
                           @"http://image.3dhoo.com:8010/NewsDescImages/20150209/150209_170238_66525671.jpg",
                           @"http://image.3dhoo.com:8010/NewsDescImages/20150209/150209_170246_60925808.jpg",
                           @"http://image.3dhoo.com:8010/NewsDescImages/20150206/150206_160252_58678716.jpg",
                           @"http://image.3dhoo.com:8010/NewsDescImages/20150206/150206_160245_45457501.jpg",
                           @"http://image.3dhoo.com:8010/NewsDescImages/20150206/150206_160210_86674591.jpg",
                           @"http://image.3dhoo.com:8010/NewsDescImages/20150206/150206_160230_97445642.jpg",
                           @"http://image.3dhoo.com:8010/NewsDescImages/20150205/150205_170242_67049139.jpg"];
    for (int i = 0; i < 30; i ++) {
        CMHomeCellModel *cellModel = [[CMHomeCellModel alloc] init];
        cellModel.imageURL = [NSURL URLWithString:imageURLs[i]];
        cellModel.modelID = [NSString stringWithFormat:@"%d",i];
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

#pragma mark - UICollectionView Layout - Delegate



@end
