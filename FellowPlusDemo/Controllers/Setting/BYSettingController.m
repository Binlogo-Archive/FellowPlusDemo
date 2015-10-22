//
//  BYSettingController.m
//  FellowPlusDemo
//
//  Created by brother on 15/10/21.
//  Copyright © 2015年 com.Binboy. All rights reserved.
//

#import "BYSettingController.h"
#import "AppDelegate.h"
#import <AVOSCloud/AVOSCloud.h>

@interface BYSettingController ()<UITableViewDataSource, UITableViewDelegate, UIActionSheetDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *avatorImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;


@end

@implementation BYSettingController

- (void)viewDidAppear:(BOOL)animated {
    AVUser *currentUser = [AVUser currentUser];
    if ([currentUser valueForKey:@"name"]) {
        self.nameLabel.text = [currentUser valueForKey:@"name"];
    } else {
        self.nameLabel.text = @"敢问江湖名号";
    }
}

#pragma mark - TabelView Protocol Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 2 && indexPath.row == 0) {
        [self logout];
    }
}

#pragma mark - ActionSheet Methods
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        //确认退出
        AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
        [appDelegate switchRootViewControllerToWelcome];
    }
}

// 退出登录
- (void)logout {
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"退出不会删除历史数据，下次登录可继续使用本账号" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"退出登录" otherButtonTitles: nil];
    [sheet showInView:self.view];
}

@end
