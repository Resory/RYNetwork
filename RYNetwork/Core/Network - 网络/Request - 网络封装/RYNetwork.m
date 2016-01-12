//
//  RYNetwork.m
//  RYNetwork
//
//  Created by billionsfinance-resory on 16/1/8.
//  Copyright © 2016年 Resory. All rights reserved.
//

#import "RYNetwork.h"
#import <AFNetworking/AFNetworking.h>

@implementation RYNetwork

static AFHTTPRequestOperationManager *afManager;

+ (void)initialize
{
    afManager = [AFHTTPRequestOperationManager manager];
    afManager.responseSerializer.acceptableContentTypes = [afManager.responseSerializer.acceptableContentTypes setByAddingObject: @"text/html"];
    afManager.securityPolicy.allowInvalidCertificates = YES;
    [afManager.requestSerializer setValue:@"27ee3563e1dc714b41768a35867bc2d7" forHTTPHeaderField:@"apikey"];
    [afManager.reachabilityManager startMonitoring];
}

// GET方式发起请求
+ (void)getRequestWithBaseUrl:(NSString *)baseUrl
                 andParameter:(NSDictionary *)parameter
           andSuccessCallBack:(RYNetWorkRequestSuccess)success
            andFailedCallBack:(RYNetWorkRequestFailed)failed
{
    
    if(afManager.reachabilityManager.networkReachabilityStatus != 0)
    {
        // 网络通畅
        [afManager GET:baseUrl parameters:parameter success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            success(responseObject);
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
            failed(NET_FAIL_CONNECT_SERVER);
            
        }];
    }
    else
    {
        // 无网络状态
        failed(NET_FAIL_CONNECT_INTERNET);
    }
    
}

// POST方式发起请求
+ (void)postRequestWithBaseUrl:(NSString *)baseUrl
                  andParameter:(NSDictionary *)parameter
            andSuccessCallBack:(RYNetWorkRequestSuccess)success
             andFailedCallBack:(RYNetWorkRequestFailed)failed
{
    if(afManager.reachabilityManager.networkReachabilityStatus != 0)
    {
        // 有网络状态
        [afManager POST:baseUrl parameters:parameter success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            success(responseObject);
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
            failed(NET_FAIL_CONNECT_SERVER);
        }];
    }
    else
    {
        // 无网络状态
        failed(NET_FAIL_CONNECT_INTERNET);
    }
}

// POST方式发起请求 - 上传图片
+ (void)postImageDataWithBaseUrl:(NSString *)baseUrl
                    andParameter:(NSDictionary *)parameter
                andImageDataArrs:(NSArray *)imageDataArrs
                      andSuccess:(RYNetWorkRequestSuccess)success
                       andFailed:(RYNetWorkRequestFailed)failed
{
    
    [afManager POST:baseUrl parameters:parameter constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
        // dosth
        
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        success(responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        failed(NET_FAIL_CONNECT_SERVER);
    }];
}

@end
