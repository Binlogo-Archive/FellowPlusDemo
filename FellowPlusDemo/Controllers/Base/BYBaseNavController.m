//
//  BYBaseNavController.m
//  FellowPlusDemo
//
//  Created by brother on 15/10/21.
//  Copyright © 2015年 com.Binboy. All rights reserved.
//

#import "BYBaseNavController.h"
#import "Const.h"
#import "BYNavItem.h"

@interface BYBaseNavController ()

@end

@implementation BYBaseNavController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self customNavigationBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Custom Methods
- (void)customNavigationBar {
    UINavigationBar *navigationBarAppearance = [UINavigationBar appearance];
    [navigationBarAppearance setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithRed:81/255.f green:94/255.f blue:120/255.f alpha:1]] forBarMetrics:UIBarMetricsDefault];
    [navigationBarAppearance setTintColor:[UIColor whiteColor]];//返回按钮的箭头颜色
    [navigationBarAppearance setTranslucent:YES];
    
    // 设置标题属性
    NSDictionary *textAttributes = @{
                                     NSFontAttributeName: [UIFont boldSystemFontOfSize:17],
                                     NSForegroundColorAttributeName: [UIColor whiteColor],
                                     };
    [navigationBarAppearance setTitleTextAttributes:textAttributes];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //不是根控制器时才需要显示左右两侧的navigationItem
    if (self.viewControllers.count > 0) {
        
        //利用自定义navItem设置左右两侧的navItem
        viewController.navigationItem.leftBarButtonItem = [BYNavItem navItemWithTarget:self action:@selector(back) image:@"navigationbar_back" selectedImage:nil];
        viewController.navigationItem.rightBarButtonItem = [BYNavItem navItemWithTarget:self action:@selector(more) image:@"navigationbar_more" selectedImage:nil];
        
        //只有是四个主要模块是才显示TabBarItem
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

- (void)back {
    [self popViewControllerAnimated:YES];
}

- (void)more {
    
}



@end
