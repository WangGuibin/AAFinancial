//
//  AAResetPasswordView.m
//  AAFinancial
//
//  Created by 王贵彬 on 2019/3/17.
//  Copyright © 2019 CoderWGB. All rights reserved.
//

#import "AAResetPasswordView.h"
#import "ViewController.h"

@implementation AAResetPasswordView

- (void)awakeFromNib{
    [super awakeFromNib];
    self.protocolLabel.text = @"同意《普金投资协议》";
    [self.protocolLabel moreColorWithAttributeString:@"同意" color:RGB(179, 175, 178)];
    self.protocolLabel.userInteractionEnabled = YES;
    @weakify(self);
    [self.protocolLabel addTapActionWithBlock:^(UIGestureRecognizer * _Nullable gestureRecoginzer) {
       @strongify(self);
        ViewController *privacyVC = [[ViewController alloc] init];
        privacyVC.isPrivacy = YES;
        [self.viewController.navigationController pushViewController: privacyVC animated:YES];
    }];
}

- (IBAction)agreeProtocolAction:(UIButton *)sender {
    sender.selected = !sender.selected;
}

- (IBAction)getCodeAction:(id)sender {
    if (self.phoneTF.text.length != 11) {
        [SVProgressHUD showErrorWithStatus:@"请填写正确的手机号码"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [SVProgressHUD dismiss];
        });
        return;
    }    
}


@end
