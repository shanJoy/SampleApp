//
//  GTMediator.h
//  SampleApp
//
//  Created by 张圣俊 on 2020/6/29.
//  Copyright © 2020 张圣俊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTMediator : NSObject

+ (__kindof UIViewController *)detailViewControllerWithUrl:(NSString *)detailUrl;

@end

NS_ASSUME_NONNULL_END
