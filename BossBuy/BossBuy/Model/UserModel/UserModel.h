//
//  UserModel.h
//  StudyProject
//
//  Created by chenguandong on 15/6/1.
//  Copyright (c) 2015年 chenguandong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject
/**
 *  用户积分
 */
@property(nonatomic,copy)NSString *score;

/**
 *  用户名
 */
@property(nonatomic,copy)NSString *userName;

/**
 *  用户头像
 */
@property(nonatomic,copy)NSString *userIcon;

/**
 *  用户专业
 */
@property(nonatomic,copy)NSString * doMain;


/**
 *  用户年级
 */
@property(nonatomic,copy)NSString * grade;

/**
 *  昵称
 */
@property(nonatomic,copy)NSString * nickName;

/**
 *  学校名称
 */
@property(nonatomic,copy)NSString * school;


/**
 *  设置UserModel 的值
 *
 *  @param userDic user Dic
 */
-(void)setUserModelWithDic:(NSDictionary*)userDic;

@end
