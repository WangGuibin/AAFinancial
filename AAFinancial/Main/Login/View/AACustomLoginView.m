//
//  AACustomLoginView.m
//  AAFinancial
//
//  Created by 王贵彬 on 2019/3/17.
//  Copyright © 2019 CoderWGB. All rights reserved.
//

#import "AACustomLoginView.h"



@implementation AACustomLoginView

- (UITextField *)phoneTextField{
    if (!_phoneTextField) {
        _phoneTextField  = [[UITextField  alloc] initWithFrame:CGRectZero];
        _phoneTextField.placeholder = @"手机号";
        _phoneTextField.keyboardType = UIKeyboardTypePhonePad;
        [self addSubview: _phoneTextField];
    }
    return _phoneTextField;
}

- (UITextField *)pwdTextField{
    if (!_pwdTextField) {
        _pwdTextField  = [[UITextField  alloc] initWithFrame:CGRectZero];
        _pwdTextField.placeholder = @"密码";
        _pwdTextField.secureTextEntry = YES;
        [self addSubview: _pwdTextField];
    }
    return _pwdTextField;
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
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.phoneTextField.frame)+5, self.width, 0.5)];;
    line.backgroundColor = RGB(211, 212, 212);
    [self addSubview: line];
    self.pwdTextField.frame = CGRectMake(tfX, CGRectGetMaxY(line.frame)+5, tfW , tfH);
}

@end
