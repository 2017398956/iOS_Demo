//
//  UIViewController+Helper.m
//  iOS_Demo
//
//  Created by nfl on 2022/10/13.
//

#import "UIViewController+Helper.h"

@implementation UIViewController (Helper)

+ (void)popGestureClose:(UIViewController *)vc{
    // 禁用侧滑返回手势
    if ([vc.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        // 这里对添加到右滑视图上的所有手势禁用
        for (UIGestureRecognizer *popGesture in vc.navigationController.interactivePopGestureRecognizer.view.gestureRecognizers) {
            popGesture.enabled = NO;
        }
        // 若开启全屏右滑，不能再使用下面方法，请对数组进行处理
        // vc.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
}

+ (void)popGestureOpen:(UIViewController *)vc{
    // 启用侧滑返回手势
    if ([vc.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        //这里对添加到右滑视图上的所有手势启用
        for (UIGestureRecognizer *popGesture in vc.navigationController.interactivePopGestureRecognizer.view.gestureRecognizers) {
            popGesture.enabled = YES;
        }
        //若开启全屏右滑，不能再使用下面方法，请对数组进行处理
        //VC.navigationController.interactivePopGestureRecognizer.enabled = YES;
    }
    
}

@end
