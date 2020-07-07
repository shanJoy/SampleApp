//
//  GTSplashView.m
//  SampleApp
//
//  Created by 张圣俊 on 2020/6/23.
//  Copyright © 2020 张圣俊. All rights reserved.
//

#import "GTSplashView.h"
#import "GTScreen.h"

@interface GTSplashView ()

@property(nonatomic, strong, readwrite) UIButton *button;

@end

@implementation GTSplashView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.image = [UIImage imageNamed:@"icon.bundle/splash.png"];
        [self addSubview:({
            _button = [[UIButton alloc] initWithFrame:UIRect(330, 100, 60, 40)];
            _button.backgroundColor = [UIColor lightGrayColor];
            [_button setTitle:@"跳过" forState:UIControlStateNormal];
            [_button addTarget:self action:@selector(_removeSlashView) forControlEvents:UIControlEventTouchUpInside];
            _button;
        })];
        self.userInteractionEnabled = YES;
        
    }
    return self;
}

#pragma mark -
- (void)_removeSlashView{
    [self removeFromSuperview];
}

@end
