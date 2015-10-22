//
//  BYRegistController.m
//  FellowPlusDemo
//
//  Created by brother on 15/10/21.
//  Copyright © 2015年 com.Binboy. All rights reserved.
//

#import "BYInnovatorRegistController.h"
#import <AVOSCloud/AVOSCloud.h>
#import <MBProgressHUD/MBProgressHUD.h>
#import "AppDelegate.h"

@interface BYInnovatorRegistController ()

@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;


@end

@implementation BYInnovatorRegistController

- (void)viewDidLoad {
    self.navigationController.navigationBarHidden = NO;
}

#pragma mark - Clicked Methods
// 注册
- (IBAction)registerBtnClicked:(id)sender {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    if (self.emailTextField.text.length <=6 || self.passwordTextField.text.length < 6) {
        [self userPromptWithMessage:@"请填写正确的邮箱与安全的密码(>6)"];
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        return;
    }
    // 发生注册请求
    [self sendRegisterRequest];
}
// 已有账号
- (IBAction)alreadySignUpBtnClicked:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
// 微信注册
- (IBAction)wechatRegisterBtnClicked:(id)sender {
}


- (IBAction)backgroundClicked:(id)sender {
    [self.emailTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
}

#pragma mark - Custom Methods
//发送注册请求
- (void)sendRegisterRequest {
    AVUser *user = [AVUser user];
    user.username = self.emailTextField.text;
    user.email = self.emailTextField.text;
    user.password = self.passwordTextField.text;
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        if (succeeded) {
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
