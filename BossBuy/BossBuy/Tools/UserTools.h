//
//  UserTools.h
//  StudyProject
//
//  Created by chenguandong on 15/6/1.
//  Copyright (c) 2015年 chenguandong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"

@interface UserTools : NSObject

/**
 *   存入用户信息
 *
 *  @param userModel 用户信息
 */
+(void)saveUserInfo:(UserModel*)userModel;


/**
 *  获取用户信息
 *
 *  @return 用户信息
 */
+(UserModel*)getUserInfo;

/**
 *  清空所有账户
 */
+(void)cleanAllAccount;

@end
