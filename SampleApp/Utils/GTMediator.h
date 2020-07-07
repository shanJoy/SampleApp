//
//  GTMediator.h
//  SampleApp
//
//  Created by 张圣俊 on 2020/6/29.
//  Copyright © 2020 张圣俊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//常用的三种组件化方案

NS_ASSUME_NONNULL_BEGIN

@protocol GTDetailViewControllerProtocol <NSObject>
- (__kindof UIViewController *)detailViewControllerWithUrl:(NSString *)detailUrl;
@end

@interface GTMediator : NSObject

// target action
+ (__kindof UIViewController *)detailViewControllerWithUrl:(NSString *)detailUrl;

// url scheme
typedef void(^GTMediatorProcessBlock)(NSDictionary *params);
+ (void)registerScheme:(NSString *)scheme processBlock:(GTMediatorProcessBlock)processBlock;
+ (void)openUrl:(NSString *)url params:(NSDictionary *)params;

// protocol class
+ (void)registerProtol:(Protocol *)proto class:(Class)cls;
+ (Class)classForProtol:(Protocol *)proto;

@end

NS_ASSUME_NONNULL_END
