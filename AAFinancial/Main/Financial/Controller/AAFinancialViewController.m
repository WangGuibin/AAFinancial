//
//  AAFinancialViewController.m
//  AAFinancial
//
//  Created by CoderWGB on 2019/3/15.
//  Copyright © 2019 CoderWGB. All rights reserved.
//

#import "AAFinancialViewController.h"
#import "AAFinancialCell.h"

@interface AAFinancialViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;

@end

@implementation AAFinancialViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = kBgColor;
    [self.tableView reloadData];
}

#pragma mark -  UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AAFinancialCell *cell = [tableView dequeueReusableCellWithIdentifier: NSStringFromClass([AAFinancialCell class])];
    cell.separatorInset = UIEdgeInsetsMake(0, 15, 0, 0);
    cell.itemTitleLabel.text = [NSString stringWithFormat:@"供应链金融%ld",indexPath.row+1];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 110.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self skipLoginVC];
}

///MARK:-  lazy load
- (UITableView *)tableView{
    if (!_tableView){
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KWIDTH, KHIGHT-kNavBarHeight-kTabBarHeight) style:(UITableViewStylePlain)];
        _tableView.backgroundColor = kBgColor;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.rowHeight = 110;
        _tableView.sectionHeaderHeight = 10;
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([AAFinancialCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([AAFinancialCell class])];
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KWIDTH, 10)];
        adjustsScrollViewInsets_NO(_tableView, self);
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

@end
