//
//  GTDeleteCellView.m
//  SampleApp
//
//  Created by 张圣俊 on 2020/1/13.
//  Copyright © 2020 张圣俊. All rights reserved.
//

#import "GTDeleteCellView.h"

@interface GTDeleteCellView ()

@property(nonatomic, strong, readwrite) UIView *backgroundView;
@property(nonatomic, strong, readwrite) UIButton *deleteButton;
@property(nonatomic, copy, readwrite) dispatch_block_t deleteBlock;

@end

@implementation GTDeleteCellView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:({
            _backgroundView = [[UIView alloc] initWithFrame:self.bounds];
            _backgroundView.backgroundColor = [UIColor greenColor];
            [_backgroundView addGestureRecognizer:({
                UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissDeleteView)];
                tapGesture;
            })];
            _backgroundView.alpha = 0.5;
            _backgroundView;
            
        })];
        [self addSubview:({
            _deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
            [_deleteButton addTarget:self action:@selector(_click) forControlEvents:UIControlEventTouchUpInside];
            _deleteButton.backgroundColor = [UIColor orangeColor];
            _deleteButton;
        })];
    }
    return self;
}

- (void)showDeleteViewFromPoint:(CGPoint)point clickBlock:(dispatch_block_t) clickBlock{
    
    _deleteButton.frame = CGRectMake(point.x, point.y, 0, 0);
    _deleteBlock = [clickBlock copy];
    
    //[[UIApplication sharedApplication].keyWindow addSubview:self]; // ios13 废弃keyWindow
    [[UIApplication sharedApplication].windows.firstObject addSubview:self];
    
    [UIView animateWithDuration:1.f delay:0.f usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.deleteButton.frame = CGRectMake((self.bounds.size.width -200)/2, (self.bounds.size.height -200)/2, 200, 200);
    } completion:^(BOOL finished) {
        NSLog(@"");
    }];
}

- (void)dismissDeleteView{
    [self removeFromSuperview];
}

- (void)_click{
    if (_deleteBlock) {
        _deleteBlock();
    }
    [self removeFromSuperview];
}

@end
