//
//  GTListItem.m
//  SampleApp
//
//  Created by 张圣俊 on 2020/1/14.
//  Copyright © 2020 张圣俊. All rights reserved.
//

#import "GTListItem.h"

@implementation GTListItem

#pragma mark - 实现 NSSecureCoding 协议
- (nullable instancetype)initWithCoder:(NSCoder *)coder{
    self = [super init];
    if (self) {
        self.category = [coder decodeObjectForKey:@"category"];
        self.uniquekey = [coder decodeObjectForKey:@"uniquekey"];
        self.title = [coder decodeObjectForKey:@"title"];
        self.date = [coder decodeObjectForKey:@"date"];
        self.author_name = [coder decodeObjectForKey:@"author_name"];
        self.url = [coder decodeObjectForKey:@"url"];
        self.thumbnail_pic_s = [coder decodeObjectForKey:@"thumbnail_pic_s"];
        self.thumbnail_pic_s02 = [coder decodeObjectForKey:@"thumbnail_pic_s02"];
        self.thumbnail_pic_s03 = [coder decodeObjectForKey:@"thumbnail_pic_s03"];
    }
    return  self;
}
- (void)encodeWithCoder:(NSCoder *)coder{
    [coder encodeObject:self.category forKey:@"category"];
    [coder encodeObject:self.uniquekey forKey:@"uniquekey"];
    [coder encodeObject:self.title forKey:@"title"];
    [coder encodeObject:self.date forKey:@"date"];
    [coder encodeObject:self.author_name forKey:@"author_name"];
    [coder encodeObject:self.url forKey:@"url"];
    [coder encodeObject:self.thumbnail_pic_s forKey:@"thumbnail_pic_s"];
    [coder encodeObject:self.thumbnail_pic_s02 forKey:@"thumbnail_pic_s02"];
    [coder encodeObject:self.thumbnail_pic_s03 forKey:@"thumbnail_pic_s03"];
}

+ (BOOL)supportsSecureCoding {
    return YES;
}

#pragma mark - public method
- (void)configWithDictionary:(NSDictionary *)dictionary{
//#warning - 类型是否匹配
    self.category = [dictionary objectForKey:@"category"];
    self.uniquekey = [dictionary objectForKey:@"uniquekey"];
    self.title = [dictionary objectForKey:@"title"];
    self.date = [dictionary objectForKey:@"date"];
    self.author_name = [dictionary objectForKey:@"author_name"];
    self.url = [dictionary objectForKey:@"url"];
    self.thumbnail_pic_s = [dictionary objectForKey:@"thumbnail_pic_s"];
    self.thumbnail_pic_s02 = [dictionary objectForKey:@"thumbnail_pic_s02"];
    self.thumbnail_pic_s03 = [dictionary objectForKey:@"thumbnail_pic_s03"];
}

@end
