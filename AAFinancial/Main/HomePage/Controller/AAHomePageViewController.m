//
//  AAHomePageViewController.m
//  AAFinancial
//
//  Created by CoderWGB on 2019/3/15.
//  Copyright © 2019 CoderWGB. All rights reserved.
//

#import "AAHomePageViewController.h"
#import "ViewController.h"
#import "AAHomeMiddPageView.h"

@interface AAHomePageViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;

@end


@implementation AAHomePageViewController

- (void)viewDidLoad { 
    [super viewDidLoad];
    self.view.backgroundColor = kBgColor;
    [UIApplication sharedApplication].statusBarHidden = NO;
    [[UIApplication sharedApplication] setStatusBarStyle:(UIStatusBarStyleDefault)];
    [self setup];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (void)setup{
    UIView *footer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KWIDTH, 100)];
    footer.backgroundColor = kBgColor;
    
    //banner
    UIImage *bannerImage = [UIImage imageNamed:@"banner"];
    UIImageView *bannerImageView = [[UIImageView alloc] initWithImage: bannerImage];
    CGFloat sacle = bannerImage.size.height/bannerImage.size.width;
    CGFloat bannerW = KWIDTH;
    CGFloat bannerH = bannerW*sacle;
    bannerImageView.frame = CGRectMake(0, 0, bannerW , bannerH);
    [footer addSubview: bannerImageView];
    bannerImageView.userInteractionEnabled = YES;
    [bannerImageView addTapActionWithBlock:^(UIGestureRecognizer * _Nullable gestureRecoginzer) {
//        ViewController *aboutUSVC = [[ViewController alloc] init];
//        [self.navigationController pushViewController: aboutUSVC animated:YES];
        [self skipLoginVC];

    }];
    
    CGFloat screenScale = KWIDTH/375.0;
    CGFloat homeHeight = 650 * screenScale;
    UIView *homePageBg = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(bannerImageView.frame), KWIDTH , homeHeight)];
    homePageBg.backgroundColor = kBgColor;
    AAHomeMiddPageView *homePageView = [AAHomeMiddPageView fromXIB];
    homePageView.frame = homePageBg.bounds;
    [homePageBg addSubview: homePageView];
    [footer addSubview: homePageBg];
    
    footer.height = CGRectGetMaxY(homePageBg.frame)+15;
    self.tableView.tableFooterView = footer;
    [self.tableView reloadData];
}


#pragma mark - 实现UITableView代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *indexCell = [NSString stringWithFormat:@"%ld%ld",(long)indexPath.row,(long)indexPath.section];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: indexCell];
    if (!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indexCell];
    }
    return cell;
}


- (UITableView *)tableView{
    if (!_tableView){
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KWIDTH, KHIGHT - kTabBarHeight) style:(UITableViewStylePlain)];
        _tableView.backgroundColor = kBgColor;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.rowHeight = 50;
        _tableView.sectionHeaderHeight = 10;
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KWIDTH, 10)];
        adjustsScrollViewInsets_NO(_tableView, self);
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

@end
