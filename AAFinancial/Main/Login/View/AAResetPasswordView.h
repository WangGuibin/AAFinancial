//
//  AAResetPasswordView.h
//  AAFinancial
//
//  Created by 王贵彬 on 2019/3/17.
//  Copyright © 2019 CoderWGB. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AAResetPasswordView : UIView

@property (weak, nonatomic) IBOutlet UITextField *phoneTF;
@property (weak, nonatomic) IBOutlet UITextField *codeTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
@property (weak, nonatomic) IBOutlet UITextField *againPwdTF;
@property (weak, nonatomic) IBOutlet UILabel *protocolLabel;

@end

NS_ASSUME_NONNULL_END
