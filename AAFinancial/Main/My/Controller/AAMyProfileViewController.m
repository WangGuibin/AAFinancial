//
//  AAMyProfileViewController.m
//  AAFinancial
//
//  Created by CoderWGB on 2019/3/15.
//  Copyright © 2019 CoderWGB. All rights reserved.
//

#import "AAMyProfileViewController.h"
#import "AAMyNavgationBar.h"
#import "AAMyHeader.h"
#import "AASingleTextCell.h"
#import "AAMyCellModel.h"
#import "AAMyImageCell.h"
#import "AAMyMultiTextCell.h"
#import "ViewController.h"

@interface AAMyProfileViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) AAMyNavgationBar *navBar ;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataSource;

@end

@implementation AAMyProfileViewController

///MARK:-  lazy load
- (UITableView *)tableView{
    if (!_tableView){
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kNavBarHeight, KWIDTH, KHIGHT-kNavBarHeight-kTabBarHeight) style:(UITableViewStylePlain)];
        _tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"矩形-2_Normal"]];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.rowHeight = 110;
        _tableView.sectionHeaderHeight = 10;
        UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KWIDTH, 215)];
        AAMyHeader *headerView = [AAMyHeader fromXIB];
        headerView.frame = header.bounds;
        [header addSubview: headerView];
        [headerView setButtonClickActionBlock:^(NSInteger index) {
            //跳转登录
            [self skipLoginVC];
        }];
        self.tableView.tableHeaderView = header;
        
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([AASingleTextCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([AASingleTextCell class])];
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([AAMyImageCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([AAMyImageCell class])];
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([AAMyMultiTextCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([AAMyMultiTextCell class])];

        UIView *footer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KWIDTH, 260)];
        footer.backgroundColor = kBgColor;
        _tableView.tableFooterView = footer;
        adjustsScrollViewInsets_NO(_tableView, self);
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (NSMutableArray *)dataSource
{
    if (_dataSource==nil) {
        _dataSource =[[NSMutableArray alloc]init];
    }
    return _dataSource;
}

- (AAMyNavgationBar *)navBar{
    if (!_navBar) {
        _navBar = [AAMyNavgationBar fromXIB];
        _navBar.frame = CGRectMake(0, 0, KWIDTH , kNavBarHeight);
    }
    return _navBar;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kBgColor;
    [self createLoacalDataSource];
    [self setup];

    @weakify(self);
    [self.navBar setClickActionBlock:^(NSInteger index) {
       @strongify(self);
        //跳转登录
        [self skipLoginVC];
    }];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}


///MARK:- 创造cellModel数据源
- (void)createLoacalDataSource{
    
    AAMyCellModel *fuli = [AAMyCellModel new];
    fuli.cellType = AAMyTableViewCellTypeSigleText;
    fuli.name = @"福利专区";
    fuli.dotColor = RGB(115, 168, 239);
    [self.dataSource addObject: fuli];
    
    AAMyCellModel *coupon = [AAMyCellModel new];
    coupon.cellType = AAMyTableViewCellTypeImage;
    [self.dataSource addObject: coupon];

    AAMyCellModel *rili = [AAMyCellModel new];
    rili.cellType = AAMyTableViewCellTypeMultiText;
    rili.name = @"回款日历";
    rili.subText = @"今日剩余回款0.00元";
    rili.rightText = @"0.00";
    rili.rightTextColor = RGB(215, 68, 98);
    rili.dotColor = RGB(152, 143, 158);
    [self.dataSource addObject: rili];
    
    AAMyCellModel *record = [AAMyCellModel new];
    record.cellType = AAMyTableViewCellTypeMultiText;
    record.name = @"理财记录";
    record.subText = @"我的投资记录当前共0笔";
    record.rightText = @"0笔";
    record.rightTextColor = RGB(19, 36, 49);
    record.dotColor = RGB(115, 168, 239);
    [self.dataSource addObject: record];

    AAMyCellModel *onlineKefu = [AAMyCellModel new];
    onlineKefu.cellType = AAMyTableViewCellTypeSigleText;
    onlineKefu.name = @"在线客服";
    onlineKefu.dotColor = RGB(151, 152, 155);
    [self.dataSource addObject: onlineKefu];

    AAMyCellModel *advice = [AAMyCellModel new];
    advice.cellType = AAMyTableViewCellTypeSigleText;
    advice.name = @"意见反馈";
    advice.dotColor = RGB(115, 168, 239);
    [self.dataSource addObject: advice];

    AAMyCellModel *aboutUs = [AAMyCellModel new];
    aboutUs.cellType = AAMyTableViewCellTypeSigleText;
    aboutUs.name = @"关于我们";
    aboutUs.dotColor = RGB(152, 143, 158);
    [self.dataSource addObject: aboutUs];

}

- (void)setup{
    [self.view addSubview: self.navBar];
    [self.tableView reloadData];
}

#pragma mark -  UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AAMyCellModel *cellModel = self.dataSource[indexPath.row];
    if (cellModel.cellType == AAMyTableViewCellTypeSigleText) {
        AASingleTextCell *cell = [tableView dequeueReusableCellWithIdentifier: NSStringFromClass([AASingleTextCell class])];
        cell.cellModel = cellModel;
        return cell;
    }else if (cellModel.cellType == AAMyTableViewCellTypeMultiText){
        AAMyMultiTextCell *cell = [tableView dequeueReusableCellWithIdentifier: NSStringFromClass([AAMyMultiTextCell class])];
        cell.cellModel = cellModel;
        return cell;
    }else{
        AAMyImageCell *cell = [tableView dequeueReusableCellWithIdentifier: NSStringFromClass([AAMyImageCell class])];
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    AAMyCellModel *cellModel = self.dataSource[indexPath.row];
    switch (cellModel.cellType) {
        case AAMyTableViewCellTypeSigleText:{
            return 50;
        }
            break;
        case AAMyTableViewCellTypeMultiText:{
            return 80;
        }
            break;
        case AAMyTableViewCellTypeImage:{
            CGFloat scale = 276.0/670.0;
            CGFloat imgW = (KWIDTH - 15*3)/2.0;
            CGFloat imgH = imgW *scale;
            return  imgH + 30;
        }
            break;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    AAMyCellModel *cellModel = self.dataSource[indexPath.row];
    if ([cellModel.name isEqualToString:@"关于我们"]) {
        ViewController *aboutUSVC = [[ViewController alloc] init];
        [self.navigationController pushViewController: aboutUSVC animated:YES];
    }else{
        [self skipLoginVC];
    }
}

- (void)viewDidLayoutSubviews
{
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
    }
    
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableView setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

///MARK: - 设置tableview的背景
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.tableView) {
        CGPoint offset = self.tableView.contentOffset;
        if (offset.y > 215) {
            _tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage createImageWithColor:kBgColor]];
        }else{
            _tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"矩形-2_Normal"]];
        }
    }
}



@end 
