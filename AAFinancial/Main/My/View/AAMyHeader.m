//
//  AAMyHeader.m
//  AAFinancial
//
//  Created by 王贵彬 on 2019/3/16.
//  Copyright © 2019 CoderWGB. All rights reserved.
//

#import "AAMyHeader.h"

@implementation AAMyHeader

- (IBAction)loginAction:(UIButton *)sender {
    NSInteger index = sender.tag;
    !self.buttonClickActionBlock? : self.buttonClickActionBlock(index);
}
@end
