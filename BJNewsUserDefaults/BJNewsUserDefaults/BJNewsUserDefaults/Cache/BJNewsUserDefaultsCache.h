//
//  BJNewsUserDefaultsCache.h
//  BJNewsUserDefaults
//
//  Created by wolffy on 2019/7/30.
//  Copyright © 2019 新京报社. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BJNewsUserDefaultsCache : NSObject

/**
 功能名称
 */
@property (nonatomic,copy) NSString * suiteName;

/**
 初始化userDefaults
 
 @param suiteName 功能名称
 */
- (instancetype)initWithSuiteName:(NSString *)suiteName;

/**
 获取所有键值对
 
 @return 所有键值对
 */
- (NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
