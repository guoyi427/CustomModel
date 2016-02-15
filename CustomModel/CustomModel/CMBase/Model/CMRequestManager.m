//
//  CMRequestManager.m
//  CustomModel
//
//  Created by guoyi on 16/2/15.
//  Copyright © 2016年 郭毅. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "CMRequestManager.h"

@interface CMRequestManager () <NSURLSessionDelegate>

@end

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

- (void)downloadStlFileWithUrlString:(NSString *)urlString {

    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]
                                                          delegate:self
                                                     delegateQueue:[NSOperationQueue mainQueue]];
    NSURLSessionDownloadTask *downloadTask = [session downloadTaskWithURL:[NSURL URLWithString:urlString]
               completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                   if (error) {
                       //   失败
                       NSLog(@"download error = %@",error);
                   } else {
                       //   成功
                       NSLog(@"downlaod success = %@",location);
                       NSData *imageData = [NSData dataWithContentsOfURL:location];
                       NSLog(@"image size = %lu",imageData.length);
                   }
               }];
    [downloadTask resume];
    
}

#pragma mark - NSURLSession Delegate

- (void)URLSession:(NSURLSession *)session didBecomeInvalidWithError:(nullable NSError *)error {
    
}

- (void)URLSession:(NSURLSession *)session didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge
 completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential * __nullable credential))completionHandler {
    
}

@end
