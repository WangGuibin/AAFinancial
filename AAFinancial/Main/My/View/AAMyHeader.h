//
//  AAMyHeader.h
//  AAFinancial
//
//  Created by 王贵彬 on 2019/3/16.
//  Copyright © 2019 CoderWGB. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AAMyHeader : UIView

@property (nonatomic,copy) void(^buttonClickActionBlock) (NSInteger index);

@end

NS_ASSUME_NONNULL_END
