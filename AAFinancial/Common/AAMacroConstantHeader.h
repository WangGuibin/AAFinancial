//
//  AAMacroConstantHeader.h
//  AAFinancial
//
//  Created by CoderWGB on 2019/3/15.
//  Copyright © 2019 CoderWGB. All rights reserved.
//

#ifndef AAMacroConstantHeader_h
#define AAMacroConstantHeader_h


///MARK-: 一些便捷的宏

#ifdef DEBUG
//Debug 阶段打印
#define NSLog(FORMAT, ...) {\
NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];\
[dateFormatter setDateStyle:NSDateFormatterMediumStyle];\
[dateFormatter setTimeStyle:NSDateFormatterShortStyle];\
[dateFormatter setDateFormat:@"HH:mm:ss:SSSSSS"]; \
NSString *str = [dateFormatter stringFromDate:[NSDate date]];\
fprintf(stderr,"\n\nlog time: %s \t [file location: %s:%s:%d]\n content:\t %s\n",[str UTF8String],[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String],__func__,__LINE__,[[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);\
}
#else
//发布阶段 取消打印
#define NSLog(...)
#endif
/**  打印方法名  */
#define LogFunc  NSLog(@"%s",__func__);


/// 字符串简单拼接用法
#ifndef kWGB_STR
#define kWGB_STR(str,...) [NSString stringWithFormat:str,##__VA_ARGS__]
#endif

///适配iOS 11 scrollView向下偏移
#define  adjustsScrollViewInsets_NO(scrollView,vc)\
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
if ([UIScrollView instancesRespondToSelector:NSSelectorFromString(@"setContentInsetAdjustmentBehavior:")]) {\
[scrollView   performSelector:NSSelectorFromString(@"setContentInsetAdjustmentBehavior:") withObject:@(2)];\
} else {\
vc.automaticallyAdjustsScrollViewInsets = NO;\
}\
_Pragma("clang diagnostic pop") \
} while (0)


///判断字符串为空  YES 为空  NO不为空
#define NULLString(string) ((![string isKindOfClass:[NSString class]])||[string isEqualToString:@""] || (string == nil) || [string isEqualToString:@""] || [string isKindOfClass:[NSNull class]]||[[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length] == 0)

//比较两个字符串
#define kCompareTwoString(A,B)  [A isEqualToString:B]

// 检测block是否可用
#define BLOCK_EXEC(block, ...) if (block) { block(__VA_ARGS__); };

/// 防空值判断
#define VerifyValue(value)\
({id tmp;\
if ([value isKindOfClass:[NSNull class]])\
tmp = nil;\
else\
tmp = value;\
tmp;\
})\

//View圆角和加边框 对象,圆角大小,边框宽度,颜色
#define ViewBorderRadius(View,Radius,Width,Color)\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]

// View圆角 对象,圆角大小
#define ViewRadius(View,Radius)\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES]


///MARK:- 获取实例或者参数------------------------

/// 拿到通知中心实例
#define kNotificationCenter [NSNotificationCenter defaultCenter]

//本地存储UserDefault
#define kUserDefaults  [NSUserDefaults standardUserDefaults]

///AppDeleagte
#define kAppdelegate  AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];

///关键盘
#define kCloseKeyboard       [[UIApplication sharedApplication].keyWindow endEditing:YES]

///RootVC
#define kRootVC  [UIApplication sharedApplication].keyWindow.rootViewController

//keyWindow
#define kWindow [UIApplication sharedApplication].keyWindow

//当前window
#define kCurrentWindow [[UIApplication sharedApplication].windows firstObject]

//app名称
#define kAppName [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]

//app版本
#define kAppVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]


//获取当前系统版本
#define kCurrentSystemVersion  [ [ [UIDevice currentDevice]  systemVersion ] floatValue]

//加载比较大的图片 优化性能
#define kLoadImagae(file,type) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:file ofType:type]]
//定义UIImage对象
#define kImageNamed(imgName)  [UIImage imageNamed:imgName]
//获取图片宽高
#define kImgWidth(img)        ((img).size.width)
#define kImgHeight(img)       ((img).size.height)

//获取一段时间间隔  起点  终点
#define kStartTime CFAbsoluteTime start = CFAbsoluteTimeGetCurrent();
#define kEndTime  NSLog(@"Time: %f", CFAbsoluteTimeGetCurrent() - start);

//设置字体
#define kPingFang(F)  [UIFont fontWithName:@"PingFang SC" size:(F)]
#define kBoldPingFang(A) [UIFont fontWithName:@"PingFang-SC-Medium" size:A]
#define kFont(a) [UIFont fontWithName:@"Avenir-Light" size:(a)]

//系统默认字体
#define KFontSize(A)  [UIFont systemFontOfSize: A]
#define kFontBold(A)  [UIFont boldSystemFontOfSize:A]

///MARK:- 布局与适配相关------------------------

//获取view的frame
#define KGetFrame(view)   view.frame

