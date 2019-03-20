//
//  AALoginViewController.m
//  AAFinancial
//
//  Created by CoderWGB on 2019/3/15.
//  Copyright © 2019 CoderWGB. All rights reserved.
//

#import "AALoginViewController.h"
#import "AALoginRegisterButton.h"
#import "AACustomLoginView.h"
#import "AACustomRegisterView.h"
#import "AAForgetPasswordViewController.h"

@interface AALoginViewController ()

@property (nonatomic,strong) AALoginRegisterButton *tempButton;
@property (nonatomic,strong) UIImageView *indexView ;
@property (nonatomic,strong) AACustomLoginView *loginView;
@property (nonatomic,strong) AACustomRegisterView *registerView;
@property (nonatomic,strong) UIButton *forgetPwdBtn;
@property (nonatomic,strong) UIButton *confirmBtn;

@end

@implementation AALoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = kBgColor;
    UIImageView *bgView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    bgView.image = [UIImage imageNamed:@"Register login_background_Normal"];
    [self.view addSubview: bgView];
    [self.view insertSubview:bgView atIndex:0];
 
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
    //关闭按钮
    UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    closeBtn.frame = CGRectMake(20, kStatusBarHeight+5, 44 , 44);
    [closeBtn setImage: [UIImage imageNamed:@"close"] forState:UIControlStateNormal];
    [[closeBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    [self.view addSubview: closeBtn];
    
    //logo
    UIImage *logoImg = [UIImage imageNamed:@"icon_logo_Normal"];
    UIImageView *logoView = [[UIImageView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(closeBtn.frame)+15, logoImg.size.width, logoImg.size.height)];
    logoView.centerX = KWIDTH/2.0;
    logoView.image = logoImg;
    [self.view addSubview: logoView];
    
    //登录 - 注册按钮
    CGFloat loginW = 60;
    CGFloat loginH = 30;
    CGFloat loginY = CGRectGetMaxY(logoView.frame) + 20;
    CGFloat loginX = logoView.x - loginW;
    AALoginRegisterButton *loginBtn  = [AALoginRegisterButton buttonWithType:UIButtonTypeCustom];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    loginBtn.frame = CGRectMake(loginX, loginY, loginW , loginH);
    loginBtn.tag = 0;
    [loginBtn addTarget:self action:@selector(clickButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    ViewRadius(loginBtn, 15);
    [self.view addSubview: loginBtn];
    
    CGFloat regsiterX = CGRectGetMaxX(logoView.frame);
    AALoginRegisterButton *registerBtn  = [AALoginRegisterButton buttonWithType:UIButtonTypeCustom];
    [registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    registerBtn.tag = 1;
    [registerBtn addTarget:self action:@selector(clickButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    registerBtn.frame = CGRectMake(regsiterX, loginY, loginW , loginH);
    ViewRadius(registerBtn, 15);
    [self.view addSubview: registerBtn];
    
    loginBtn.selected = YES;
    self.tempButton = loginBtn;
    
    //游标小人
    UIImage *indexImg = [UIImage imageNamed:@"icon_angangbaobei_Normal"];
    UIImageView *indexView = [[UIImageView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(loginBtn.frame), indexImg.size.width, indexImg.size.height)];
    indexView.centerX = loginBtn.centerX;
    indexView.image = indexImg;
    [self.view addSubview: indexView];
    self.indexView = indexView;
    
    // 登录的view
    AACustomLoginView *loginView = [[AACustomLoginView alloc] initWithFrame:CGRectMake(30, CGRectGetMaxY(indexView.frame), KWIDTH-60 , 80)];
    [self.view addSubview: loginView];
    self.loginView = loginView;
    
    //忘记密码按钮
    UIButton *forgetPwdBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    forgetPwdBtn.frame = CGRectMake(CGRectGetMaxX(loginView.frame) - 70, CGRectGetMaxY(loginView.frame)+5, 70 , 25);
    forgetPwdBtn.titleLabel.font = kFont(14);
    [forgetPwdBtn setTitle:@"忘记密码?" forState:UIControlStateNormal];
    [[forgetPwdBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        //忘记密码
        AAForgetPasswordViewController *forgetVC = [[AAForgetPasswordViewController alloc] init];
        [self.navigationController pushViewController:forgetVC animated:YES];
    }];
    [self.view addSubview: forgetPwdBtn];
    self.forgetPwdBtn = forgetPwdBtn;
    
    //确认按钮 切换的时候 动画更新其高度
    UIImage *confirmImg = [UIImage imageNamed:@"icon_button1_Normal"];
    CGFloat confirmY = CGRectGetMaxY(loginView.frame) + 30;
    UIButton *confirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    confirmBtn.frame = CGRectMake(0, confirmY, confirmImg.size.width , confirmImg.size.height);
    confirmBtn.centerX = KWIDTH/2.0;
    [confirmBtn setImage: confirmImg forState:UIControlStateNormal];
    [confirmBtn addTarget:self action:@selector(confirmAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: confirmBtn];
    self.confirmBtn = confirmBtn;
    
    //注册的view 先隐藏
    AACustomRegisterView *registerView = [[AACustomRegisterView alloc] initWithFrame:CGRectMake(30, CGRectGetMaxY(indexView.frame), KWIDTH-60, 100)];
    registerView.hidden = YES;
    [self.view addSubview: registerView];
    self.registerView = registerView;
}

///MARK:- 按钮点击事件 切换布局加动画
- (void)clickButtonAction:(AALoginRegisterButton *)sender{
    self.tempButton.selected = NO;
    sender.selected = YES;
    self.tempButton = sender; 

    [UIView animateWithDuration:0.5 animations:^{
        self.indexView.centerX = sender.centerX;
    }];
    
    NSInteger index  = sender.tag;
    if (index == 0) {
        //登录
        [self displayLoginUI];
    }else{
        //注册
        [self displayRegisterUI];
    }
}

- (void)displayLoginUI{
    self.loginView.hidden = NO;
    self.forgetPwdBtn.hidden = NO;
    self.registerView.hidden = YES;
    [UIView animateWithDuration: 0.75 animations:^{
        self.confirmBtn.y =  CGRectGetMaxY(self.loginView.frame) + 30;
    }];
}


- (void)displayRegisterUI{
    self.loginView.hidden = YES;
    self.forgetPwdBtn.hidden = YES;
    self.registerView.hidden = NO;
    [UIView animateWithDuration: 0.75 animations:^{
        self.confirmBtn.y =  CGRectGetMaxY(self.registerView.frame) + 30;
    }];
}

///MARk:- 确认 一些逻辑判断
- (void)confirmAction:(UIButton *)sender{
    NSInteger index  = self.tempButton.tag;
    if (index == 0) {
        if (self.loginView.phoneTextField.text.length != 11) {
            [SVProgressHUD showErrorWithStatus:@"请填写正确的手机号码"];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [SVProgressHUD dismiss];
            });
            return;
        }
        if (self.loginView.pwdTextField.text.length == 0) {
            [SVProgressHUD showErrorWithStatus:@"请填写密码"];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [SVProgressHUD dismiss];
            });
            return;
        }
        
        NSString *phone = self.loginView.phoneTextField.text;
        NSString *pwd = self.loginView.pwdTextField.text;
        if ([phone isEqualToString:@"13058088469"] && [pwd isEqualToString:@"123456"]) {
            [SVProgressHUD showSuccessWithStatus:@"登录成功!"];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [SVProgressHUD dismiss];
            });
//            NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
//            [defaults setBool:YES forKey:@"isLogin"];
//            [defaults synchronize];
        }
        
    }else{
        if (self.registerView.phoneTextField.text.length != 11) {
            [SVProgressHUD showErrorWithStatus:@"请填写正确的手机号码"];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [SVProgressHUD dismiss];
            });
            return;
        }
        if (self.registerView.verfiTextField.text.length == 0) {
            [SVProgressHUD showErrorWithStatus:@"验证码不能为空"];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [SVProgressHUD dismiss];
            });
            return;
        }

        if (self.registerView.pwdTextField.text.length == 0) {
            [SVProgressHUD showErrorWithStatus:@"密码不可为空"];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [SVProgressHUD dismiss];
            });
            return;
        }
    }
    
}

@end
