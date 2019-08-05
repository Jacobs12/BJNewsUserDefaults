# BJNewsUserDefaults

##简介

简易本地数据持久化存储，适用于非加密、小量级的数据持久化存储；

定义一个suiteName，对应的在/Library/Caches/user_cache路径下会生成一个对应的xxxxxxx.plist文件；

可用于数据的增、删、改、查，不可用于大量数据的存储；

##用法

/**
初始化userDefaults

@param suiteName 功能名称
*/
+ (instancetype)userDefaultsWithSuiteName:(NSString *)suiteName;

#pragma mark - 增、改

/**
更新单个缓存数据

@param value value
@param key key
*/
- (void)updateValue:(id)value withKey:(NSString *)key;

/**
批量更新缓存数据

@param appendDict appendDict
*/
- (void)updateValuesWithDictionary:(NSDictionary *)appendDict;

/**
重置缓存数据

@param resetDict resetDict
*/
- (void)resetValuesWithDictionary:(NSDictionary *)resetDict;

#pragma mark - 删

/**
删除单个缓存数据

@param key key
*/
- (void)deleteObjectWithKey:(NSString *)key;

/**
删除所有缓存数据
*/
- (void)deleteAllObjects;

#pragma mark - 查

/**
获取所有键值对

@return 所有键值对
*/
- (NSDictionary *)dictionary;

/**
获取单个值

@param key key
*/
- (id)valueForKey:(NSString *)key;

