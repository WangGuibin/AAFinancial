//
//  UIViewController+AAExtra.m
//  AAFinancial
//
//  Created by 王贵彬 on 2019/3/17.
//  Copyright © 2019 CoderWGB. All rights reserved.
//

#import "UIViewController+AAExtra.h"
#import "AALoginViewController.h"

@implementation UIViewController (AAExtra)

///MARK: - 跳转登录
- (void)skipLoginVC{
    AALoginViewController *loginVC  = [[AALoginViewController alloc] init];
    UINavigationController *loginNavVC = [[UINavigationController alloc] initWithRootViewController:loginVC];
    [self presentViewController:loginNavVC animated:YES completion: nil];
}

@end
