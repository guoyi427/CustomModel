//
//  CMFileManager.m
//  CustomModel
//
//  Created by guoyi on 16/2/16.
//  Copyright © 2016年 郭毅. All rights reserved.
//

#import "CMFileManager.h"

@implementation CMFileManager

+ (instancetype)sharedFileManager {
    static CMFileManager *m_fileManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        m_fileManager = [[CMFileManager alloc] init];
    });
    return m_fileManager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

#pragma mark - Public Methods

- (void)saveSTLFileWithTmpURL:(NSURL *)tmpUrl andModelName:(NSString *)name {
    NSData *tmpData = [NSData dataWithContentsOfURL:tmpUrl];
    if (tmpData.length > 50) {
        NSString *filePath = [self pathWithFile:name];
        [tmpData writeToFile:filePath atomically:YES];
        [[NSNotificationCenter defaultCenter] postNotificationName:kSaveStlFileSuccessNotification object:nil userInfo:@{
                                                                                                                         @"filePath":filePath
                                                                                                                         }];
    } else {
        //  数据太小
        NSString *error = [[NSString alloc] initWithData:tmpData encoding:NSUTF8StringEncoding];
        NSLog(@"stl file error %@",error);
    }
}

- (BOOL)isExistFileWithName:(NSString *)fileName {
    NSString *filePath = [self pathWithFile:fileName];
    
    //  判断是否存在stl 不存在就网络请求
    BOOL isExistFile = [[NSFileManager defaultManager] fileExistsAtPath:filePath];
    return isExistFile;
}

- (NSString *)pathWithFile:(NSString *)fileName {
    NSString *cachePath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
    NSString *filePath = [cachePath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.stl",fileName]];
    return filePath;
}

@end
