//
//  RYWeatherDao.m
//  RYNetwork
//
//  Created by billionsfinance-resory on 16/1/8.
//  Copyright © 2016年 Resory. All rights reserved.
//

#import "RYWeatherDao.h"

@implementation RYWeatherDao

+ (instancetype)shareInstance
{
    static dispatch_once_t once;
    static RYWeatherDao *weatherDaoCtl;
    dispatch_once(&once, ^{
        weatherDaoCtl = [[self alloc] init];
    });
    
    return weatherDaoCtl;
}

- (void)getWeatherInfoWithCity:(NSString *)city
                    andSuccess:(RYDaoRequestSuccess)success
                     andFailed:(RYDaoRequestFailed)failed
{
    // 基础URL
    NSString *tUrl = [self setBaseUrlWithBranchUrl:@""];
    // 服务器请求的参数
    NSDictionary *tParameter = @{@"city":city};
    // 加密数据
    NSDictionary *tEncryptParameter = [self encryptDataWithParameter:tParameter];
    // 发起请求
    [RYNetwork postRequestWithBaseUrl:tUrl
                         andParameter:tEncryptParameter
                   andSuccessCallBack:^(id response) {
                       
                       NSLog(@"success repsonse = %@", response);
                       
                   } andFailedCallBack:^(id response) {
                       
                       NSLog(@"fail repsonse = %@", response);
                       
                   }];
}

@end
