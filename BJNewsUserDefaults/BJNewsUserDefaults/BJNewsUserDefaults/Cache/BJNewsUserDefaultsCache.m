//
//  BJNewsUserDefaultsCache.m
//  BJNewsUserDefaults
//
//  Created by wolffy on 2019/7/30.
//  Copyright © 2019 新京报社. All rights reserved.
//

#import "BJNewsUserDefaultsCache.h"

@implementation BJNewsUserDefaultsCache

/**
 初始化userDefaults
 
 @param suiteName 功能名称
 */
- (instancetype)initWithSuiteName:(NSString *)suiteName{
    self = [super init];
    if(self){
        self.suiteName = suiteName;
    }
    return self;
}

- (NSString *)basePath{
    NSString * basePath = [NSHomeDirectory() stringByAppendingPathComponent:@"/Library/Caches/User"];
    BOOL isExist = [[NSFileManager defaultManager] fileExistsAtPath:basePath];
    if(isExist == NO){
        [[NSFileManager defaultManager] createDirectoryAtPath:basePath withIntermediateDirectories:YES attributes:@{} error:nil];
    }
    return basePath;
}

- (NSString *)filePath{
    NSString * basePath = [self basePath];
    NSString * path = [NSString stringWithFormat:@"%@/%@.plist",basePath,self.suiteName];
    return path;
}

/**
 获取所有键值对
 
 @return 所有键值对
 */
- (NSDictionary *)dictionary{
    NSString * path = [self filePath];
    BOOL isExist = [[NSFileManager defaultManager] fileExistsAtPath:path];
    if(isExist == NO){
        return nil;
    }
    NSDictionary * dict = [[NSDictionary alloc]initWithContentsOfFile:path];
    return dict;
}

@end
