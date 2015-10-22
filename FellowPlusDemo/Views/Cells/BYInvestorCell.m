//
//  BYInvestorCell.m
//  FellowPlusDemo
//
//  Created by brother on 15/10/22.
//  Copyright © 2015年 com.Binboy. All rights reserved.
//

#import "BYInvestorCell.h"

@interface BYInvestorCell ()

@property (weak, nonatomic) IBOutlet UIImageView *avatorImageVIew;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *companyLabel;
@property (weak, nonatomic) IBOutlet UILabel *jobLabel;
@property (weak, nonatomic) IBOutlet UILabel *introLabel;
@property (weak, nonatomic) IBOutlet UILabel *focusAreaLabel;

@end

@implementation BYInvestorCell

- (void)awakeFromNib {
    // Initialization code
}

- (CGFloat)cellHeight {
    return CGRectGetMaxY(self.focusAreaLabel.frame);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
