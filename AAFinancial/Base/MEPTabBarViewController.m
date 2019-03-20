//
//  MEPTabBarViewController.m
//  MonoEnglishParty
//
//  Created by CoderWGB on 2018/12/4.
//  Copyright © 2018 CoderWGB. All rights reserved.
//

#import "MEPTabBarViewController.h"
#import "MEPNavigationController.h"

#import "AAHomePageViewController.h"
#import "AAFinancialViewController.h"
#import "AAMyProfileViewController.h"

@interface MEPTabBarViewController ()


@end

@implementation MEPTabBarViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self createTabSubViewControllers];
    self.tabBar.tintColor = kRedBagColor;
    self.tabBar.backgroundColor = kBgColor;
//    [self.tabBar setBackgroundImage: [[UIImage imageNamed:@"tabbar_bg"] imageWithTintColor:kBgColor]];
    //去掉tabBar顶部线条
//    [UITabBar appearance].clipsToBounds = YES;
}

- (void)createTabSubViewControllers{
    AAHomePageViewController *homeVC = [[AAHomePageViewController alloc] init];
    [self createNavgationViewControllerWithSubViewController: homeVC title: @"首页" image:@"Home_Normal" selectedImage:@"Home_ico_Normal"];

    AAFinancialViewController *financialVC = [[AAFinancialViewController alloc] init];
    [self createNavgationViewControllerWithSubViewController: financialVC title: @"理财" image:@"financia_Normal" selectedImage:@"financial_ico_Normal"];

    AAMyProfileViewController *myVC = [[AAMyProfileViewController alloc] init];
    [self createNavgationViewControllerWithSubViewController: myVC title: @"我的" image:@"account_Normal" selectedImage:@"account_ico_Normal"];
}

- (void )createNavgationViewControllerWithSubViewController:(UIViewController *)subVC
                                                      title:(NSString *)title
                                                      image:(NSString *)image
                                              selectedImage:(NSString *)selectedImage{
    MEPNavigationController *wgbNavVC = [[MEPNavigationController alloc] initWithRootViewController: subVC];
    subVC.navigationItem.title = title;
    subVC.tabBarItem.title = title;
    subVC.tabBarItem.image = [UIImage imageNamed: image];
    subVC.tabBarItem.selectedImage = [UIImage imageNamed: selectedImage];
    [self addChildViewController: wgbNavVC];
}

@end
