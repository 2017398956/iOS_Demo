//
//  DrawView+DrawHelper.m
//  AppBase
//
//  Created by nfl on 2022/11/2.
//

#import "DrawView+DrawHelper.h"
#import <objc/runtime.h>

@implementation DrawView (DrawHelper)

void (^clearImageBlock)(void);

- (void)clearImage{
    clearImageBlock = ^{};
}

- (void)drawRect:(CGRect)rect{
//    NSLog(@"DrawView+Drawhelper: %@", NSStringFromSelector(_cmd));
//    unsigned int methodCount;
//    // 获取类的方法列表
//    Method *methodList = class_copyMethodList([self class], &methodCount);
//    for (int i = methodCount - 1; i > 0; i--) {
//        Method method = methodList[i];
//        SEL sel = method_getName(method);// 方法名称
//        IMP imp = method_getImplementation(method);// 指向方法执行地址的指针
//        NSLog(@"方法名称： %@", [NSString stringWithUTF8String:sel_getName(sel)]);
//        if (sel == _cmd) {
//            void (*fundtion)(id, SEL) = (void *)imp;
//            fundtion(self, sel);
//            break;
//        }
//    }
//    free(methodList); // 在C语言中但凡用到了 new/creat/copy 这类函数,就要手动释放指针
    
    excOriginMethod();
    if(clearImageBlock){
        [[UIColor blackColor] setFill];
        UIRectFill(self.bounds);
        clearImageBlock = nil;
    }
    
    
}

@end
