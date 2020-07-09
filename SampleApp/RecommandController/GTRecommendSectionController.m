//
//  GTRecommendSectionController.m
//  SampleApp
//
//  Created by 张圣俊 on 2020/7/9.
//  Copyright © 2020 张圣俊. All rights reserved.
//

#import "GTRecommendSectionController.h"
#import "GTScreen.h"
#import "GTVideoCoverView.h"
#import "GTNormalTableViewCell.h"
#import "GTListItem.h"

@interface GTRecommendSectionController ()

@property(nonatomic, copy, readwrite) GTListItem *listItem;

@end

@implementation GTRecommendSectionController

- (NSInteger)numberOfItems {
    return 2 ;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake(SCREEN_WIDTH, 200);
}

- (__kindof UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    GTVideoCoverView *cell = [self.collectionContext dequeueReusableCellOfClass:[GTVideoCoverView class] forSectionController:self atIndex:index];
    [cell layoutWithVideoCoverUrl:_listItem.thumbnail_pic_s videoUrl:@""];
    //[cell layoutWithVideoCoverUrl:@"videoCover" videoUrl:@""];
    //[cell layoutTableViewCellWithItem:[self.dataArray objectAtIndex:indexPath.row]];
    return cell;
}

#pragma mark -

- (void)didUpdateToObject:(id)object {
    if (object && [object isKindOfClass:[GTListItem class]]) {
        self.listItem = object;
    }
}

- (void)didSelectItemAtIndex:(NSInteger)index {
    // 选中
}

@end
