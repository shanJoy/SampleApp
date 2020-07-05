//
//  GTNotification.m
//  SampleApp
//
//  Created by 张圣俊 on 2020/7/5.
//  Copyright © 2020 张圣俊. All rights reserved.
//

#import "GTNotification.h"
#import <UserNotifications/UserNotifications.h>

@interface GTNotification ()

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
    
    [[UNUserNotificationCenter currentNotificationCenter] requestAuthorizationWithOptions:UNAuthorizationOptionBadge | UNAuthorizationOptionSound completionHandler:^(BOOL granted, NSError * _Nullable error) {
        NSLog(@"");
    }];
}

@end
