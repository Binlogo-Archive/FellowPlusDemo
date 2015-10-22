//
//  BYHomeController.m
//  FellowPlusDemo
//
//  Created by brother on 15/10/21.
//  Copyright © 2015年 com.Binboy. All rights reserved.
//

#import "BYHomeController.h"
#import "UINavigationBar+Awesome.h"
#import "BYSegmentedControl.h"
#import "BYInvestorCell.h"

@interface BYHomeController ()<UITableViewDataSource, UITableViewDelegate, BYsegmentedControlDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) BYSegmentedControl *segmentedControl;

@end

@implementation BYHomeController

// 懒加载初始化顶部分页栏
- (BYSegmentedControl *)segmentedControl {
    if (!_segmentedControl) {
        _segmentedControl = [[[NSBundle mainBundle] loadNibNamed:@"BYSegmentedControl" owner:nil options:nil] lastObject];
        CGFloat controlW = self.view.frame.size.width;
        CGFloat controlH = 44;
        _segmentedControl.frame = CGRectMake(0, 60, controlW, controlH);
        [self.view addSubview:_segmentedControl];
    }
    return _segmentedControl;
}

- (void)viewDidLoad {
    
    self.segmentedControl.delegate = self; //调用顶部分页栏懒加载，并设置其代理
    
    // 设置TableView初始偏移量
    UIEdgeInsets insets = UIEdgeInsetsMake(44, 0, 0, 0);
    self.tableView.contentInset = insets;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"BYInvestorCell" bundle:nil] forCellReuseIdentifier:@"InvestorCell"];
}

#pragma mark - Segmented Control Delegate
- (void)control:(BYSegmentedControl *)control didSelectedIndex:(NSInteger)selectedIndex {
    NSLog(@"被点击%ld",selectedIndex);
}

#pragma mark - TableView Protocol Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"InvestorCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (indexPath.row % 2 == 0) {
        cell.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.5];
    } else {
        cell.backgroundColor = [UIColor clearColor];
    }

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
}

#pragma mark - ScrollView Delegate Methods
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY > 0) {
        if (offsetY >= 44) {
            [self setNavigationBarTransformProgress:1];
        } else {
            [self setNavigationBarTransformProgress:(offsetY / 44)];
        }
    } else {
        [self setNavigationBarTransformProgress:0];
        self.navigationController.navigationBar.backIndicatorImage = [UIImage new];
    }
}

#pragma mark - Custom Methods
- (void)setNavigationBarTransformProgress:(CGFloat)progress
{
    [self.navigationController.navigationBar lt_setTranslationY:(-44 * progress)];
    [self.navigationController.navigationBar lt_setElementsAlpha:(1-progress)];
    // 设置导航栏跟随
    self.segmentedControl.transform = CGAffineTransformMakeTranslation(0, -88 * progress);
    self.segmentedControl.alpha = 1-progress;

}
// 筛选
- (IBAction)filterRightBarItemClicked:(id)sender {
    NSLog(@"筛选");
}

@end
