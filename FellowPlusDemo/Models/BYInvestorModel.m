//
//  BYInvestorModel.m
//  FellowPlusDemo
//
//  Created by brother on 15/10/22.
//  Copyright © 2015年 com.Binboy. All rights reserved.
//

#import "BYInvestorModel.h"

@implementation BYInvestorModel

+ (instancetype)investorWithDict:(NSDictionary *)dict {
    BYInvestorModel *investor = [[BYInvestorModel alloc] initWithDict:dict];
    return investor;
}

- (instancetype)initWithDict:(NSDictionary *)dict {
    if ([super init]) {
        self.user_id = dict[@"user_id"];
        self.name = dict[@"name"];
        self.avator = dict[@"avator"];
    }
    return self;
}

@end
