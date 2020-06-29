//
//  GTMediator.m
//  SampleApp
//
//  Created by 张圣俊 on 2020/6/29.
//  Copyright © 2020 张圣俊. All rights reserved.
//

#import "GTMediator.h"
#import "GTDetailViewController.h"

@implementation GTMediator

+ (__kindof UIViewController *)detailViewControllerWithUrl:(NSString *)detailUrl {
    GTDetailViewController *controller = [[GTDetailViewController alloc] initWithUrlString:detailUrl];
    return controller;
}

@end
