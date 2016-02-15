//
//  CMHomeCollectionView.h
//  CustomModel
//
//  Created by guoyi on 16/2/15.
//  Copyright © 2016年 郭毅. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CMHomeCollectionView,CMHomeCellModel;
@protocol CMHomeCollectionViewDelegate <NSObject>

/// 点击单元格的方法
- (void)homeCollectionView:(CMHomeCollectionView *)collectionView didSelectedCellAtModel:(CMHomeCellModel *)model;

@end

@interface CMHomeCollectionView : UICollectionView

@property (nonatomic, weak) id<CMHomeCollectionViewDelegate> homeDelegate;

+ (instancetype)collectionViewWithFrame:(CGRect)frame;

@end
