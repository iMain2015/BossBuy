//
//  CategoryModel.m
//  BossBuy
//
//  Created by chenguandong on 15/7/3.
//  Copyright (c) 2015年 郑州立信科技. All rights reserved.
//

#import "CategoryModel.h"

@implementation CategoryModel

- (instancetype)initWithName:(NSString*)categoryName categoryID:(NSString*)categoryID categoryImage:(NSString*)categoryImage
{
    self = [super init];
    if (self) {
        self.categoryName = categoryName;
        self.categoryImage = categoryImage;
        self.categoryID = categoryID;
    }
    return self;
}

@end
