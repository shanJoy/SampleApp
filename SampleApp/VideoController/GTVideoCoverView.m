//
//  GTVideoCoverView.m
//  SampleApp
//
//  Created by 张圣俊 on 2020/6/14.
//  Copyright © 2020 张圣俊. All rights reserved.
//

#import "GTVideoCoverView.h"
#import "GTVideoPlayer.h"
#import "GTVideoToolBar.h"

@interface GTVideoCoverView()

@property(nonatomic, strong, readwrite) UIImageView *coverView;
@property(nonatomic, strong, readwrite) UIImageView *playButton;
@property(nonatomic, copy, readwrite) NSString *videoUrl;
@property(nonatomic, strong, readwrite) GTVideoToolBar *toolBar;

@end

@implementation GTVideoCoverView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:({
            _coverView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height - GTVideoToolBarHeight)];
            _coverView;
        })];
        
        [_coverView addSubview:({
            _playButton = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width - 50)/2, (frame.size.height - 50 - GTVideoToolBarHeight)/2, 50, 50)];
            _playButton.image = [UIImage imageNamed:@"icon.bundle/videoPlay@3x.png"];
            _playButton;
        })];
        
        [self addSubview:({
            _toolBar = [[GTVideoToolBar alloc] initWithFrame:CGRectMake(0, _coverView.frame.size.height, frame.size.width, GTVideoToolBarHeight)];
            _toolBar;
        })];
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_tapToPlay)];
        [self addGestureRecognizer:tapGesture];
    }
    return self;
}

-(void)dealloc{
}

#pragma mark - public method
- (void)layoutWithVideoCoverUrl:(NSString *)videoCoverUrl videoUrl:(NSString *)videoUrl{
    _coverView.image = [UIImage imageNamed:videoCoverUrl];
    _videoUrl = videoUrl;
    [_toolBar layoutWithModel:nil];
}

#pragma mark - private method
- (void)_tapToPlay{
    [[GTVideoPlayer Player] playVideoWithUrl:_videoUrl attachView:_coverView];
}


@end
