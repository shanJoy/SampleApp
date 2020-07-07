//
//  TodayViewController.m
//  GTToday
//
//  Created by 张圣俊 on 2020/7/7.
//  Copyright © 2020 张圣俊. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

@interface TodayViewController () <NCWidgetProviding>

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:({
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2-150, 0, 300, 100)];
        [button setTitle:@"点击跳转" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(_openSampleApp) forControlEvents:UIControlEventTouchUpInside];
        button;
    })];
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}


- (void)_openSampleApp {
    [self.extensionContext openURL:[NSURL URLWithString:@"GTTest://"] completionHandler:^(BOOL success) {
        
    }];
}

@end
