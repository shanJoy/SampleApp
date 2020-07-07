//
//  GTNotification.h
//  SampleApp
//
//  Created by 张圣俊 on 2020/7/5.
//  Copyright © 2020 张圣俊. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// APP 推送管理
@interface GTNotification : NSObject

+ (GTNotification *)notificationManager;

- (void)checkNotificationAthorization;

@end

NS_ASSUME_NONNULL_END
