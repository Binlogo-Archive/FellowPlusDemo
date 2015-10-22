//
//  BYTabBarController.m
//  FellowPlusDemo
//
//  Created by brother on 15/10/21.
//  Copyright © 2015年 com.Binboy. All rights reserved.
//

#import "BYTabBarController.h"
#import "BYBaseNavController.h"

#import "BYHomeController.h"
#import "BYMessageController.h"
#import "BYProjectController.h"
#import "BYSettingController.h"

@implementation BYTabBarController

- (void)viewDidLoad {
    // 添加控制器
    UIStoryboard *home = [UIStoryboard storyboardWithName:@"Home" bundle:nil];
    BYHomeController *homeController = [home instantiateInitialViewController];
    UIStoryboard *message = [UIStoryboard storyboardWithName:@"Message" bundle:nil];
    BYMessageController *messageController = [message instantiateInitialViewController];
    UIStoryboard *project = [UIStoryboard storyboardWithName:@"Project" bundle:nil];
    BYProjectController *projectController = [project instantiateInitialViewController];
    UIStoryboard *setting = [UIStoryboard storyboardWithName:@"Setting" bundle:nil];
    BYSettingController *settingController = [setting instantiateInitialViewController];
    
    homeController.title = @"投资人";
    messageController.title = @"消息";
    projectController.title = @"我的项目";
    settingController.title = @"设置";
    
    [self addChildVC:homeController image:@"tweet_normal" selectedImage:@"tweet_selected"];
    [self addChildVC:messageController image:@"privatemessage_normal" selectedImage:@"privatemessage_selected"];
    [self addChildVC:projectController image:@"project_normal" selectedImage:@"project_selected"];
    [self addChildVC:settingController image:@"me_normal" selectedImage:@"me_selected"];
}

- (void)addChildVC:(UIViewController *)childVC image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    //设置两种状态下的图片，特别是选中时图片不能被系统渲染成蓝色，要保持原来的颜色，也可以在Assets中修改
    childVC.tabBarItem.image = [UIImage imageNamed:image];

    childVC.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    //设置两种状态下的文字样式
    NSMutableDictionary *normalTextAttrs = [[NSMutableDictionary alloc] init];
    normalTextAttrs[NSForegroundColorAttributeName] = [UIColor colorWithRed:34/255.0 green:42/255.0 blue:52/255.0 alpha:123/255.0];
    [childVC.tabBarItem setTitleTextAttributes:normalTextAttrs forState:UIControlStateNormal];
    
    NSMutableDictionary *selectedTextAttrs = [[NSMutableDictionary alloc] init];
    selectedTextAttrs[NSForegroundColorAttributeName] = [UIColor colorWithRed:34/255.0 green:42/255.0 blue:52/255.0 alpha:1.0];
    [childVC.tabBarItem setTitleTextAttributes:selectedTextAttrs forState:UIControlStateSelected];
    
    //确保每个模块都在导航控制器中,并添加到tabBar控制器
    if (!childVC.navigationController) {
        BYBaseNavController *nav = [[BYBaseNavController alloc] initWithRootViewController:childVC];
        [self addChildViewController:nav];
    } else {
        [self addChildViewController:childVC];
    }
    
}

@end
