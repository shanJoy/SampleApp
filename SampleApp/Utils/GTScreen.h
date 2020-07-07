//
//  GTScreen.h
//  SampleApp
//
//  Created by 张圣俊 on 2020/6/20.
//  Copyright © 2020 张圣俊. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

//#define IS_LANDSCAPE (UIInterfaceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation]))
// iOS13.0 之后
#define IS_LANDSCAPE (UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].windows.firstObject.windowScene.interfaceOrientation))

#define SCREEN_WIDTH (IS_LANDSCAPE ? [[UIScreen mainScreen] bounds].size.height : [[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT (IS_LANDSCAPE ? [[UIScreen mainScreen] bounds].size.width : [[UIScreen mainScreen] bounds].size.height)

#define IS_IPHONE_X_XR_MAX (IS_IPNONE_X || IS_IPNONE_XR || IS_IPNONE_MAX)

#define IS_IPNONE_X (SCREEN_WIDTH == [GTScreen sizeFor58Inch].width && SCREEN_HEIGHT == [GTScreen sizeFor58Inch].height)
#define IS_IPNONE_XR (SCREEN_WIDTH == [GTScreen sizeFor61Inch].width && SCREEN_HEIGHT == [GTScreen sizeFor61Inch].height && [UIScreen mainScreen].scale == 2)
#define IS_IPNONE_MAX (SCREEN_WIDTH == [GTScreen sizeFor65Inch].width && SCREEN_HEIGHT == [GTScreen sizeFor65Inch].height && [UIScreen mainScreen].scale == 3)
#define STATUSBARHEIGHT (IS_IPHONE_X_XR_MAX ? 44 : 20)

#define UI(x) UIAdapter(x)
#define UIRect(x,y,width,height) UIRectAdapter(x,y,width,height)

static inline NSInteger UIAdapter (float x){
    // 1 - 分机型，特定的比例
    
    // 2 - 屏幕宽度，按比例适配
    CGFloat scale = 414 / SCREEN_WIDTH;
    return (NSInteger)x / scale;
}

static inline CGRect UIRectAdapter(x,y,width,height){
    //[UIApplication sharedApplication].windows.firstObject.windowScene.interfaceOrientation;
    return CGRectMake(UIAdapter(x), UIAdapter(y), UIAdapter(width), UIAdapter(height));
}

@interface GTScreen : NSObject

// iphone xs max
+ (CGSize)sizeFor65Inch;

// iphone xr
+ (CGSize)sizeFor61Inch;

// iphone x
+ (CGSize)sizeFor58Inch;

@end

NS_ASSUME_NONNULL_END
