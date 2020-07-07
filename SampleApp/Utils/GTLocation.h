//
//  GTLocation.h
//  SampleApp
//
//  Created by 张圣俊 on 2020/7/5.
//  Copyright © 2020 张圣俊. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// app 中统一的位置信息管理
@interface GTLocation : NSObject

+ (GTLocation *)locationManager;

- (void)checkLocationAthorization;

@end

NS_ASSUME_NONNULL_END
