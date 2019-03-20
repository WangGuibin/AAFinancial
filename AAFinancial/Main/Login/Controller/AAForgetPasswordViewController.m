//
//  AAForgetPasswordViewController.m
//  AAFinancial
//
//  Created by 王贵彬 on 2019/3/17.
//  Copyright © 2019 CoderWGB. All rights reserved.
//

#import "AAForgetPasswordViewController.h"
#import "MBPTopLevelNavgationBar.h"
#import "AAResetPasswordView.h"

@interface AAForgetPasswordViewController ()

@property (nonatomic,strong) AAResetPasswordView *resetPwdView;

@end


@implementation AAForgetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kBgColor;
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
    MBPTopLevelNavgationBar *navBar = [[MBPTopLevelNavgationBar alloc] initWithFrame:CGRectMake(0, 0, KWIDTH , kNavBarHeight)];
    navBar.leftButtonImage = [[UIImage imageNamed:@"forget_nav_back"] imageWithTintColor:RGB(251, 222, 169)];
    navBar.navgationBackgroundImage = [UIImage imageNamed:@"Shopping Mall_bg_Normal"];
    navBar.titleText = @"重置登录密码";
    navBar.titleTextColor = RGB(251, 222, 169);
    navBar.titleTextFont = KFontSize(18);
    [navBar setLeftBlock:^{
        [self.navigationController popViewControllerAnimated:YES];
    }];
    [self.view addSubview: navBar];
    
    UIView *resetBgView  = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(navBar.frame), KWIDTH, 300)];
    resetBgView.backgroundColor = kBgColor;
    AAResetPasswordView *resetPwdView = [AAResetPasswordView fromXIB];
    resetPwdView.frame = resetBgView.bounds;
    [resetBgView addSubview: resetPwdView];
    [self.view addSubview: resetBgView];
    self.resetPwdView = resetPwdView;
    
    UIButton *completeBtn  = [UIButton buttonWithType:UIButtonTypeCustom];
    [completeBtn setTitle:@"完成" forState:UIControlStateNormal];
    [completeBtn setBackgroundImage:kImageNamed(@"bonus_exchange_btn") forState:UIControlStateNormal];
    completeBtn.titleLabel.font = KFontSize(15);
    completeBtn.frame = CGRectMake(0, KHIGHT-44, KWIDTH, 44);
    [completeBtn addTarget:self action:@selector(completeAction) forControlEvents:  UIControlEventTouchUpInside];
    completeBtn.y -= kBottomHeight;
    [self.view addSubview: completeBtn];
    
}

///MARK:- 完成
- (void)completeAction{
    if (self.resetPwdView.phoneTF.text.length != 11) {
        [SVProgressHUD showErrorWithStatus:@"请填写正确的手机号码"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [SVProgressHUD dismiss];
        });
        return;
    }

    if (self.resetPwdView.codeTF.text.length < 4) {
        [SVProgressHUD showErrorWithStatus:@"请填写验证码"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [SVProgressHUD dismiss];
        });
        return;
    }
    
    if (self.resetPwdView.passwordTF.text.length == 0) {
        [SVProgressHUD showErrorWithStatus:@"请填写新密码"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [SVProgressHUD dismiss];
        });
        return;
    }
    if (self.resetPwdView.againPwdTF.text.length == 0) {
        [SVProgressHUD showErrorWithStatus:@"请再次填写新密码"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [SVProgressHUD dismiss];
        });
        return;
    }
    if (![self.resetPwdView.passwordTF.text isEqualToString:self.resetPwdView.againPwdTF.text]) {
        [SVProgressHUD showErrorWithStatus:@"两次填写密码不一致,请重新填写"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [SVProgressHUD dismiss];
        });
        return;
    }
    
}

@end
