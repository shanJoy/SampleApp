//
//  GTListItem.h
//  SampleApp
//
//  Created by 张圣俊 on 2020/1/14.
//  Copyright © 2020 张圣俊. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 列表结构化数据
@interface GTListItem : NSObject<NSSecureCoding>

@property(nonatomic, copy, readwrite) NSString *category;
@property(nonatomic, copy, readwrite) NSString *uniquekey;
@property(nonatomic, copy, readwrite) NSString *title;
@property(nonatomic, copy, readwrite) NSString *date;
@property(nonatomic, copy, readwrite) NSString *author_name;
@property(nonatomic, copy, readwrite) NSString *url;
@property(nonatomic, copy, readwrite) NSString *thumbnail_pic_s;
@property(nonatomic, copy, readwrite) NSString *thumbnail_pic_s02;
@property(nonatomic, copy, readwrite) NSString *thumbnail_pic_s03;

- (void)configWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
