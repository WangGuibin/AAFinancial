/* !:
 * @FileName(文件名):  WGBCustomButton.h
 * @ProjectName(工程名):   highLighted
 * @CreateDate(创建日期):  Created by Wangguibin on 16/6/12.
 * @Copyright(版权所有) :   Copyright © 2016年 王贵彬. All rights reserved.
 */

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,WGBCustomButtonType){
    WGBCustomButtonTypeImageTop = 0,
    WGBCustomButtonTypeTitleTop,
    WGBCustomButtonTypeImageLeft,
    WGBCustomButtonTypeTitleLeft,
} ;

IB_DESIGNABLE
@interface WGBCustomButton : UIButton

@property (nonatomic,assign) IBInspectable NSInteger myButtonType;
@property (nonatomic,assign) IBInspectable CGFloat space;
@property (nonatomic,assign) IBInspectable CGFloat   borderWidth;
@property (nonatomic,strong) IBInspectable  UIColor * borderColor;
@property (nonatomic,assign) IBInspectable  BOOL isRadius;
@property (nonatomic,assign) IBInspectable CGFloat  radius;
@property (nonatomic,strong) IBInspectable  UIColor *bgColor;
@property (nonatomic,assign) IBInspectable  BOOL  buttonHighlighted;
@property (nonatomic,strong) IBInspectable  UIColor *selectedBgColor;
@property (nonatomic,strong) IBInspectable  UIColor *normalBgColor;

@end
