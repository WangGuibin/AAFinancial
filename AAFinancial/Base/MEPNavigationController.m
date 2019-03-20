//
//  MEPNavigationController.m
//  MonoEnglishParty
//
//  Created by CoderWGB on 2018/12/4.
//  Copyright © 2018 CoderWGB. All rights reserved.
//

#import "MEPNavigationController.h"

@interface MEPNavigationController ()

@end

@implementation MEPNavigationController

- (UIViewController *)childViewControllerForStatusBarStyle{
    return self.topViewController;
}
// 假如需要单独设置 某个控制器状态栏的颜色 在该控制器重写这个方法即可
//- (UIStatusBarStyle)preferredStatusBarStyle{
//    return UIStatusBarStyleDefault;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UINavigationBar * navigationBar = [UINavigationBar appearance];
    navigationBar.backgroundColor = KWhiteColor;
    navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : kTextColor, NSFontAttributeName : KFontSize(18)};
    navigationBar.shadowImage = [UIImage createImageWithColor:KWhiteColor];
    navigationBar.translucent = NO;

//    navigationBar.barTintColor = kTextColor;
//    [navigationBar setBackgroundImage: [UIImage createImageWithColor: kNavgationBarColor]  forBarMetrics:UIBarMetricsDefault];
//    navigationBar.shadowImage = [UIImage createImageWithColor:KWhiteColor];
//
//    navigationBar.tintColor = kTextColor;
}

/**
 * 可以在这个方法中拦截所有push进来的控制器
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count > 0) { // 如果push进来的不是第一个控制器
        UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        leftButton.frame = CGRectMake(0, 0, 44, 44);
        leftButton.imageEdgeInsets = UIEdgeInsetsMake(0, -15, 0, 0);
        UIImage *leftButtonImg = [UIImage imageNamed:@"nav_back_black"];
        [leftButton setImage: leftButtonImg
                    forState:UIControlStateNormal];
        [leftButton addTarget:self action:@selector(popLastViewController) forControlEvents:UIControlEventTouchUpInside];
        // 修改导航栏左边的item
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
        // 隐藏tabbar
        viewController.hidesBottomBarWhenPushed = YES;
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    }else{
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    }
    
    // 这句super的push要放在后面, 让viewController可以覆盖上面设置的leftBarButtonItem
    [super pushViewController:viewController animated:animated];
    
    //解决iPhoneX
    // push页面时tabbar上移问题
    CGRect tabBarFrame = self.tabBarController.tabBar.frame;
    if (isIphoneX()) {
        if (@available(iOS 11.0, *)){
            tabBarFrame.origin.y = KHIGHT - tabBarFrame.size.height - kWindow.safeAreaInsets.bottom;
        }
    }else{
        tabBarFrame.origin.y = KHIGHT - tabBarFrame.size.height ;
    }
    self.tabBarController.tabBar.frame = tabBarFrame;
}

- (void)popLastViewController{
    [self popViewControllerAnimated: YES];
}

@end
