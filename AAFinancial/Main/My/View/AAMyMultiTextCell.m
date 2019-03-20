//
//  AAMyMultiTextCell.m
//  AAFinancial
//
//  Created by 王贵彬 on 2019/3/16.
//  Copyright © 2019 CoderWGB. All rights reserved.
//

#import "AAMyMultiTextCell.h"


@interface AAMyMultiTextCell()
@property (weak, nonatomic) IBOutlet UIButton *dotBtn;

@property (weak, nonatomic) IBOutlet UILabel *itemLabel;
@property (weak, nonatomic) IBOutlet UILabel *subItemLabel;
@property (weak, nonatomic) IBOutlet UILabel *rightLabel;

@end

@implementation AAMyMultiTextCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setCellModel:(AAMyCellModel *)cellModel{
    _cellModel = cellModel;
    self.dotBtn.backgroundColor = cellModel.dotColor;
    self.itemLabel.text = cellModel.name;
    self.subItemLabel.text = cellModel.subText;
    self.rightLabel.text = cellModel.rightText;
    self.rightLabel.textColor = cellModel.rightTextColor;
}


@end
