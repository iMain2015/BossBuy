//
//  NetWorkTools.h
//  iOSStudy
//
//  Created by chenguandong on 15/1/31.
//  Copyright (c) 2015年 chenguandong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFHTTPRequestOperationManager.h>
typedef void(^isNetwork) (BOOL isNetwork);

typedef void(^success)(AFHTTPRequestOperation *operation, id responseObject) ;
typedef void(^error)(AFHTTPRequestOperation *operation, NSError *error);
typedef void(^isNetwork) (BOOL isNetwork);

@interface NetWorkTools : NSObject



+ (instancetype)sharedInstance;



+(void)postHttp :(id)parameters success:(success)success error:(error)error isNetworking:(isNetwork)isNetworking;


+(void)postHttpForImageUpload :(id)parameters success:(success)success error:(error)error isNetworking:(isNetwork)isNetworking ;

/*
 *检查网络连接注册通知
 */
+(void)checkNetworking:(isNetwork)isNetwork;
@end
