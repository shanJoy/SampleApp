//
//  GTNotification.m
//  SampleApp
//
//  Created by 张圣俊 on 2020/7/5.
//  Copyright © 2020 张圣俊. All rights reserved.
//

#import "GTNotification.h"
#import <UserNotifications/UserNotifications.h>
#import <UIKit/UIKit.h>

@interface GTNotification ()<UNUserNotificationCenterDelegate>

@end

@implementation GTNotification

+ (GTNotification *)notificationManager{
    static GTNotification *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[GTNotification alloc] init];
    });
    return manager;
}

- (void)checkNotificationAthorization{
    
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    center.delegate = self;
    [center requestAuthorizationWithOptions:UNAuthorizationOptionBadge | UNAuthorizationOptionSound completionHandler:^(BOOL granted, NSError * _Nullable error) {
        
        if (granted) {
            //[self _pushLocalNotification];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [[UIApplication sharedApplication] registerForRemoteNotifications];
            });
        }
    }];
}

#pragma mark -

- (void)_pushLocalNotification{
    
    UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
    content.badge = @(1);
    content.title = @"极客时间";
    content.body = @"从0开发一款APP";
    
    UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:30.f repeats:NO];
    
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:@"_pushLocalNotification" content:content trigger:trigger];
    
    [[UNUserNotificationCenter currentNotificationCenter] addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
        NSLog(@"");
    }];
}

#pragma mark - localpush delegate

- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler {
    completionHandler(UNNotificationPresentationOptionAlert);
}

- (void)userNotification2Center:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void(^)(void))completionHandler {
    // 处理业务逻辑
    completionHandler();
}

@end
