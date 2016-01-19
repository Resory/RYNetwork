//
//  RYNetwork.h
//  RYNetwork
//
//  Created by billionsfinance-resory on 16/1/8.
//  Copyright © 2016年 Resory. All rights reserved.
//

#import <Foundation/Foundation.h>

#define NET_FAIL_CONNECT_SERVER @"请求失败"
#define NET_FAIL_CONNECT_INTERNET @"网络出现了问题"
#define NET_DOMAIN @"http://apis.baidu.com/heweather/weather/free"

typedef void(^RYNetWorkRequestSuccess)(id response);
typedef void(^RYNetWorkRequestFailed)(id response);

@interface RYNetwork : NSObject

/**
 *  GET方式发起网络请求
 *
 *  @param baseUrl   基础URL
 *  @param parameter 字典参数
 *  @param success   成功返回时,处理block
 *  @param failed    失败返回时,处理block
 */
+ (void)getRequestWithBaseUrl:(NSString *)baseUrl
                 andParameter:(NSDictionary *)parameter
           andSuccessCallBack:(RYNetWorkRequestSuccess)success
            andFailedCallBack:(RYNetWorkRequestFailed)failed;

/**
 *  POST方式发起网络请求
 *
 *  @param baseUrl   基础URL
 *  @param parameter 字典参数
 *  @param success   成功返回时,处理block
 *  @param failed    失败返回时,处理block
 */
+ (void)postRequestWithBaseUrl:(NSString *)baseUrl
                  andParameter:(NSDictionary *)parameter
            andSuccessCallBack:(RYNetWorkRequestSuccess)success
             andFailedCallBack:(RYNetWorkRequestFailed)failed;

/**
 *  POST方式上传图片
 *
 *  @param baseUrl       基础URL
 *  @param parameter     字典参数
 *  @param imageDataArrs 图片二进制数据
 *  @param success       成功返回时,处理block
 *  @param failed        失败返回时,处理block
 */
+ (void)postImageDataWithBaseUrl:(NSString *)baseUrl
                    andParameter:(NSDictionary *)parameter
                andImageDataArrs:(NSArray *)imageDataArrs
                      andSuccess:(RYNetWorkRequestSuccess)success
                       andFailed:(RYNetWorkRequestFailed)failed;

@end
