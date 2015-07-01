//
//  NetWorkTools.m
//  iOSStudy
//
//  Created by chenguandong on 15/1/31.
//  Copyright (c) 2015年 chenguandong. All rights reserved.
//

#import "NetWorkTools.h"
#import "Constants.h"
#import "AppDelegate.h"
#import "JsonTools.h"
#import <SVProgressHUD.h>
@implementation NetWorkTools


+ (instancetype)sharedInstance {
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });

    return sharedInstance;
}





+(void)postHttp :(id)parameters success:(success)success error:(error)error isNetworking:(isNetwork)isNetworking {
    

    if (SharedApp.isNetworking) {
        //  准备请求
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain", nil];//@"text/plain",
        
        
        
        NSDictionary *dic = @{@"json":[JsonTools jsonDicToString:parameters]};

        [manager GET:@"http://116.255.239.201:8080/xuezhabao/wg?" parameters:dic success:success failure:error];
    }else{
     
        isNetworking(false);
        
        NSLog(@"REACHABLE!");
        [SVProgressHUD showErrorWithStatus:@"无网络连接" maskType:SVProgressHUDMaskTypeGradient];
        
       
        
        double delayInSeconds = 3.0; dispatch_time_t
        popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            // code to be executed on the main queue after delay
            [SVProgressHUD dismiss];
        });
        
        
    }
}




+(void)postHttpForImageUpload :(id)parameters success:(success)success error:(error)error isNetworking:(isNetwork)isNetworking {
    
    
    if (SharedApp.isNetworking) {
        //  准备请求
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain", nil];//@"text/plain",

        NSDictionary *dic = @{@"json":[JsonTools jsonDicToString:parameters]};
        
        [manager POST:@"http://116.255.239.201:8080/xuezhabao/wg?" parameters:dic success:success failure:error];
    }else{
        
        isNetworking(false);
        
        NSLog(@"REACHABLE!");
        [SVProgressHUD showErrorWithStatus:@"无网络连接" maskType:SVProgressHUDMaskTypeGradient];
        
        double delayInSeconds = 3.0; dispatch_time_t
        popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            // code to be executed on the main queue after delay
            [SVProgressHUD dismiss];
        });
        
        
    }
}

/**
 * 检查网络连接
 */
+(void)checkNetworking:(isNetwork)isNetwork{
    

    NSURL *baseURL = [NSURL URLWithString:@"http://baidu.com/"];
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:baseURL];
    
    NSOperationQueue *operationQueue = manager.operationQueue;
    [manager.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWWAN:
            case AFNetworkReachabilityStatusReachableViaWiFi:
                [operationQueue setSuspended:NO];
                SharedApp.isNetworking = YES;
                
                isNetwork(YES);
                
                break;
            case AFNetworkReachabilityStatusNotReachable:
                SharedApp.isNetworking = NO;
                
                isNetwork(NO);
                
            default:
                [operationQueue setSuspended:YES];
                
                break;
        }
    }];
    
    [manager.reachabilityManager startMonitoring];
}




@end
