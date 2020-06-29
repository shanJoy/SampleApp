//
//  GTDetailViewController.h
//  SampleApp
//
//  Created by 张圣俊 on 2020/1/13.
//  Copyright © 2020 张圣俊. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GTMediator.h"

NS_ASSUME_NONNULL_BEGIN

/// 文章底层页
@interface GTDetailViewController : UIViewController<GTDetailViewControllerProtocol>

- (instancetype)initWithUrlString:(NSString *)urlString;

@end

NS_ASSUME_NONNULL_END
