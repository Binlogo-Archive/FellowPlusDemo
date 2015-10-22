//
//  BYSegmentedControl.h
//  FellowPlusDemo
//
//  Created by brother on 15/10/21.
//  Copyright © 2015年 com.Binboy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BYSegmentedControl;

@protocol BYsegmentedControlDelegate <NSObject>

- (void)control:(BYSegmentedControl *)control didSelectedIndex:(NSInteger)selectedIndex;

@end

@interface BYSegmentedControl : UIView

@property (nonatomic, assign) NSInteger selectedIndex;

@property (nonatomic, weak) id<BYsegmentedControlDelegate> delegate;

@end
