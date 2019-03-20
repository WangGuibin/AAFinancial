//
//  MBPTopLevelNavgationBar.m
//  MBP-Pro
//
//  Created by CoderWGB on 2018/7/11.
//  Copyright © 2018年 DoubleMonkeyTechnology. All rights reserved.
//

#import "MBPTopLevelNavgationBar.h"

@interface MBPTopLevelNavgationBar()

@property (nonatomic,strong) UILabel *titleLabel;

@end

@implementation MBPTopLevelNavgationBar

- (UIImageView *)bgImageView{
    if (!_bgImageView) {
        _bgImageView = [[UIImageView alloc] init];
        [self addSubview: _bgImageView];
    }
    return _bgImageView;
}

- (UIButton *)leftButton{
    if (!_leftButton) {
        _leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_leftButton addTarget:self action:@selector(leftButtonClickAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview: _leftButton];
    }
    return _leftButton;
}

- (UIButton *)rightButton{
    if (!_rightButton) {
        _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_rightButton addTarget:self action:@selector(rightButtonClickAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview: _rightButton];
    }
    return _rightButton;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_titleLabel];
    }
    return _titleLabel;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self initConfig];
        [self setup];
    }
    return self;
}

- (void)initConfig{
    self.titleTextColor = [UIColor whiteColor];
    self.bgImageView.image = [UIImage imageNamed:@"navigation_bar"];
    self.titleLabel.font = [UIFont systemFontOfSize:18.0f];
    [self.leftButton setBackgroundImage:[UIImage imageNamed:@"nav_home"] forState:UIControlStateNormal];
    [self.rightButton setBackgroundImage:[UIImage imageNamed:@"nav_photo"] forState:UIControlStateNormal];
}

- (void)setup{
    [self insertSubview:self.bgImageView atIndex:0]; //确保放在最底部
    self.bgImageView.frame = self.bounds;

    CGFloat buttonX = 12;
    CGFloat centerY = kStatusBarHeight+ (kNavBarHeight - kStatusBarHeight)/2.0 ;
    CGFloat buttonW = 25;
    CGFloat buttonH = buttonW;
    CGFloat margin = 12;
    self.leftButton.frame = CGRectMake(buttonX, 0, buttonW , buttonH);
    self.leftButton.centerY = centerY;
    
    CGFloat textW = KWIDTH - margin - buttonX - buttonW*2;
    CGFloat textH = 30;
    self.titleLabel.frame = CGRectMake(0, 0, textW , textH);
    self.titleLabel.centerY = centerY;
    self.titleLabel.centerX = KWIDTH/2.0f;
    
    CGFloat rightButtonX = KWIDTH - margin - buttonW;
    self.rightButton.frame = CGRectMake(rightButtonX, 0, buttonW , buttonH);
    self.rightButton.centerY = centerY;

}

- (void)setNavgationBackgroundImage:(UIImage *)navgationBackgroundImage{
    _navgationBackgroundImage = navgationBackgroundImage;
    self.bgImageView.image = navgationBackgroundImage;
}

- (void)setTitleText:(NSString *)titleText{
    _titleText = titleText;
    self.titleLabel.text = titleText;
}

- (void)setTitleTextFont:(UIFont *)titleTextFont{
    _titleTextFont = titleTextFont;
    self.titleLabel.font = titleTextFont;
}

- (void)setTitleTextColor:(UIColor *)titleTextColor{
    _titleTextColor = titleTextColor;
    self.titleLabel.textColor = titleTextColor;
}

- (void)setLeftButtonImage:(UIImage *)leftButtonImage{
    _leftButtonImage = leftButtonImage;
    [self.leftButton setImage: leftButtonImage forState: UIControlStateNormal];
}

- (void)setRightButtonImage:(UIImage *)rightButtonImage{
    _rightButtonImage = rightButtonImage;
    [self.rightButton setImage: rightButtonImage forState: UIControlStateNormal];
}

#pragma mark- 👈左边按钮点击
-(void)leftButtonClickAction:(UIButton *)sender{
    if (self.leftBlock) {
        self.leftBlock();
        return ;
    }
    if (self.leftButtonClickBlock) {
        self.leftButtonClickBlock(sender);
        return;
    }
    if (self.delegate&& [self.delegate respondsToSelector:@selector(mbp_navgationBar:clickLeftButton:)]) {
        [self.delegate mbp_navgationBar:self clickLeftButton: sender];
        return;
    }
}

#pragma mark- 👉右边按钮点击
- (void)rightButtonClickAction:(UIButton *)sender{
    if (self.rightBlock) {
        self.rightBlock();
        return ;
    }
    if (self.rightButtonClickBlock) {
        self.rightButtonClickBlock(sender);
        return;
    }
    if (self.delegate&& [self.delegate respondsToSelector:@selector(mbp_navgationBar:clickRightButton:)]) {
        [self.delegate mbp_navgationBar:self clickRightButton: sender];
        return;
    }
}

@end
