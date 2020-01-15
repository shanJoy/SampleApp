//
//  AppDelegate.m
//  SampleApp
//
//  Created by 张圣俊 on 2020/1/7.
//  Copyright © 2020 张圣俊. All rights reserved.
//

#import "AppDelegate.h"
#import "GTNewsViewController.h"

@interface AppDelegate ()

@property (nonatomic, readwrite, strong) UIWindow *swindow;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    if (@available(iOS 13.0, *)) {
    } else {
        self.swindow = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

        UITabBarController *tabbarController = [[UITabBarController alloc] init];

        GTNewsViewController *viewController = [[GTNewsViewController alloc] init];

        UINavigationController *navgationController = [[UINavigationController alloc] initWithRootViewController:viewController];

        //UIViewController *controller1 = [[UIViewController alloc] init];
        //controller1.view.backgroundColor = [UIColor yellowColor];
        navgationController.tabBarItem.title = @"新闻";
        navgationController.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/page@2x.png"];
        navgationController.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/page_selected@2x.png"];

        UIViewController *controller2 = [[UIViewController alloc] init];
        controller2.view.backgroundColor = [UIColor greenColor];
        controller2.tabBarItem.title = @"视频";
        controller2.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/video@2x.png"];
        controller2.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/video_selected@2x.png"];

        UIViewController *controller3 = [[UIViewController alloc] init];
        controller3.view.backgroundColor = [UIColor orangeColor];
        controller3.tabBarItem.title = @"推荐";
        controller3.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/like@2x.png"];
        controller3.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/like_selected@2x.png"];

        UIViewController *controller4 = [[UIViewController alloc] init];
        controller4.view.backgroundColor = [UIColor systemPinkColor];
        controller4.tabBarItem.title = @"我的";
        controller4.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/home@2x.png"];
        controller4.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/home_selected@2x.png"];

        [tabbarController setViewControllers:@[navgationController, controller2, controller3, controller4]];

        self.swindow.rootViewController = tabbarController;

        [self.swindow makeKeyAndVisible];
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

@end
