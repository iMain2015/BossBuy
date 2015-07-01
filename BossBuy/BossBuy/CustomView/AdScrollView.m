//
//  AdScrollView.m
//  BossBuy
//
//  Created by chenguandong on 15/7/1.
//  Copyright (c) 2015年 郑州立信科技. All rights reserved.
//

#import "AdScrollView.h"
#import "Constants.h"
@interface AdScrollView ()<UIScrollViewDelegate>
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)UIPageControl *pageControl;

@end

@implementation AdScrollView

-(void)dealloc{
    _scrollView = nil;
    _pageControl = nil;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        


        
        _scrollView = [[UIScrollView alloc]initWithFrame:frame];
        
        _scrollView.backgroundColor = [UIColor yellowColor];

        
        CGFloat w = frame.size.width;
        CGFloat h = frame.size.height;

        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.pagingEnabled = YES;
        _scrollView.delegate = self;
        
        
        
        // 添加PageControl
        UIPageControl *pageControl = [[UIPageControl alloc] init];
        pageControl.center = CGPointMake(w * 0.5, h - 20);
        pageControl.bounds = CGRectMake(0, 0, 150, 50);
     
        // 设置非选中页的圆点颜色
        pageControl.pageIndicatorTintColor = [UIColor redColor];
        // 设置选中页的圆点颜色
        pageControl.currentPageIndicatorTintColor = [UIColor blueColor];
        
        // 禁止默认的点击功能
        pageControl.enabled = NO;
        
        
        _pageControl = pageControl;
        
        [self addSubview:pageControl];
  
        [self addSubview:_scrollView];
        
    }
    return self;
}



-(void)setImageArray:(NSArray *)imageArray{

    CGFloat w = self.frame.size.width;
    CGFloat h = self.frame.size.height;
    
    _imageArray  = imageArray;
    
    
    
    // height == 0 代表 禁止垂直方向滚动
    _scrollView.contentSize = CGSizeMake(_imageArray.count * w, 0);
    
    _pageControl.numberOfPages = _imageArray.count; // 一共显示多少个圆点（多少页）

    for (UIView *view in _scrollView.subviews) {
        [view removeFromSuperview];
    }
    
    for (int i = 0; i< imageArray.count; i++) {
        
        UIImageView *imageView = [[UIImageView alloc] init];
        // 1.设置frame
        imageView.frame = CGRectMake(i * w, 0, SCREEN_WIDTH, h);
        imageView.contentMode = UIViewContentModeScaleAspectFit;

        [imageView sd_setImageWithURL:_imageArray[i] placeholderImage:[UIImage imageNamed:@"main_tabbar_icon"]];
        

        
        imageView.userInteractionEnabled = YES;
        
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(photoTapped:)];
        [imageView addGestureRecognizer:singleTap];//点击图片事件

        
        [_scrollView addSubview:imageView];
        


        
    }
    
    
    
    
    
}

-(void)photoTapped:(id)sender{
    
   // UIImageView *imageView =(UIImageView*)sender;
    
  //  NSLog(@"xxxx%ld",imageView.tag);
    
    //_adClick(imageView);
}


#pragma mark - UIScrollView的代理方法
#pragma mark 当scrollView正在滚动的时候调用
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int page = scrollView.contentOffset.x / scrollView.frame.size.width;
    //    NSLog(@"%d", page);
    
    // 设置页码
    _pageControl.currentPage = page;
}

@end
