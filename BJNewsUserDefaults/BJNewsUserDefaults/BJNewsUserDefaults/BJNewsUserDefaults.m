//
//  BJNewsUserDefaults.m
//  BJNewsUserDefaults
//
//  Created by wolffy on 2019/7/30.
//  Copyright © 2019 新京报社. All rights reserved.
//

#import "BJNewsUserDefaults.h"
#import "BJNewsUserDefaultsCache.h"

@interface BJNewsUserDefaults ()

/**
 持久化存储管理类
 */
@property (nonatomic,strong) BJNewsUserDefaultsCache * cacheManager;

@end

@implementation BJNewsUserDefaults

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

/**
 初始化userDefaults
 
 @param suiteName 功能名称
 */
+ (instancetype)userDefaultsWithSuiteName:(NSString *)suiteName{
    BJNewsUserDefaults * user = [[BJNewsUserDefaults alloc]initWithSuiteName:suiteName];
    return user;
}

/**
  持久化存储管理类
 */
- (BJNewsUserDefaultsCache *)cacheManager{
    if(_cacheManager == nil){
        _cacheManager = [[BJNewsUserDefaultsCache alloc]initWithSuiteName:self.suiteName];
    }
    _cacheManager.suiteName = self.suiteName;
    return _cacheManager;
}

#pragma mark - 增、改

/**
 更新单个缓存数据
 
 @param value value
 @param key key
 */
- (void)updateValue:(id)value withKey:(NSString *)key{
    [self.cacheManager updateValue:value withKey:key];
}

/**
 批量更新缓存数据
 
 @param appendDict appendDict
 */
- (void)updateValuesWithDictionary:(NSDictionary *)appendDict{
    [self.cacheManager updateValuesWithDictionary:appendDict];
}

/**
 重置缓存数据
 
 @param resetDict resetDict
 */
- (void)resetValuesWithDictionary:(NSDictionary *)resetDict{
    [self.cacheManager resetValuesWithDictionary:resetDict];
}

#pragma mark - 删

/**
 删除单个缓存数据
 
 @param key key
 */
- (void)deleteObjectWithKey:(NSString *)key{
    [self.cacheManager deleteObjectWithKey:key];
}

/**
 删除所有缓存数据
 */
- (void)deleteAllObjects{
    [self.cacheManager deleteAllObjects];
}

#pragma mark - 查

/**
 获取所有键值对
 
 @return 所有键值对
 */
- (NSDictionary *)dictionary{
    NSDictionary * dict = [self.cacheManager dictionary];
    return dict;
}

/**
 获取单个值
 
 @param key key
 */
- (id)valueForKey:(NSString *)key{
    id value = [self.cacheManager valueForKey:key];
    return value;
}

@end
