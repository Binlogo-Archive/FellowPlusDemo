//
//  BYProjectController.m
//  FellowPlusDemo
//
//  Created by brother on 15/10/21.
//  Copyright © 2015年 com.Binboy. All rights reserved.
//

#import "BYProjectController.h"
#import "BYNavItem.h"

@implementation BYProjectController

- (void)viewDidLoad {
    
    self.navigationItem.rightBarButtonItem = [BYNavItem navItemWithTarget:self action:@selector(scanMyProject) image:@"navigationbar_pop" selectedImage:nil];
}
                                              
#pragma mark - Custome Methods
- (void)scanMyProject {
    
}


@end
