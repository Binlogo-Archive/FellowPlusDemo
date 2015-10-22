//
//  BYBaseNavBar.m
//  FellowPlusDemo
//
//  Created by brother on 15/10/22.
//  Copyright © 2015年 com.Binboy. All rights reserved.
//

#import "BYBaseNavBar.h"
#import "Const.h"

@implementation BYBaseNavBar

- (instancetype)init {
    if ([super init]) {
        [self initialization];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if ([super initWithFrame:frame]) {
        [self initialization];
    }
    return self;
}

- (void)awakeFromNib {
    [self initialization];
}

- (void)initialization {
    [self setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithRed:81/255.f green:94/255.f blue:120/255.f alpha:1]] forBarMetrics:UIBarMetricsDefault];
    [self setTintColor:[UIColor whiteColor]];//返回按钮的箭头颜色
    
}

@end
