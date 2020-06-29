//
//  GTMediator.m
//  SampleApp
//
//  Created by 张圣俊 on 2020/6/29.
//  Copyright © 2020 张圣俊. All rights reserved.
//

#import "GTMediator.h"

@implementation GTMediator

+ (__kindof UIViewController *)detailViewControllerWithUrl:(NSString *)detailUrl {
    
    Class detailCls = NSClassFromString(@"GTDetailViewController");
    UIViewController *controller = [[detailCls alloc] performSelector:NSSelectorFromString(@"initWithUrlString:") withObject:detailUrl];
    return controller;
}

@end
