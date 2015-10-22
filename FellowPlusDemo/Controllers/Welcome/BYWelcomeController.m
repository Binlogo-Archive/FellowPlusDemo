//
//  BYWelcomeController.m
//  FellowPlusDemo
//
//  Created by brother on 15/10/21.
//  Copyright © 2015年 com.Binboy. All rights reserved.
//

#import "BYWelcomeController.h"
#import "Const.h"
#import "BYNavItem.h"

@interface BYWelcomeController ()

@property (weak, nonatomic) IBOutlet UIImageView *logoImageView;
@property (weak, nonatomic) IBOutlet UIButton *registBtn;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@property (weak, nonatomic) IBOutlet UIView *registerMaskView;

@end

@implementation BYWelcomeController

#pragma mark - Life Cycle
- (void)viewDidLoad {
//    self.navigationController.navigationBarHidden = YES;

}

#pragma mark - Clicked Methods
// 创建账号
- (IBAction)registBtnClicked:(id)sender {
    //显示账号类型选择页面
    [UIView animateWithDuration:0.3f animations:^{
        self.registBtn.hidden = YES;
        self.loginBtn.hidden = YES;
        self.logoImageView.hidden = YES;
        self.registerMaskView.hidden = NO;
        self.registerMaskView.backgroundColor = [UIColor colorWithWhite:0.2 alpha:0.8];
    }];
}
// 登录
- (IBAction)loginBtnClicked:(id)sender {
}
// 注册页面遮罩点击
- (IBAction)registerMaskCliked:(id)sender {
    [UIView animateWithDuration:0.3f animations:^{
        self.registBtn.hidden = NO;
        self.loginBtn.hidden = NO;
        self.logoImageView.hidden = NO;
        self.registerMaskView.hidden = YES;
    }];
}

#pragma mark - Custom Method


@end
