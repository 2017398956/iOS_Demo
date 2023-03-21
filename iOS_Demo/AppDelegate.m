//
//  AppDelegate.m
//  iOS_Demo
//
//  Created by nfl on 2022/10/11.
//

#import "AppDelegate.h"
#import "BaseUINavigationController.h"
#import "ViewController.h"
#import "SecondViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    if (@available(iOS 13.0, *)) {
    }else{
        if(self.window == nil){
            self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
            self.window.backgroundColor = [UIColor whiteColor];
            ViewController *vc = [[ViewController alloc] init];
            BaseUINavigationController *nc = [[BaseUINavigationController alloc] initWithRootViewController:vc];
            self.window.rootViewController = nc;
            [self.window makeKeyAndVisible];
        }
    }
    MyLog(@"%f,%f",Device_Width,Device_Height);
    
    GenericsTest *genericsTest = [GenericsTest new];
    [genericsTest printGenericsType];
    
    GenericsTest<DrawView *> *genericsTest2 = [GenericsTest new];
    [genericsTest2 printGenericsType];
    
    UIImageView *imageView = [[UIImageView alloc] init];
    UIView *view = imageView;
    MyLog(@"强转后的类型：%@",[view class]);
    NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
        NSString *docDir = [NSString stringWithFormat:@"%@/%@.mp4",[documentPaths objectAtIndex:0],@"collected_short_video"];
    NSURL *url = [[NSURL alloc] initFileURLWithPath:docDir relativeToURL:nil];
    MyLog(@"url.path:%@",url.path);
    NSFileManager *fm = [NSFileManager defaultManager];
    MyLog(@"already exist file:%d", [fm fileExistsAtPath:url.path]);
    BOOL createResult = [fm createFileAtPath:url.path contents:nil attributes:nil];
    MyLog(@"createFileResult:%@",@(createResult));
    return YES;
}

- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window{
    return UIInterfaceOrientationMaskPortrait;
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
