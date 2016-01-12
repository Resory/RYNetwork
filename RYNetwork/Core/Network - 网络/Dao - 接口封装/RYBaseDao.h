//
//  RYBaseDao.h
//  RYNetwork
//
//  Created by billionsfinance-resory on 16/1/8.
//  Copyright © 2016年 Resory. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RYNetwork.h"

typedef void(^RYDaoRequestSuccess)(id response);
typedef void(^RYDaoRequestFailed)(id response);

@interface RYBaseDao : NSObject

/**
 *  设置基础URL  eg:www.dolabank.com/app/user
 *
 *  @param url 基础URL分支  eg:app/user
 *
 *  @return 返回完整基础URL eg:www.dolabank.com/app/user
 */
- (NSString *)setBaseUrlWithBranchUrl:(NSString *)url;

/**
 *  加密数据
 *
 *  @param parameter 需要加密的字典
 *
 *  @return 加密后字典
 */
- (NSDictionary *)encryptDataWithParameter:(NSDictionary *)parameter;

/**
 *  数据的解密与封装
 *
 *  @param response 返回的加密数据
 *
 *  @return 数据返回实体类型
 */
- (id)decryptDataWithServiceResponse:(id)response;

@end
