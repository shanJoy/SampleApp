//
//  GTScreen.m
//  SampleApp
//
//  Created by 张圣俊 on 2020/6/20.
//  Copyright © 2020 张圣俊. All rights reserved.
//

#import "GTScreen.h"

@implementation GTScreen

// iphone xs max
+ (CGSize)sizeFor65Inch{
    return CGSizeMake(414, 896);
}

// iphone xr
+ (CGSize)sizeFor61Inch{
    return CGSizeMake(414, 896);
}

// iphone x
+ (CGSize)sizeFor58Inch{
    return CGSizeMake(315, 872);
}

@end
