//
//  AppDelegate.m
//  FellowPlusDemo
//
//  Created by brother on 15/10/21.
//  Copyright © 2015年 com.Binboy. All rights reserved.
//

#import "AppDelegate.h"
#import "Const.h"
#import <AVOSCloud/AVOSCloud.h>

#import "BYWelcomeController.h"

#import "BYTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //配置LeanCloud
    [AVOSCloud setApplicationId:kApplicationId clientKey:kClientKey];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    [self switchRootViewControllerToWelcome];
    
    return YES;
}

#pragma mark - App Life Cycle
- (void)applicationWillResignActive:(UIApplication *)application {

}

- (void)applicationDidEnterBackground:(UIApplication *)application {

}

- (void)applicationWillEnterForeground:(UIApplication *)application {

}

- (void)applicationDidBecomeActive:(UIApplication *)application {

}

- (void)applicationWillTerminate:(UIApplication *)application {

}

#pragma mark - Custom Method
- (void)switchRootViewController {
    BYTabBarController *tabBarController = [[BYTabBarController alloc] init];
    self.window.rootViewController = tabBarController;
}

- (void)switchRootViewControllerToWelcome {
    UIStoryboard *welcome = [UIStoryboard storyboardWithName:@"Welcome" bundle:nil];
    BYWelcomeController *welcomeContro = [welcome instantiateInitialViewController];
    self.window.rootViewController = welcomeContro;
}

@end
