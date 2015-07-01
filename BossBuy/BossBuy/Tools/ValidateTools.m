//
//  ValidateTools.m
//  StudyProject
//
//  Created by chenguandong on 15/6/2.
//  Copyright (c) 2015年 chenguandong. All rights reserved.
//

#import "ValidateTools.h"

#import "Constants.h"
@implementation ValidateTools
//利用正则表达式验证
+(BOOL)validateEmail:(NSString *)email {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

+(BOOL)validateMobile:(NSString *)mobileNum
{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189
     22         */
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}


/**
 *  判断字符串是否为空
 *
 *  @param validateStr 需要验证的字符串
 *
 *  @return YES  为空  NO 不为空
 */
+(BOOL)validateIsNull:(NSString*)validateStr{

    return validateStr.length>0?NO:YES;

}


+(BOOL)validateEmailORPhoneNum:(NSString*)validateStr{
    

    
    return ([self validateEmail:validateStr]||[self validateMobile:validateStr]);
}

+(BOOL)validatePassword:(NSString*)passWordStr{

    return passWordStr.length>=6?YES:NO;
}
/**
 *  验证用户注册是否通过
 *
 *  @param userName       用户名
 *  @param school         学校
 *  @param doMian         专业
 *  @param grade          年级
 *  @param password       密码
 *  @param repeatPassword 重复密码
 *  @param view           提示View 的位置
 *
 *  @return YES 验证通过  NO 验证不通过
 */
+(BOOL)validateRegisterWithUserName:(NSString*)userName
                             school:(NSString*)school
                             doMain:(NSString*)doMian
                              grade:(NSString*)grade
                           password:(NSString*)password
                           repeatPassword:(NSString*)repeatPassword
                               view:(UIView*)view
    {
    
        
        if (![ValidateTools validateIsNull:userName]) {
            if (![ValidateTools  validateEmailORPhoneNum:userName]) {
  
                [view makeToast:@"请输入正确的邮箱或手机账号" duration:1 position:CSToastPositionCenter];
                
                return NO;

            }
        }else{
                [view makeToast:@"用户名不能为空" duration:1 position:CSToastPositionCenter];
            
                return NO;
            
        }
        
        if ([ValidateTools validateIsNull:school]){
            
             [view makeToast:@"学校不能为空" duration:1 position:CSToastPositionCenter];
           
            return  NO;
        }

        else if ([ValidateTools validateIsNull:doMian]){
            
            [view makeToast:@"专业不能为空" duration:1 position:CSToastPositionCenter];
            
             return  NO;
        }
        
        else if ([ValidateTools validateIsNull:grade]){
            
            [view makeToast:@"年级不能为空" duration:1 position:CSToastPositionCenter];
            
             return  NO;
        }
        
    
    
         if (![ValidateTools validateIsNull:password]) {
            
            if (![ValidateTools validatePassword:password]) {
                [view makeToast:@"密码长度至少6位" duration:1 position:CSToastPositionCenter];
                return NO;
            }

         }else{
             [view makeToast:@"密码不能为空" duration:1 position:CSToastPositionCenter];
             
             return NO;
         }
        
        
        
        if (![ValidateTools validateIsNull:repeatPassword]) {
            
            if (![repeatPassword isEqualToString:password]) {
                [view makeToast:@"两次输入密码不一致" duration:1 position:CSToastPositionCenter];
                return NO;
            }
            
        }else{
            [view makeToast:@"重复密码不能为空" duration:1 position:CSToastPositionCenter];
            
            return NO;
        }
        
    return YES;
}


/**
 *  切换TextField 验证输入的信息
 *
 *  @param textField   当前输入框
 *  @param passwordStr 密码
 *  @param view        显示提醒的View
 */
+(void)validateOnChangeTextField:(UITextField*)textField password:(NSString*)passwordStr showInView:(UIView*)view{

    NSLog(@"username=%@",textField.text);
    
    switch (textField.tag) {
        case 11:
            
            
            if (![ValidateTools validateEmailORPhoneNum:textField.text]) {
                
                [view makeToast:@"请输入正确的邮箱或手机账号" duration:2 position:CSToastPositionCenter];
            }
            
            
            break;
            
        case 22:
            
            if ([ValidateTools validateIsNull:textField.text]) {
                
                [view makeToast:@"学校名不能为空" duration:2 position:CSToastPositionCenter];
            }
            
            
            break;
            
        case 33:
            
            if ([ValidateTools validateIsNull:textField.text]) {
                
                [view makeToast:@"专业不能为空" duration:2 position:CSToastPositionCenter];
            }
            
            break;
            
        case 44:
            
            if ([ValidateTools validateIsNull:textField.text]) {
                
                [view makeToast:@"年级不能为空" duration:2 position:CSToastPositionCenter];
            }
            
            break;
        case 55:
            
            if (![ValidateTools validatePassword:textField.text]) {
                [view makeToast:@"密码长度至少6位" duration:2 position:CSToastPositionCenter];
            }
            
            break;
        case 66:
            
            if ([ValidateTools validateIsNull:textField.text]) {
                [view makeToast:@"重复密码不能为空" duration:2 position:CSToastPositionCenter];
            }else{
                
                if (![textField.text isEqualToString:passwordStr]) {
                    [view makeToast:@"两次输入密码不一致" duration:2 position:CSToastPositionCenter];
                }
            }
            
            
            break;
            
            
        default:
            break;
    }
}


@end
