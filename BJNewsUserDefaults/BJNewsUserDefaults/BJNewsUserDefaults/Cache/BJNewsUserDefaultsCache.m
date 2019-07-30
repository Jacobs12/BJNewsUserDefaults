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

#pragma mark - 路径

/**
  文件存储目录
 */
- (NSString *)basePath{
    NSString * basePath = [NSHomeDirectory() stringByAppendingPathComponent:@"/Library/Caches/User"];
    BOOL isExist = [[NSFileManager defaultManager] fileExistsAtPath:basePath];
    if(isExist == NO){
        [[NSFileManager defaultManager] createDirectoryAtPath:basePath withIntermediateDirectories:YES attributes:@{} error:nil];
    }
    return basePath;
}

/**
 文件存储路径
 */
- (NSString *)filePath{
    NSString * basePath = [self basePath];
    NSString * path = [NSString stringWithFormat:@"%@/%@.plist",basePath,self.suiteName];
    return path;
}

#pragma mark - 写入

- (void)writeWithDictionary:(NSDictionary *)dictionary{
    if(dictionary == nil || ![dictionary isKindOfClass:[NSDictionary class]]){
        return;
    }
    NSString * path = [self filePath];
    if([[NSFileManager defaultManager] fileExistsAtPath:path]){
        [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
    }
    [dictionary writeToFile:path atomically:NO];
}

#pragma mark - 增、改

/**
 更新单个缓存数据
 
 @param value value
 @param key key
 */
- (void)updateValue:(id)value withKey:(NSString *)key{
    if(value == nil || [value isKindOfClass:[NSNull class]]){
        value = @"";
    }
    NSDictionary * cache = [self dictionary];
    NSMutableDictionary * dict = [[NSMutableDictionary alloc]init];
    if(cache){
        [dict setValuesForKeysWithDictionary:cache];
    }
    [dict setObject:value forKey:key];
    [self writeWithDictionary:dict];
}

/**
 批量更新缓存数据
 
 @param appendDict appendDict
 */
- (void)updateValuesWithDictionary:(NSDictionary *)appendDict{
    NSDictionary * cache = [self dictionary];
    NSMutableDictionary * dict = [[NSMutableDictionary alloc]init];
    if(cache){
        [dict setValuesForKeysWithDictionary:cache];
    }
    if(appendDict && [appendDict isKindOfClass:[NSDictionary class]]){
        for (NSString * key in appendDict.allKeys) {
            id value = appendDict[key];
            if([value isKindOfClass:[NSNull class]]){
                value = @"";
            }
            [dict setValue:value forKey:key];
        }
    }
    [self writeWithDictionary:dict];
}

/**
 重置缓存数据
 
 @param resetDict resetDict
 */
- (void)resetValuesWithDictionary:(NSDictionary *)resetDict{
    [self deleteAllObjects];
    [self writeWithDictionary:resetDict];
}

#pragma mark - 删

/**
 删除单个缓存数据
 
 @param key key
 */
- (void)deleteObjectWithKey:(NSString *)key{
    NSMutableDictionary * tempDict = [[NSMutableDictionary alloc]init];
    NSDictionary * cache = [self dictionary];
    if(cache && [cache isKindOfClass:[NSDictionary class]]){
        [tempDict setValuesForKeysWithDictionary:cache];
    }
    [tempDict removeObjectForKey:key];
    [self writeWithDictionary:tempDict];
}

/**
 删除所有缓存数据
 */
- (void)deleteAllObjects{
    NSString * path = [self filePath];
    BOOL isExist = [[NSFileManager defaultManager] fileExistsAtPath:path];
    if(isExist){
        [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
    }
}

#pragma mark - 查

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

/**
 获取单个值
 
 @param key key
 */
- (id)valueForKey:(NSString *)key{
    NSDictionary * dict = [self dictionary];
    if(dict == nil){
        return nil;
    }
    if([dict valueForKey:key] == nil){
        return nil;
    }
    id value = dict[key];
    return value;
}

@end
