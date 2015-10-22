//
//  BYProfileSetController.m
//  FellowPlusDemo
//
//  Created by brother on 15/10/22.
//  Copyright © 2015年 com.Binboy. All rights reserved.
//

#import "BYProfileSetController.h"
#import "BYBaseNavBar.h"
#import "BYNavItem.h"
#import "Const.h"

@interface BYProfileSetController ()<UIActionSheetDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *avatorImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *jobLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;

@end

@implementation BYProfileSetController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewDidAppear:(BOOL)animated {
    AVUser *currentUser = [AVUser currentUser];
    if ([currentUser valueForKey:@"name"]) {
        self.nameLabel.text = [currentUser valueForKey:@"name"];
    } else {
        self.nameLabel.text = @"请设置";
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view Protocol

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 4;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0: //头像
            [self pickAvatorImage];
            break;
        case 1: //名字
            
            break;
        case 2: //担任职位
            
            break;
        case 3: //手机号
            
            break;
        default:
            break;
    }
}

#pragma mark - ActionSheet Delegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    UIImagePickerControllerSourceType sourceType;
    switch (buttonIndex) {
        case 0: //拍照
            sourceType = UIImagePickerControllerSourceTypeCamera;
            break;
        case 1: //从手机相册选择
            sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            break;
        default:
            break;
    }
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];

    if ([UIImagePickerController isSourceTypeAvailable:sourceType]) {
        picker.sourceType = sourceType;
        picker.delegate = self;
        [self presentViewController:picker animated:YES completion:nil];
    }
}

#pragma mark - UIImagePickerController Delegate Methods
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    // 适当压缩并上传图片，并在完成后刷新显示
}

#pragma mark - Custom Methods
// 选择头像图片
- (void)pickAvatorImage {
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"提示" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"从手机相册选择", nil];
    [sheet showInView:self.view];
}

@end