//获取view的size
#define  KGetSize(view)     view.frame.size

//获取view的位置起始点
#define KGetOrigin(view)   view.frame.origin

// 物理屏幕宽度
#define KWIDTH  [[UIScreen mainScreen]bounds].size.width
// 物理屏幕高度
#define KHIGHT [[UIScreen mainScreen]bounds].size.height

// 以iphone6为基准 宽度比例
#define kIphone6ScaleWidth  (KWIDTH/375.0f)

// 高度比例
#define kIphone6ScaleHeight KHIGHT/667.0

// 根据ip6的屏幕来拉伸
#define kRateValue(with) ((with)*(KWIDTH/375.0f))



// View 坐标(x,y)和宽高(width,height)
#define X(v)               (v).frame.origin.x
#define Y(v)               (v).frame.origin.y
#define WIDTH(v)           (v).frame.size.width
#define HEIGHT(v)          (v).frame.size.height

#define MinX(v)            CGRectGetMinX((v).frame) // 获得控件屏幕的x坐标
#define MinY(v)            CGRectGetMinY((v).frame) // 获得控件屏幕的Y坐标

#define MidX(v)            CGRectGetMidX((v).frame) //横坐标加上到控件中点坐标
#define MidY(v)            CGRectGetMidY((v).frame) //纵坐标加上到控件中点坐标

#define MaxX(v)            CGRectGetMaxX((v).frame) //横坐标加上控件的宽度
#define MaxY(v)            CGRectGetMaxY((v).frame) //纵坐标加上控件的高度


NS_INLINE BOOL isIphoneX(){
    if(@available(iOS 11.0, *)) {
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        CGFloat bottomSafeInset = window.safeAreaInsets.bottom;
        if(bottomSafeInset == 34.0f || bottomSafeInset == 21.0f){
            return YES;
        }
    }
    return NO;
}

//状态栏高度
#define kStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
//导航栏+状态栏
#define kNavBarHeight   (44.0 + kStatusBarHeight)
//tabBar高度
#define kTabBarHeight  ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49)

#define IS_Iphone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_Iphone_X   isIphoneX()
#define kBottomHeight IS_Iphone_X? 34 : 0


#define IS_Iphone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

#define IS_Iphone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

#define IS_Iphone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)

#define IS_Iphone7 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)

#define IS_Iphone8 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)

#define IS_Iphone6p ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

#define IS_Iphone7p ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1080, 1920), [[UIScreen mainScreen] currentMode].size) : NO)

#define IS_Iphone8p ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1080, 1920), [[UIScreen mainScreen] currentMode].size) : NO)

#define IS_IphoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

#define IS_IphoneXS ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

#define IS_IphoneXSMax ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) : NO)

#define IS_IphoneXR ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) : NO)



///MARK:- 颜色相关------------------------
//RGB
#define RGB(R,G,B)  [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1.0f]
//颜色 RGBA
#define RGBA(R, G, B, A)   [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]\

//十六进制颜色设置 hex是整型
#define kUIColorHex(hex) [UIColor colorWithHexString: hex]

//白色
#define KWhiteColor  [UIColor whiteColor]
//黑色
#define KBlackColor  [UIColor blackColor]
//红色
#define KRedColor  [UIColor redColor]
//橙色
#define KOrangeColor  [UIColor orangeColor]

//字体颜色
#define kTextColor  RGB(0,0,0)
#define kTextLightColor RGB(50,50,50)
#define kTextLightGrayColor RGB(166,166,166)

//APP主色系
#define kAppMainColor   RGB(249, 154, 75)

// 深色
#define kHeavyMainColor RGB(253,197,136)

// 导航栏颜色
#define kNavgationBarColor RGB(255, 255, 255)

//下划线的颜色
#define kUnderLineColor RGB(231,213,180)

// 底部背景颜色
#define kBgColor RGB(244,243,245)

#define kRedBagColor RGB(246,62,70)

// 辅助色
#define kAssistRedColor  RGB(252,89,114)
#define kAssistGreenColor RGB(74,202,187)

//随机色
#define KRandomColor  [UIColor colorWithRed:arc4random()%256/255.0f green:arc4random()%256/255.0f  blue:arc4random()%256/255.0f alpha:1.0f]


///MARK:- 沙盒目录路径
//获取temp
#define kPathTempPath NSTemporaryDirectory()
//获取沙盒 Document
#define kPathDocumentPath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
//获取沙盒 Cache
#define kPathCachePath [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]


///MARK:- 单例快捷宏
#define singleton_interface(className) + (instancetype)shared##className;
#define singleton_implementation(className) \
static className *_instace; \
\
+ (id)allocWithZone:(struct _NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instace = [super allocWithZone:zone]; \
}); \
\
return _instace; \
} \
\
+ (instancetype)shared##className \
{ \
if (_instace == nil) { \
_instace = [[className alloc] init]; \
} \
\
return _instace; \
}




#endif /* AAMacroConstantHeader_h */
