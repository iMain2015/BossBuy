//
//  UserModel.m
//  StudyProject
//
//  Created by chenguandong on 15/6/1.
//  Copyright (c) 2015年 chenguandong. All rights reserved.
//

#import "UserModel.h"
#import "UserTools.h"
@implementation UserModel



-(void)setUserModelWithDic:(NSDictionary*)userDic{
    
    self.userName =userDic[@"userName"];
    
    self.score = userDic[@"score"];
    
    self.userIcon = userDic[@"userIcon"];
    

    self.doMain = userDic[@"doMain"];
    
    self.grade = userDic[@"grade"];
    if (!self.grade) {
        self.grade = @" ";
    }
    
    self.nickName = userDic[@"nickName"];
    
    self.school = userDic[@"school"];
    


}

@end
