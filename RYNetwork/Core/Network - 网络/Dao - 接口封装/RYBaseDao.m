//
//  RYBaseDao.m
//  RYNetwork
//
//  Created by billionsfinance-resory on 16/1/8.
//  Copyright © 2016年 Resory. All rights reserved.
//

#import "RYBaseDao.h"

@implementation RYBaseDao

//设置基础URL
- (NSString *)setBaseUrlWithBranchUrl:(NSString *)url
{
    NSString *baseUrl = [NSString stringWithFormat:@"%@/%@",NET_DOMAIN,url];
    return baseUrl;
}

// 加密操作
- (NSDictionary *)encryptDataWithParameter:(NSDictionary *)parameter;
{
    return parameter;
}

// 解密操作
- (id)decryptDataWithServiceResponse:(id)response;
{
    return response;
}

@end
