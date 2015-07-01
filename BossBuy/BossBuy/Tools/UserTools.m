//
//  UserTools.m
//  StudyProject
//
//  Created by chenguandong on 15/6/1.
//  Copyright (c) 2015年 chenguandong. All rights reserved.
//

#import "UserTools.h"
#import <SSKeychain.h>
@implementation UserTools
+(void)saveUserInfo:(UserModel*)userModel{

    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    
    [userDefault setValue:userModel.score forKey:@"score"];
    
    [ userDefault setValue:userModel.userName forKey:@"userName"];
    
    
    [userDefault setValue:userModel.school forKey:@"school"];
    
     [userDefault setValue:userModel.grade forKey:@"grade"];
    
     [userDefault setValue:userModel.doMain forKey:@"doMain"];
    
    [userDefault setValue:userModel.userIcon forKey:@"userIcon"];
    
    [userDefault setValue:userModel.nickName forKey:@"nickName"];
    
    
    [userDefault synchronize];
    

    
}

+(UserModel*)getUserInfo{
   NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    
    UserModel *userModel = [[UserModel alloc]init];
    
    userModel.userName = [userDefault stringForKey:@"userName"];
    
    userModel.score = [userDefault stringForKey:@"score"];
    
    userModel.userIcon = [userDefault stringForKey:@"userIcon"];
    

    userModel.school = [userDefault stringForKey:@"school"];
    
    userModel.doMain = [userDefault stringForKey:@"doMain"];
    
    userModel.grade = [userDefault stringForKey:@"grade"];
    
    userModel.nickName = [userDefault stringForKey:@"nickName"];
    
    return userModel;
    
}


+(void)cleanAllAccount{
    NSArray *arr = [SSKeychain accountsForService:@"www.xuezhabao.com"];
    for (NSDictionary *dic  in arr) {
        
        
        [SSKeychain deletePasswordForService:@"www.xuezhabao.com" account:[dic objectForKey:@"acct"]];
    }
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    
    [userDefault removeObjectForKey:@"userName"];
    [userDefault removeObjectForKey:@"score"];
    [userDefault removeObjectForKey:@"userIcon"];
    
    [userDefault removeObjectForKey:@"school"];
    [userDefault removeObjectForKey:@"doMain"];
    [userDefault removeObjectForKey:@"grade"];
    
    [userDefault removeObjectForKey:@"nickName"];
    
    
    
    
}
@end
