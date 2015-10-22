//
//  BYLoginController.m
//  FellowPlusDemo
//
//  Created by brother on 15/10/21.
//  Copyright © 2015年 com.Binboy. All rights reserved.
//

#import "BYLoginController.h"
#import "AppDelegate.h"
#import <AVOSCloud/AVOSCloud.h>
#import <MBProgressHUD/MBProgressHUD.h>

@interface BYLoginController ()

@property (weak, nonatomic) IBOutlet UITextField *userTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UILabel *loginLabel;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;
@property (weak, nonatomic) IBOutlet UIControl *registerMaskView;
@property (weak, nonatomic) IBOutlet UIButton *forgetBtn;
@property (weak, nonatomic) IBOutlet UIButton *wechatLoginBtn;

@end

@implementation BYLoginController

- (void)viewDidLoad {

}

#pragma mark - Click Methods
// 登录
- (IBAction)loginBtnClicked:(id)sender {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    if (self.userTextField.text.length <=6 || self.passwordTextField.text.length < 6) {
        [self userPromptWithMessage:@"请填写正确的邮箱与密码"];
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        return;
    }
    [self sendLoginRequest];
}
// 还没有账号
- (IBAction)noAccountBtnClicked:(id)sender {
    //显示账号类型选择页面
    [UIView animateWithDuration:0.3f animations:^{
        self.userTextField.hidden = YES;
        self.passwordTextField.hidden = YES;
        self.registerBtn.hidden = YES;
        self.loginBtn.hidden = YES;
        self.loginLabel.hidden = YES;
        self.forgetBtn.hidden = YES;
        self.wechatLoginBtn.hidden = YES;
        self.navigationController.navigationBarHidden = YES;
        
        self.registerMaskView.hidden = NO;
        self.registerMaskView.backgroundColor = [UIColor colorWithWhite:0.2 alpha:0.8];
    }];
}
// 忘记密码
- (IBAction)forgetBtnClicked:(id)sender {
}
//微信登录
- (IBAction)wechatLoginBtnClicked:(id)sender {
#warning FakeLogin 先直接登录
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    [appDelegate switchRootViewController];
}
// 点击其他
- (IBAction)backgroundClicked:(id)sender {
    [self.userTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
}
// 注册提示显示遮罩被点击
- (IBAction)registerMaskClicked:(id)sender {
    self.navigationController.navigationBarHidden = NO;
    [UIView animateWithDuration:0.3f animations:^{
        self.userTextField.hidden = NO;
        self.passwordTextField.hidden = NO;
        self.registerBtn.hidden = NO;
        self.loginBtn.hidden = NO;
        self.loginLabel.hidden = NO;
        self.forgetBtn.hidden = NO;
        self.wechatLoginBtn.hidden = NO;

        self.registerMaskView.hidden = YES;
    }];
}

#pragma mark - Custom Methods
- (void)sendLoginRequest {
    NSString *username = self.userTextField.text;
    NSString *password = self.passwordTextField.text;
    [AVUser logInWithUsernameInBackground:username password:password block:^(AVUser *user, NSError *error) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        if (user != nil) {
            //登录成功
            AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
            [appDelegate switchRootViewController];
        } else {
            NSString *errorMessage = [NSString stringWithFormat:@"%@,请重试",[error localizedDescription]];
            [self userPromptWithMessage:errorMessage];
        }
    }];
}
// 用户提示
- (void)userPromptWithMessage:(NSString *)message {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:message delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [alert show];
}

@end
