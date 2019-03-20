//
//  AAMyImageCell.m
//  AAFinancial
//
//  Created by 王贵彬 on 2019/3/16.
//  Copyright © 2019 CoderWGB. All rights reserved.
//

#import "AAMyImageCell.h"

@interface AAMyImageCell()
@property (weak, nonatomic) IBOutlet UILabel *jifenLabel;
@property (weak, nonatomic) IBOutlet UILabel *couponLaebl;


@end


@implementation AAMyImageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self.jifenLabel moreColorWithAttributeString:@"积分可用" color:RGB(166, 164, 163)];
    [self.couponLaebl moreColorWithAttributeString:@"张可用" color:RGB(166, 164, 163)];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
