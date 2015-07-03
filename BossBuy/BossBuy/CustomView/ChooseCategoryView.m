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
    _shopCategoryArray = nil;
    _categoryArray = nil;
    _nowCategoryArray  = nil;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        
        [self initData];
        
        self.backgroundColor = [UIColor grayColor];

        
        _tableView = [[UITableView alloc]init];
        
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
        
        
        
        _tableView.hidden = YES;
        
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onViewClickAction:)];
        
        self.userInteractionEnabled = YES;
        
        //[self addGestureRecognizer:tap];
        
    }
    return self;
}


-(void)onViewClickAction:(id)sender{
    NSLog(@"xxxxxx");
}

-(void)initData{
    _shopCategoryArray = [[NSArray alloc]init];
    _shopCategotyOther = [[NSArray alloc]init];
    _categoryArray = [[NSArray alloc]init];
    _nowCategoryArray = [[NSArray alloc]init];
}

-(void)buttonClickAction:(id)sender{

    UIButton *button = (UIButton*)sender;
    
    
    switch (button.tag) {
        case 0:
            _nowChooseType = ChooseTypeCategory;
            
            [self reloadNowCategoryTableViewData:self.categoryArray];
            
            break;
        case 1:
            _nowChooseType = ChooseTypeCategotyShop;
            
             [self reloadNowCategoryTableViewData:self.shopCategoryArray];
            break;
        case 2:
            _nowChooseType = ChooseTypeCategoryOther;
            
             [self reloadNowCategoryTableViewData:self.shopCategotyOther];
            break;
            
        default:
            break;
    }
    
    [self.delegate buttonClick:_nowChooseType button:button];
    
    _tableView.hidden = NO;
    
}

//分类1
-(void)setCategoryArray:(NSArray *)categoryArray{
    
    NSLog(@"%ld",categoryArray.count);
    
    _categoryArray = [categoryArray copy];
    
   // [self reloadNowCategoryTableViewData:self.categoryArray];
}


//分类2
-(void)setShopCategoryArray:(NSArray *)shopCategoryArray{
    _shopCategoryArray  = [shopCategoryArray copy];
   // [self reloadNowCategoryTableViewData:self.shopCategoryArray];
}

//分类3
-(void)setShopCategotyOther:(NSArray *)shopCategotyOther{
    _shopCategotyOther= [shopCategotyOther copy];
  //  [self reloadNowCategoryTableViewData:self.shopCategotyOther];
}


/**
 *   刷新当前分类列表数据
 */
-(void)reloadNowCategoryTableViewData:(NSArray*)array{

    _nowCategoryArray = [array copy];
    
    [_tableView reloadData];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return _nowCategoryArray.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    
    cell.backgroundColor =[UIColor orangeColor];
    
    CategoryModel *categoryModel = _nowCategoryArray[indexPath.row];
    
    
    cell.textLabel.text = categoryModel.categoryName;
    
    cell.textLabel.textAlignment  = NSTextAlignmentCenter;
    
    return cell;
}




-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    _tableView.hidden = YES;
    
    CategoryModel *categoryModel = _nowCategoryArray[indexPath.row];
    
    [self.delegate categoryClick:categoryModel chooseType:_nowChooseType];
    
}


-(void)layoutSubviews{
    [super layoutSubviews];
    
    _tableView.frame= CGRectMake(0, 44, SCREEN_WIDTH, 44*_nowCategoryArray.count);
}

@end
