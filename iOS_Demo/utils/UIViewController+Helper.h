//
//  UIViewController+Helper.h
//  iOS_Demo
//
//  Created by nfl on 2022/10/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (Helper)

+(void)popGestureClose:(UIViewController *)vc;

+(void)popGestureOpen:(UIViewController *)vc;

@end

NS_ASSUME_NONNULL_END
