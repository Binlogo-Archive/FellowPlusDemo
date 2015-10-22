//
//  BYNameSetController.m
//  FellowPlusDemo
//
//  Created by brother on 15/10/22.
//  Copyright © 2015年 com.Binboy. All rights reserved.
//

#import "BYNameSetController.h"
#import "Const.h"

@interface BYNameSetController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

@end

@implementation BYNameSetController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(completeNameSet)];
    
    AVUser *currentUser = [AVUser currentUser];
    if ([currentUser valueForKey:@"name"]) {
        self.nameTextField.text = [currentUser valueForKey:@"name"];
    } else {
        self.nameTextField.text = @"";
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TextField Delegate



#pragma mark - Custom Methods
- (void)completeNameSet {
    
}
@end
