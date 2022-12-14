//
//  BaseUINavigationController.m
//  iOS_Demo
//
//  Created by nfl on 2022/10/13.
//

#import "BaseUINavigationController.h"

@interface BaseUINavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation BaseUINavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置右滑返回手势的代理为自身
    __weak typeof(self) weakself = self;
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.delegate = (id)weakself;
    }
}

#pragma mark - UIGestureRecognizerDelegate

/**
 * 这个方法是在手势将要激活前调用：返回YES允许右滑手势的激活，返回NO不允许右滑手势的激活
 */
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    if (gestureRecognizer == self.interactivePopGestureRecognizer) {
        //屏蔽调用 rootViewController 的滑动返回手势，避免右滑返回手势引起crash
        if (self.viewControllers.count < 2 ||
            self.visibleViewController == [self.viewControllers objectAtIndex:0]) {
            return NO;
        }
    }
    //这里就是非右滑手势调用的方法啦，统一允许激活
    return YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
