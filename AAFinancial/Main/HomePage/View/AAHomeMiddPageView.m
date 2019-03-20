//
//  AAHomePageView.m
//  AAFinancial
//
//  Created by 王贵彬 on 2019/3/15.
//  Copyright © 2019 CoderWGB. All rights reserved.
//

#import "AAHomeMiddPageView.h"


@interface AAHomeMiddPageView()

@property (weak, nonatomic) IBOutlet UILabel *yearRateLabel;

@end

@implementation AAHomeMiddPageView


- (void)awakeFromNib{
    [super awakeFromNib];
    
    [self.yearRateLabel moreColorWithAttributeString:@"15天" color:RGB(230, 83, 99)];
}

- (IBAction)investAction:(UIButton *)sender {
    NSLog(@"%ld",sender.tag);
    [self.viewController skipLoginVC];
}



@end
