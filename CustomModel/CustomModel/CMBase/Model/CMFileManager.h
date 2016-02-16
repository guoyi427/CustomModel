//
//  CMFileManager.h
//  CustomModel
//
//  Created by guoyi on 16/2/16.
//  Copyright © 2016年 郭毅. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString *kSaveStlFileSuccessNotification = @"kSaveStlFileSuccessNotification";

@interface CMFileManager : NSObject

+ (instancetype)sharedFileManager;

- (void)saveSTLFileWithTmpURL:(NSURL *)tmpUrl andModelName:(NSString *)name;

- (BOOL)isExistFileWithName:(NSString *)fileName;

- (NSString *)pathWithFile:(NSString *)fileName;

@end
