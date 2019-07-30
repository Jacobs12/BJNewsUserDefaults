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

- (BJNewsUserDefaultsCache *)cacheManager{
    if(_cacheManager == nil){
        _cacheManager = [[BJNewsUserDefaultsCache alloc]initWithSuiteName:self.suiteName];
    }
    _cacheManager.suiteName = self.suiteName;
    return _cacheManager;
}

/**
 获取所有键值对
 
 @return 所有键值对
 */
- (NSDictionary *)dictionary{
    NSDictionary * dict = [self.cacheManager dictionary];
    return dict;
}

@end
