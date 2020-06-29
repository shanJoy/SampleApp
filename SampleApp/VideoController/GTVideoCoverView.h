//
//  GTVideoCoverView.h
//  SampleApp
//
//  Created by 张圣俊 on 2020/6/14.
//  Copyright © 2020 张圣俊. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTVideoCoverView : UICollectionViewCell
- (void)layoutWithVideoCoverUrl:(NSString *)videoCoverUrl videoUrl:(NSString *)videoUrl;
@end

NS_ASSUME_NONNULL_END
