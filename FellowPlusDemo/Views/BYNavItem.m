//
//  BYNavItem.m
//  FellowPlusDemo
//
//  Created by brother on 15/10/21.
//  Copyright © 2015年 com.Binboy. All rights reserved.
//

#import "BYNavItem.h"

@implementation BYNavItem

+ (UIBarButtonItem *)navItemWithTarget:(id)target action:(SEL)action image:(NSString *)image selectedImage:(NSString *)selectedImage {
    
    UIButton *item = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [item addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    //设置两种状态下的图片
    [item setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    if (selectedImage) {
        [item setBackgroundImage:[UIImage imageNamed:selectedImage] forState:UIControlStateHighlighted];
    }
    
    //设置尺寸
    item.frame = CGRectMake(0, 0, item.currentBackgroundImage.size.width, item.currentBackgroundImage.size.width);
    
    return [[UIBarButtonItem alloc] initWithCustomView:item];
}

@end
