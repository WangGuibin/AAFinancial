//
//  AACustomRegisterView.m
//  AAFinancial
//
//  Created by 王贵彬 on 2019/3/17.
//  Copyright © 2019 CoderWGB. All rights reserved.
//

#import "AACustomRegisterView.h"

@implementation AACustomRegisterView

- (UITextField *)phoneTextField{
    if (!_phoneTextField) {
        _phoneTextField  = [[UITextField  alloc] initWithFrame:CGRectZero];
        _phoneTextField.placeholder = @"手机号";
        _phoneTextField.keyboardType = UIKeyboardTypePhonePad;
        [self addSubview: _phoneTextField];
    }
    return _phoneTextField;
}

- (UITextField *)verfiTextField{
    if (!_verfiTextField) {
        _verfiTextField  = [[UITextField  alloc] initWithFrame:CGRectZero];
        _verfiTextField.placeholder = @"验证码";
        _verfiTextField.keyboardType = UIKeyboardTypeNumberPad;
        [self addSubview: _verfiTextField];
    }
    return _verfiTextField;
}


- (UITextField *)pwdTextField{
    if (!_pwdTextField) {
        _pwdTextField  = [[UITextField  alloc] initWithFrame:CGRectZero];
        _pwdTextField.placeholder = @"登录密码";
        _pwdTextField.secureTextEntry = YES;
        [self addSubview: _pwdTextField];
    }
    return _pwdTextField;
}

- (UITextField *)recommendCodeTextField{
    if (!_recommendCodeTextField) {
        _recommendCodeTextField  = [[UITextField  alloc] initWithFrame:CGRectZero];
        _recommendCodeTextField.placeholder = @"推荐人手机号或邀请码 (选填)";
        _recommendCodeTextField.keyboardType = UIKeyboardTypePhonePad;
        [self addSubview: _recommendCodeTextField];
    }
    return _recommendCodeTextField;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = KWhiteColor;
        ViewRadius(self, 5.0f);
        [self setup];
    }
    return self;
}

- (void)setup{
    CGFloat tfX = 10;
    CGFloat tfY = 5;
    CGFloat tfW = self.width - 20;
    CGFloat tfH = 30;
    self.phoneTextField.frame = CGRectMake(tfX, tfY, tfW , tfH);
    UIView *phoneLine = [self addLineWithOffsetY:CGRectGetMaxY(self.phoneTextField.frame)+5];
    [self addSubview: phoneLine];
    
    CGFloat codeW = (self.width *0.66) - 20;
    self.verfiTextField.frame = CGRectMake(tfX, CGRectGetMaxY(phoneLine.frame)+5, codeW , tfH);
    UIView *fengeLine = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.verfiTextField.frame)+10, 0, 0.5 , self.verfiTextField.height + 5)];
    fengeLine.centerY = self.verfiTextField.centerY;
    fengeLine.backgroundColor = RGB(211, 212, 212);
    [self addSubview: fengeLine];
    
    CGFloat btnW = self.width - CGRectGetMaxX(fengeLine.frame);
    UIButton *getCodeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    getCodeBtn.frame = CGRectMake(CGRectGetMaxX(fengeLine.frame), 0, btnW , tfH);
    getCodeBtn.centerY = self.verfiTextField.centerY;
    getCodeBtn.titleLabel.font = kFont(13);
    [getCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [getCodeBtn setTitleColor:RGB(192, 75, 88) forState:UIControlStateNormal];
    [getCodeBtn addTarget:self action:@selector(getCodeAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview: getCodeBtn];
    
    UIView *codeLine = [self addLineWithOffsetY: CGRectGetMaxY(self.verfiTextField.frame)+5];
    [self addSubview: codeLine];
    
    self.pwdTextField.frame = CGRectMake(tfX, CGRectGetMaxY(codeLine.frame)+5, tfW , tfH);
    
    UIView *pwdLine = [self addLineWithOffsetY: CGRectGetMaxY(self.pwdTextField.frame)+5];
    [self addSubview: pwdLine];
    
    self.recommendCodeTextField.frame = CGRectMake(tfX, CGRectGetMaxY(pwdLine.frame)+5, tfW , tfH);
    self.height = CGRectGetMaxY(self.recommendCodeTextField.frame) + 5;
}


- (UIView *)addLineWithOffsetY:(CGFloat)offsetY {
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, offsetY - 0.5, self.width, 0.5)];;
    line.backgroundColor = RGB(211, 212, 212);
    return line;
}


///MARK:- 获取验证码
- (void)getCodeAction:(UIButton *)sender{
    if (self.phoneTextField.text.length != 11) {
        [SVProgressHUD showErrorWithStatus:@"请填写正确的手机号码"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [SVProgressHUD dismiss];
        });
    }
    
}

@end
