//
//  BYInvestorModel.h
//  FellowPlusDemo
//
//  Created by brother on 15/10/22.
//  Copyright © 2015年 com.Binboy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BYInvestorModel : NSObject

@property (nonatomic, strong) NSString *user_id;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *avator;

+ (instancetype)investorWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;

@end
