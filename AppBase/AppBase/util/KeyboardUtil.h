//
//  KeyboardUtil.h
//  AppBase
//
//  Created by nfl on 2022/11/18.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface KeyboardUtil : NSObject

declareSingleInstance();

/**
 处理键盘遮盖
 @param handleView 可能会被遮盖的子视图
 @param offsetY 如果父视图是可滑动视图，则 需传入在Y 轴上的 偏移量， 否则传 0
 */
- (void)handleKeyBoderAction:(UIView *)handleView  offsetY:(CGFloat)offsetY;

@end

NS_ASSUME_NONNULL_END
