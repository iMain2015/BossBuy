//
//  ChooseCategoryView.m
//  BossBuy
//
//  Created by chenguandong on 15/7/2.
//  Copyright (c) 2015年 郑州立信科技. All rights reserved.
//

#import "ChooseCategoryView.h"
#import "Constants.h"
@interface ChooseCategoryView ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView *tableView;

@end

@implementation ChooseCategoryView



-(void)dealloc{
    
    _shopCategotyOther = nil;
    _shopCategotyOther = nil;
    _categoryArray = nil;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _shopCategoryArray = [[NSArray alloc]init];
        _shopCategotyOther = [[NSArray alloc]init];
        _categoryArray = [[NSArray alloc]init];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        self.backgroundColor = [UIColor grayColor];
        self.alpha = 0.5;
        
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 44, SCREEN_WIDTH, self.frame.size.height/2)];
        
        _tableView.delegate = self;
        
        _tableView.dataSource  = self;
        
        for (int i = 0; i<3; i++) {
            UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
            
            [button setTitle:@"button" forState:UIControlStateNormal];
            
            button.backgroundColor = [UIColor blueColor];
            
            button.frame = CGRectMake(frame.size.width/3*i,0, frame.size.width/3, 44);
            
            button.tag = i;
            
            [button addTarget:self action:@selector(buttonClickAction:) forControlEvents:UIControlEventTouchUpInside];
            
            [self addSubview:button];
            
        }

        [self addSubview:_tableView];
    }
    return self;
}


-(void)buttonClickAction:(id)sender{

    UIButton *button = (UIButton*)sender;
    
    switch (button.tag) {
        case 0:
            _nowChooseType = ChooseTypeCategory;
            
            break;
        case 1:
            _nowChooseType = ChooseTypeCategotyShop;
            
            break;
        case 2:
            _nowChooseType = ChooseTypeCategoryOther;
            
            break;
            
        default:
            break;
    }
    
    _tableView.hidden = NO;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 10;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    cell.textLabel.textAlignment  = NSTextAlignmentCenter;
    
    
    return cell;
}


-(void)setShopCategoryArray:(NSArray *)shopCategoryArray{
    
    _shopCategoryArray = [shopCategoryArray copy];
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    _tableView.hidden = YES;
}

@end
