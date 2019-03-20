//
//  AAMyCellModel.h
//  AAFinancial
//
//  Created by 王贵彬 on 2019/3/16.
//  Copyright © 2019 CoderWGB. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,AAMyTableViewCellType) {
    AAMyTableViewCellTypeSigleText = 0,
    AAMyTableViewCellTypeMultiText ,
    AAMyTableViewCellTypeImage
};

@interface AAMyCellModel : NSObject

@property (nonatomic,assign) AAMyTableViewCellType cellType;
@property (nonatomic,strong) UIColor *dotColor; //小圆点的颜色
@property (nonatomic,strong) UIColor *rightTextColor; //右边文本的颜色
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *subText;
@property (nonatomic,copy) NSString *rightText;

@end

