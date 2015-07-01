//
//  MainHeaderView.m
//  BossBuy
//
//  Created by chenguandong on 15/7/1.
//  Copyright (c) 2015年 郑州立信科技. All rights reserved.
//

#import "MainHeaderView.h"

@interface MainHeaderView ()
@property(nonatomic,strong)NSArray *textArr;
@end
@implementation MainHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        _textArr =@[@"品牌街",@"推荐街",@"活动街",@"二手街",@"维修街",@"回收街",@"积分",@"客服",];
        
        for (int i =0; i<_textArr.count; i++) {
            
            UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];

            if (i<4) {
                

                 button.frame = CGRectMake(frame.size.width/4*i,0, frame.size.width/4, frame.size.height/2);
            }else{
                int ii  = i%4;
                button.frame = CGRectMake(frame.size.width/4*ii,frame.size.height/2 , frame.size.width/4, frame.size.height/2);
            }
            
            
            button.tag = i;
            
            [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            
            button.backgroundColor = [UIColor orangeColor];
            
            [button setTitle:_textArr[i] forState:UIControlStateNormal];
            
            [self addSubview:button];
            
        }
    }
    return self;
}
-(void)buttonClick:(id)sender{
    UIButton *button = (UIButton*)sender;
    _buttonBlock(button);
}



@end
