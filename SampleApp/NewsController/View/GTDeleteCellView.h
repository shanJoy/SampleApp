//
//  GTDeleteCellView.h
//  SampleApp
//
//  Created by 张圣俊 on 2020/1/13.
//  Copyright © 2020 张圣俊. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// 删除cell确认浮层
@interface GTDeleteCellView : UIView

/// 点击删除cell确认浮层
/// @param point 点击的位置
/// @param clickBlock 点击后的操作
- (void)showDeleteViewFromPoint:(CGPoint)point clickBlock:(dispatch_block_t) clickBlock;
@end

NS_ASSUME_NONNULL_END
