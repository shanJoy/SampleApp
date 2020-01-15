//
//  GTListLoader.m
//  SampleApp
//
//  Created by 张圣俊 on 2020/1/14.
//  Copyright © 2020 张圣俊. All rights reserved.
//

#import "GTListLoader.h"
#import <AFNetworking.h>
#import "GTListItem.h"

@implementation GTListLoader

- (void)loadListDataWithFinishBlock:(GTListLoaderFinishBlock)finishBlock {
    
    NSArray<GTListItem *> *listData = [self _readDataFromLocal];
    if (listData) {
        finishBlock(YES, listData);
    }
    
    // http://v.juhe.cn/toutiao/index?type=top&key=97ad001bfcc2082e2eeaf798bad3d54e
//    NSString *urlString = @"https://static001.geekbang.org/univer/classes/ios_dev/lession/45/toutiao.json";
//    NSURL *listUrl = [NSURL URLWithString:urlString];
//
//    __unused NSURLRequest *loadRequest = [NSURLRequest requestWithURL:listUrl];
//
//    NSURLSession *session = [NSURLSession sharedSession];
//
//    __weak typeof(self) weakSelf = self;
//    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:listUrl completionHandler:^(NSData *_Nullable data, NSURLResponse *_Nullable response, NSError *_Nullable error) {
//        __strong typeof(weakSelf) strongSelf = weakSelf;
//        NSError *jsonError;
//        id jsonObj = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
//
//#warning 类型的检查
//        NSArray *dataArray = [((NSDictionary *)[((NSDictionary *)jsonObj) objectForKey:@"result"]) objectForKey:@"data"];
//        NSMutableArray *listItemArray = @[].mutableCopy;
//        for (NSDictionary *info in dataArray) {
//            GTListItem *listItem = [[GTListItem alloc] init];
//            [listItem configWithDictionary:info];
//            [listItemArray addObject:listItem];
//        }
//        
//        [strongSelf _archiveListDataWithArray:listItemArray.copy];
//
//        dispatch_async(dispatch_get_main_queue(), ^{
//                           if (finishBlock) {
//                               finishBlock(error == nil, listItemArray.copy);
//                           }
//                       });
//
//        NSLog(@"");
//    }];
//
//    [dataTask resume];
}

#pragma mark - private method
- (NSArray<GTListItem *> *)_readDataFromLocal{
    
     NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
     NSString *cachePath = [pathArray firstObject];
     NSString *listDataPath = [cachePath stringByAppendingPathComponent:@"GTData/list"];
    
     NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSData *readListData = [fileManager contentsAtPath:listDataPath];
    id unarchiveObj = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class],[GTListItem class], nil] fromData:readListData error:nil];
    
    if ([unarchiveObj isKindOfClass:[NSArray class]] && [unarchiveObj count] > 0) {
        return (NSArray<GTListItem *> *)unarchiveObj;
    }
    return nil;;
}

/// 文件管理与存储方案
- (void)_archiveListDataWithArray:(NSArray<GTListItem *> *)array{
    
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    
    NSString *cachePath = [pathArray firstObject];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    // 创建文件夹
    NSString *dataPath = [cachePath stringByAppendingPathComponent:@"GTData"];
    NSError *createError;
    [fileManager createDirectoryAtPath:dataPath withIntermediateDirectories:YES attributes:nil error:&createError];
    
    // 创建文件
    NSString *listDataPath = [dataPath stringByAppendingPathComponent:@"list"];//NSData *listData = [@"abc" dataUsingEncoding:NSUTF8StringEncoding];
    NSData *listData = [NSKeyedArchiver archivedDataWithRootObject:array requiringSecureCoding:YES error:nil];    // 序列化存储
    [fileManager createFileAtPath:listDataPath contents:listData attributes:nil];
    
    
    
    // 反序列化读取
    //NSData *readListData = [fileManager contentsAtPath:listDataPath];
    //id unarchiveObj = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class],[GTListItem class], nil] fromData:readListData error:nil];
    
    // NSUserDefaults
//    [[NSUserDefaults standardUserDefaults] setObject:@"abc" forKey:@"test"];
//    NSString *test = [[NSUserDefaults standardUserDefaults] stringForKey:@"test"];
//    [[NSUserDefaults standardUserDefaults] setObject:listData forKey:@"listData"];
//    NSData *testListData = [[NSUserDefaults standardUserDefaults] dataForKey:@"listData"];
//    id unarchiveObj = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class],[GTListItem class], nil] fromData:testListData error:nil];
    
    // 查询文件
//    BOOL fileExist = [fileManager fileExistsAtPath:listDataPath];
    
    // 删除文件
//    if (fileExist) {
//        [fileManager removeItemAtPath:listDataPath error:nil];
//    }
    
    // 追加文件内容
//    NSFileHandle *fileHandle = [NSFileHandle fileHandleForUpdatingAtPath:listDataPath];
//
//    [fileHandle seekToEndOfFile];
//    [fileHandle writeData:[@"def" dataUsingEncoding:NSUTF8StringEncoding]];
//    [fileHandle synchronizeFile];
//    [fileHandle closeFile];
    
}

@end
