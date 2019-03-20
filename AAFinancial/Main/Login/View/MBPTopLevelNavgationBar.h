//
//  MBPTopLevelNavgationBar.h
//  MBP-Pro
//
//  Created by CoderWGB on 2018/7/11.
//  Copyright © 2018年 DoubleMonkeyTechnology. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MBPTopLevelNavgationBar;
@protocol MBPTopLevelNavgationBarDelegate<NSObject>

@optional
- (void)mbp_navgationBar:(MBPTopLevelNavgationBar *)navgationBar clickLeftButton:(UIButton *)leftButton;
- (void)mbp_navgationBar:(MBPTopLevelNavgationBar *)navgationBar clickRightButton:(UIButton *)rightButton;

@end


@interface MBPTopLevelNavgationBar : UIView

//代理对象
@property (nonatomic,weak) id<MBPTopLevelNavgationBarDelegate> delegate;
//背景图片 不经常修改的话 直接在.m里设置即可
@property (nonatomic,strong) UIImage *navgationBackgroundImage;
//背景视图
@property (nonatomic,strong) UIImageView *bgImageView;

// 标题
@property (nonatomic,copy) NSString *titleText;
// 标题颜色 默认白色
@property (nonatomic,strong) UIColor *titleTextColor;
//标题的字体 默认18
@property (nonatomic,strong) UIFont *titleTextFont;

//左边按钮
@property (nonatomic,strong) UIButton *leftButton;
//设置左边按钮图片 默认只有一种Normal状态的 需要设置其他的交互事件的图片 则需设置button对象的属性即可
@property (nonatomic,strong) UIImage *leftButtonImage;
@property (nonatomic,copy) dispatch_block_t leftBlock; //不带参数的block
@property (nonatomic,copy) void (^leftButtonClickBlock)(UIButton *sender);//带button参数的block

// 右边按钮 (与leftButton一致)
@property (nonatomic,strong) UIButton *rightButton;
//设置右边按钮图片(与leftButton一致)
@property (nonatomic,strong) UIImage *rightButtonImage;
@property (nonatomic,copy) dispatch_block_t rightBlock;
@property (nonatomic,copy) void (^rightButtonClickBlock)(UIButton *sender);


@end
