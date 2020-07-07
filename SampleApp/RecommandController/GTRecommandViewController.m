//
//  GTRecommandViewController.m
//  SampleApp
//
//  Created by 张圣俊 on 2020/1/12.
//  Copyright © 2020 张圣俊. All rights reserved.
//

#import "GTRecommandViewController.h"

@interface GTRecommandViewController ()<UIScrollViewDelegate, UIGestureRecognizerDelegate>

@end

@implementation GTRecommandViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"推荐";
        self.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/like@2x.png"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/like_selected@2x.png"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.backgroundColor = [UIColor purpleColor];
    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width * 5, self.view.bounds.size.height);
    scrollView.delegate = self;
    NSArray *colorArray = @[[UIColor magentaColor],[UIColor cyanColor],[UIColor brownColor],[UIColor redColor],[UIColor systemPinkColor]];
    
    for (int i=0; i<5; i++) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(scrollView.bounds.size.width * i, 0, scrollView.bounds.size.width, scrollView.bounds.size.height)];
        
//        UIImage *image2x = [UIImage imageNamed:@"testScale"];
        
        [view addSubview:({
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
            view.backgroundColor = [UIColor whiteColor];
            UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewClick)];
            gesture.delegate = self;
            [view addGestureRecognizer:gesture];
            view;
        })];
        view.backgroundColor = [colorArray objectAtIndex:i];
        [scrollView addSubview:view];
    }
    
    //scrollView.pagingEnabled = YES;
    [self.view addSubview:scrollView];
}

- (void)viewClick {
    
    NSURL *urlScheme = [NSURL URLWithString:@"testScheme://"];
    
    BOOL canOpenURL = [[UIApplication sharedApplication] canOpenURL:urlScheme];
    
    [[UIApplication sharedApplication] openURL:urlScheme options:nil completionHandler:^(BOOL success) {
        NSLog(@"");
    }];
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    return YES;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //NSLog(@"---scrollViewDidScroll--- %@", @(scrollView.contentOffset.x));
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    //NSLog(@"scrollViewWillBeginDragging");
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    //NSLog(@"scrollViewDidEndDragging");
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    NSLog(@"scrollViewWillBeginDecelerating");
    
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSLog(@"scrollViewDidEndDecelerating");
}

@end
