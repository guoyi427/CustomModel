//
//  CMRequestManager.h
//  CustomModel
//
//  Created by guoyi on 16/2/15.
//  Copyright © 2016年 郭毅. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CMRequestManager;
@protocol CMRequestManagerDelegate <NSObject>

- (void)requestManager:(CMRequestManager *)requestManager downloadProgress:(float)progress;

@end

@interface CMRequestManager : NSObject

@property (nonatomic, weak) id<CMRequestManagerDelegate> cmDelegate;

+ (instancetype)sharedRequestManager;

- (void)downloadStlFileWithStl:(NSString *)stl andName:(NSString *)name;

- (void)cancelDownload;

@end
