//
//  AALoginRegisterButton.m
//  AAFinancial
//
//  Created by 王贵彬 on 2019/3/17.
//  Copyright © 2019 CoderWGB. All rights reserved.
//

#import "AALoginRegisterButton.h"

@implementation AALoginRegisterButton

+ (instancetype)buttonWithType:(UIButtonType)buttonType{
    AALoginRegisterButton *button  = [super buttonWithType: buttonType];
    button.titleLabel.font = KFontSize(15);
    [button setBackgroundImage:[UIImage createImageWithColor:KWhiteColor] forState:UIControlStateSelected];
    [button setBackgroundImage:[UIImage createImageWithColor:[UIColor clearColor]] forState:UIControlStateNormal];
    [button setTitleColor: KWhiteColor forState:UIControlStateNormal];
    [button setTitleColor: RGB(214, 59, 96) forState:UIControlStateSelected];
    return button;
}

@end

