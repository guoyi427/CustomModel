//
//  CMRequestManager.h
//  CustomModel
//
//  Created by guoyi on 16/2/15.
//  Copyright © 2016年 郭毅. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CMRequestManager : NSObject

+ (instancetype)sharedRequestManager;

- (void)downloadStlFileWithUrlString:(NSString *)urlString;

@end
