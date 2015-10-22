//
//  CALayer+Common.m
//  FellowPlusDemo
//
//  Created by brother on 15/10/21.
//  Copyright © 2015年 com.Binboy. All rights reserved.
//

#import "CALayer+Common.h"

@implementation CALayer (Common)

@dynamic boarderUIColor;

- (void)setBorderUIColor:(UIColor *)borderUIColor {
    self.borderColor = borderUIColor.CGColor;
}

- (UIColor *)boarderUIColor {
    return [UIColor colorWithCGColor:self.borderColor];
}

@end
