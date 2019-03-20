//
//  AASingleTextCell.m
//  AAFinancial
//
//  Created by 王贵彬 on 2019/3/16.
//  Copyright © 2019 CoderWGB. All rights reserved.
//

#import "AASingleTextCell.h"

@interface AASingleTextCell()

@property (weak, nonatomic) IBOutlet UIButton *dotBtn;

@property (weak, nonatomic) IBOutlet UILabel *itemLabel;

@end

@implementation AASingleTextCell


- (void)setCellModel:(AAMyCellModel *)cellModel{
    _cellModel = cellModel;
    
    self.dotBtn.backgroundColor = cellModel.dotColor;
    self.itemLabel.text = cellModel.name;
    
}

@end
