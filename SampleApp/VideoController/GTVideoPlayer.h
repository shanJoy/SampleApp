//
//  GTVideoPlayer.h
//  SampleApp
//
//  Created by 张圣俊 on 2020/6/16.
//  Copyright © 2020 张圣俊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTVideoPlayer : NSObject

+ (GTVideoPlayer *)Player;

- (void)playVideoWithUrl:(NSString *)videoUrl attachView:(UIView *)attachView;

@end

NS_ASSUME_NONNULL_END
