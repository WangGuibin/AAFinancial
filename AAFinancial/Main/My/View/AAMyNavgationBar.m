//
//  AAMyNavgationBar.m
//  AAFinancial
//
//  Created by 王贵彬 on 2019/3/16.
//  Copyright © 2019 CoderWGB. All rights reserved.
//

#import "AAMyNavgationBar.h"

@implementation AAMyNavgationBar
- (IBAction)loginAction:(UIButton *)sender {
    NSInteger index = sender.tag;
    !self.clickActionBlock? : self.clickActionBlock(index);
}


@end
