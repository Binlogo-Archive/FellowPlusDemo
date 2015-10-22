//
//  BYSegmentedControl.m
//  FellowPlusDemo
//
//  Created by brother on 15/10/21.
//  Copyright © 2015年 com.Binboy. All rights reserved.
//

#import "BYSegmentedControl.h"

#define kActiveBtnTag  100
#define kNewestBtnTag  200
#define kFitBtnTag     300

@interface BYSegmentedControl ()

@property (weak, nonatomic) IBOutlet UIButton *activeBtn;
@property (weak, nonatomic) IBOutlet UIButton *newestBtn;
@property (weak, nonatomic) IBOutlet UIButton *fitBtn;

@end

@implementation BYSegmentedControl

- (void)awakeFromNib {
    [self initialization];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if ([super initWithFrame:frame]) {
        [self initialization];
    }
    return self;
}

- (void)initialization {
    self.selectedIndex = 0;
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
}

- (IBAction)changeSelectedIndex:(UIButton *)sender {
    switch (sender.tag) {
        case kActiveBtnTag:
            self.selectedIndex = 0;
            break;
        case kNewestBtnTag:
            self.selectedIndex = 1;
            break;
        case kFitBtnTag:
            self.selectedIndex = 2;
            break;
            
        default:
            break;
    }
}

- (void)setSelectedIndex:(NSInteger)selectedIndex {
    _selectedIndex = selectedIndex;
    
    self.activeBtn.selected = NO;
    self.newestBtn.selected = NO;
    self.fitBtn.selected = NO;
    
    switch (selectedIndex) {
        case 0:
            self.activeBtn.selected = YES;
            break;
        case 1:
            self.newestBtn.selected = YES;
            break;
        case 2:
            self.fitBtn.selected = YES;
            break;
            
        default:
            break;
    }
    
    if ([self.delegate respondsToSelector:@selector(control:didSelectedIndex:)]) {
        [self.delegate control:self didSelectedIndex:selectedIndex];
    }
}

@end
