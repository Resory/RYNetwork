//
//  RYWeatherDao.h
//  RYNetwork
//
//  Created by billionsfinance-resory on 16/1/8.
//  Copyright © 2016年 Resory. All rights reserved.
//

#import "RYBaseDao.h"

@interface RYWeatherDao : RYBaseDao

/**
 *  单例
 *
 *  @return 返回单例
 */
+ (instancetype)shareInstance;

/**
 *  获得城市天气数据
 *
 *  @param city 城市
 *  @param success 成功回调
 *  @param failed  失败回调
 */
- (void)getWeatherInfoWithCity:(NSString *)city
                    andSuccess:(RYDaoRequestSuccess)success
                     andFailed:(RYDaoRequestFailed)failed;

@end
