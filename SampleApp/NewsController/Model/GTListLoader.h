//
//  GTListLoader.h
//  SampleApp
//
//  Created by 张圣俊 on 2020/1/14.
//  Copyright © 2020 张圣俊. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GTListItem;
NS_ASSUME_NONNULL_BEGIN

typedef void(^GTListLoaderFinishBlock)(BOOL success, NSArray<GTListItem *> *dataArray);


/// 列表请求
@interface GTListLoader : NSObject

- (void)loadListDataWithFinishBlock:(GTListLoaderFinishBlock)finishBlock;

@end

NS_ASSUME_NONNULL_END
