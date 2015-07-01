//
//  MBProgressHUD+LXProgressHUD.m
//  BossBuy
//
//  Created by chenguandong on 15/7/1.
//  Copyright (c) 2015年 郑州立信科技. All rights reserved.
//

#import "MBProgressHUD+LXProgressHUD.h"

@implementation MBProgressHUD (LXProgressHUD)

+(void)showHUDAutoDissmiss:(UIView*)view text:(NSString*)text animated:(BOOL)animated{
    
    MBProgressHUD *hub =[MBProgressHUD showHUDAddedTo:view animated:animated];
    hub.labelText = text;
    [hub show:YES];
    
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 0.01 * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        // Do something...
       [hub hide:YES];
    });
}

+(void)showHUD:(UIView*)view text:(NSString*)text animated:(BOOL)animated{
    
    MBProgressHUD *hub =[MBProgressHUD showHUDAddedTo:view animated:animated];
    hub.labelText = text;
    [hub show:YES];

}

+(void)dissMissHUD:(UIView*)view text:(NSString*)text animated:(BOOL)animated{
    
   [[MBProgressHUD showHUDAddedTo:view animated:animated] hide:YES];
    
}


@end
