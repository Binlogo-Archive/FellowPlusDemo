//
//  BYWelcomNavController.m
//  FellowPlusDemo
//
//  Created by brother on 15/10/21.
//  Copyright © 2015年 com.Binboy. All rights reserved.
//

#import "BYWelcomNavController.h"
#import "BYNavItem.h"

@interface BYWelcomNavController ()

@end

@implementation BYWelcomNavController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // 导航栏透明
    self.navigationBar.translucent = YES;
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"clear_nav_background"] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [self.navigationBar setShadowImage:[UIImage new]];
    
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationBar.translucent = YES;
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"clear_nav_background"] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [self.navigationBar setShadowImage:[UIImage new]];
}

- (void)viewDidAppear:(BOOL)animated {
    self.navigationBar.translucent = YES;
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"clear_nav_background"] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [self.navigationBar setShadowImage:[UIImage new]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Custom UI
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{

    viewController.navigationItem.leftBarButtonItem = [BYNavItem navItemWithTarget:self action:@selector(back) image:@"navigationbar_back" selectedImage:nil];

    [super pushViewController:viewController animated:animated];
}

- (void)back {
    [self popViewControllerAnimated:YES];
}

@end
