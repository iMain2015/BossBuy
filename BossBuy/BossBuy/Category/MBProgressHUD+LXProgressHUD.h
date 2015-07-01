//
//  MBProgressHUD+LXProgressHUD.h
//  BossBuy
//
//  Created by chenguandong on 15/7/1.
//  Copyright (c) 2015年 郑州立信科技. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (LXProgressHUD)

+(void)showHUDAutoDissmiss:(UIView*)view text:(NSString*)text animated:(BOOL)animated;

+(void)showHUD:(UIView*)view text:(NSString*)text animated:(BOOL)animated;

+(void)dissMissHUD:(UIView*)view text:(NSString*)text animated:(BOOL)animated;
@end

