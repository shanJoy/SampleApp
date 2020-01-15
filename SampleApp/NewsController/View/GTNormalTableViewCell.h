//
//  GTNormalTableViewCell.h
//  SampleApp
//
//  Created by 张圣俊 on 2020/1/13.
//  Copyright © 2020 张圣俊. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class GTListItem;

#pragma mark - 定义 delegate，用于确定点击了哪个cell 哪个button

/// 点击删除按钮
@protocol GTNormalTableViewCellDelegate <NSObject>
- (void)tableViewCell:(UITableViewCell *)tableViewCell clickDeleteButton:(UIButton *)deleteButton;
@end

/// 新闻列表cell
@interface GTNormalTableViewCell : UITableViewCell

// x实现
@property(nonatomic, weak, readwrite) id<GTNormalTableViewCellDelegate> delegate;

- (void)layoutTableViewCellWithItem:(GTListItem *)item;

@end

NS_ASSUME_NONNULL_END
