//
//  CMRequestManager.m
//  CustomModel
//
//  Created by guoyi on 16/2/15.
//  Copyright © 2016年 郭毅. All rights reserved.
//


#import <UIKit/UIKit.h>

//  Model
#import "CMRequestManager.h"
#import "CMFileManager.h"

@interface CMRequestManager () <NSURLSessionDownloadDelegate>
{
    NSURLSessionDownloadTask *_downloadTask;
    NSString *_modelName;
}
@end

static NSString *Host_DownloadStlFile = @"http://image.3dhoo.com:8010/Code/DownLoad.cfm";

@implementation CMRequestManager

+ (instancetype)sharedRequestManager {
    static CMRequestManager *m_request = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        m_request = [[CMRequestManager alloc] init];
    });
    return m_request;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
    
    }
    return self;
}

#pragma mark - Public Methods

- (void)downloadStlFileWithStl:(NSString *)stl andName:(NSString *)name {
    _modelName = name;
    /// 中文名字 反编译成UTF8
    NSString *percentEscapesName = [name stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *percentSTL = [stl stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet controlCharacterSet]];
    NSString *urlString = [NSString stringWithFormat:@"%@?stl=%@&dlname=%@",Host_DownloadStlFile,percentSTL,percentEscapesName];
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]
                                                          delegate:self
                                                     delegateQueue:[NSOperationQueue mainQueue]];
    _downloadTask = [session downloadTaskWithURL:url];
    [_downloadTask resume];
}

- (void)cancelDownload {
    [_downloadTask cancelByProducingResumeData:^(NSData * _Nullable resumeData) {
       //   保存resumeData 用于断点续传
    }];
}

#pragma mark - NSURLSession Delegate


- (void)URLSession:(NSURLSession *)session didBecomeInvalidWithError:(nullable NSError *)error {
    
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
didFinishDownloadingToURL:(NSURL *)location {
    [[CMFileManager sharedFileManager] saveSTLFileWithTmpURL:location andModelName:_modelName];
}

- (void)URLSession:(NSURLSession *)session
      downloadTask:(NSURLSessionDownloadTask *)downloadTask
      didWriteData:(int64_t)bytesWritten
 totalBytesWritten:(int64_t)totalBytesWritten
totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite {
    if (_cmDelegate &&
        [_cmDelegate respondsToSelector:@selector(requestManager:downloadProgress:)]) {
        [_cmDelegate requestManager:self downloadProgress:totalBytesWritten/(float)totalBytesExpectedToWrite];
    }
}

@end
