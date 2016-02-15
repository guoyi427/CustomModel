//
//  CMHomeCell.m
//  CustomModel
//
//  Created by guoyi on 16/2/15.
//  Copyright © 2016年 郭毅. All rights reserved.
//

#import "CMHomeCell.h"

//  View
#import "UIImageView+WebCache.h"

//  Model
#import "CMHomeCellModel.h"

@interface CMHomeCell ()
{
    UIImageView *_imageView;
}

@end

@implementation CMHomeCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self _prepareUI];
    }
    return self;
}

#pragma mark - Prepare 

- (void)_prepareUI {
    _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    _imageView.contentMode = UIViewContentModeScaleAspectFill;
    _imageView.clipsToBounds = YES;
    [self.contentView addSubview:_imageView];
}

#pragma mark - Public Method

- (void)updateCellWithModel:(CMHomeCellModel *)cellModel {
    _imageView.image = nil;
    [_imageView sd_setImageWithURL:cellModel.imageURL];
}

#pragma mark - Private Method

//缩放图片到指定的size
- (UIImage *)scaleToSize:(CGSize)tarSize andImage:(UIImage *)originImage {
    UIGraphicsBeginImageContext(tarSize);
    [originImage drawInRect:CGRectMake(0, 0, tarSize.width, tarSize.height)];
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resultImage;
}

@end
