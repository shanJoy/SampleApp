//
//  GTCommenManager.h
//  SampleApp
//
//  Created by 张圣俊 on 2020/7/8.
//  Copyright © 2020 张圣俊. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTCommentManager : NSObject

+ (GTCommentManager *)sharedManager;

- (void)showCommentView;

@end

NS_ASSUME_NONNULL_END
