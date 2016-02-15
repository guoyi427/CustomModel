//
//  CMHomeCell.h
//  CustomModel
//
//  Created by guoyi on 16/2/15.
//  Copyright © 2016年 郭毅. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CMHomeCellModel;

@interface CMHomeCell : UICollectionViewCell

- (void)updateCellWithModel:(CMHomeCellModel *)cellModel;

@end
