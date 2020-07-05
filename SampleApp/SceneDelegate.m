#import "SceneDelegate.h"
#import "GTNewsViewController.h"
#import "GTVideoViewController.h"
#import "GTRecommandViewController.h"
#import "GTSplashView.h"
#import "GTStaticTest.h"
//#import <GTFramework/GTFrameworkTest.h>
#import "GTMineViewController.h"

@interface SceneDelegate ()<UITabBarControllerDelegate>

@end
 
@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    if (@available(iOS 13.0, *)) {
        
        UIWindowScene *windowScene = (UIWindowScene *)scene;
        //self.window = [[UIWindow alloc] initWithWindowScene:windowScene];
        self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        
        [self.window setWindowScene:windowScene];
        
        UITabBarController *tabbarController = [[UITabBarController alloc] init];
        
        GTNewsViewController *newsViewController = [[GTNewsViewController alloc] init];
        
        //UIViewController *controller1 = [[UIViewController alloc] init];
        //controller1.view.backgroundColor = [UIColor yellowColor];
        newsViewController.tabBarItem.title = @"新闻";
        newsViewController.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/page@2x.png"];
        newsViewController.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/page_selected@2x.png"];
        
        GTVideoViewController *videoController = [[GTVideoViewController alloc] init];
        
        GTRecommandViewController *recommandController = [[GTRecommandViewController alloc] init];
       
        GTMineViewController *mineController = [[GTMineViewController alloc] init];
        
        [tabbarController setViewControllers:@[newsViewController,videoController,recommandController,mineController]];
        tabbarController.delegate = self;
        
        UINavigationController *navgationController = [[UINavigationController alloc] initWithRootViewController:tabbarController];
        
        [self.window setRootViewController:navgationController];
        [self.window makeKeyAndVisible];
        
        [self.window addSubview:({
            GTSplashView *splashView = [[GTSplashView alloc] initWithFrame:self.window.bounds];
            splashView;
        })];
    }else{
        NSLog(@"----iOS < 13.0-----");
    }
    
    // static
    //[[GTStaticTest alloc] init];
    
    // framework
    //[[GTFrameworkTest alloc] init];
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    NSLog(@"did select");
}

- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}

- (void)scene:(UIScene *)scene openURLContexts:(NSSet<UIOpenURLContext *> *)URLContexts {
    
    NSEnumerator *enumerator = [URLContexts objectEnumerator];
    UIOpenURLContext *context;
    while (context = [enumerator nextObject]) {
        NSLog(@"context.URL =====%@",context.URL);
        NSLog(@"context.options.sourceApplication ===== %@",context.options.sourceApplication);
    }
    NSLog(@"");
}


@end
