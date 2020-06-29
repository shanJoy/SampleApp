//
//  AppDelegate.m
//  SampleApp
//
//  Created by 张圣俊 on 2020/1/7.
//  Copyright © 2020 张圣俊. All rights reserved.
//

#import "AppDelegate.h"
#import "GTNewsViewController.h"
#import "GTVideoViewController.h"
#import "GTRecommandViewController.h"
#import "GTSplashView.h"

@interface AppDelegate ()<UITabBarControllerDelegate>

@property (nonatomic, readwrite, strong) UIWindow *window1;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    if (@available(iOS 13.0, *)) {
    } else {
        
//        _window1 = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
//        _window1.rootViewController = [[UITabBarController alloc]init];
//        _window1.backgroundColor = [UIColor whiteColor];
//        [_window1 makeKeyAndVisible];
        
        _window1 = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

        UITabBarController *tabbarController = [[UITabBarController alloc] init];

//        GTNewsViewController *newsViewController = [[GTNewsViewController alloc] init];
//
//        GTVideoViewController *videoController = [[GTVideoViewController alloc] init];
//
//        GTRecommandViewController *recommentController = [[GTRecommandViewController alloc] init];

        UIViewController *controller4 = [[UIViewController alloc] init];
        controller4.view.backgroundColor = [UIColor systemPinkColor];
        controller4.tabBarItem.title = @"我的";
        controller4.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/home@2x.png"];
        controller4.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/home_selected@2x.png"];

        [tabbarController setViewControllers:@[controller4, controller4, controller4, controller4]];
        tabbarController.delegate = self;

        UINavigationController *navgationController = [[UINavigationController alloc] initWithRootViewController:tabbarController];

        _window1.rootViewController = navgationController;

        [_window1 makeKeyAndVisible];
        
        // 开了就报错
//        [_window1 addSubview:({
//               GTSplashView *splashView = [[GTSplashView alloc] initWithFrame:_window1.bounds];
//               splashView;
//           })];
        
    }

    return YES;
}

#pragma mark - UISceneSession lifecycle

- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}

- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}

#pragma mark - ios13 之后的版本 APP的UI生命周期交由SceneDelegate管理

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options {
    return YES;
}

@end
