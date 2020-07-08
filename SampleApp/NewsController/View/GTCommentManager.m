//
//  GTCommenManager.m
//  SampleApp
//
//  Created by 张圣俊 on 2020/7/8.
//  Copyright © 2020 张圣俊. All rights reserved.
//

#import "GTCommentManager.h"
#import <UIKit/UIKit.h>
#import "GTScreen.h"

@interface GTCommentManager ()<UITextViewDelegate>

@property(nonatomic, strong, readwrite) UIView *backgroudView;
@property(nonatomic, strong, readwrite) UITextView *textView;

@end

@implementation GTCommentManager

+ (GTCommentManager *)sharedManager {
    static GTCommentManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[GTCommentManager alloc] init];
    });
    return manager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _backgroudView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _backgroudView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.8];
        [_backgroudView addGestureRecognizer: [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_tapBackgroud)]];
        
        [_backgroudView addSubview:({
            _textView = [[UITextView alloc] initWithFrame:CGRectMake(0, _backgroudView.frame.size.height, SCREEN_WIDTH, UI(100))];
            _textView.backgroundColor = [UIColor whiteColor];
            _textView.layer.borderColor = [UIColor lightGrayColor].CGColor;
            _textView.layer.borderWidth = 5.f;
            _textView.delegate = self;
            _textView;
        })];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_doTextViewAnimationWithNotification:) name:UIKeyboardWillChangeFrameNotification object:nil];
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark -
- (void)showCommentView {
    [[UIApplication sharedApplication].windows[0] addSubview:_backgroudView];
    [_textView becomeFirstResponder];
}

#pragma mark -

- (void)_tapBackgroud {
    [_textView resignFirstResponder];
    [_backgroudView removeFromSuperview];
}

- (void)_doTextViewAnimationWithNotification:(NSNotification *)noti {
    
    CGFloat duration = [[noti.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    CGRect keyboardFrame = [[noti.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    NSLog(@"%f",SCREEN_HEIGHT);
    if (keyboardFrame.origin.y >= SCREEN_HEIGHT) {
        //收起
        [UIView animateWithDuration:duration animations:^{
            self.textView.frame = CGRectMake(0, self.backgroudView.frame.size.height, SCREEN_WIDTH, UI(100));
        }];
    }else {
        self.textView.frame = CGRectMake(0, self.backgroudView.frame.size.height, SCREEN_WIDTH, UI(100));
        [UIView animateWithDuration:duration animations:^{
            self.textView.frame = CGRectMake(0, self.backgroudView.frame.size.height - keyboardFrame.size.height - UI(100), SCREEN_WIDTH, UI(100));
        }];
    }
}

#pragma mark -
// delegate

@end
