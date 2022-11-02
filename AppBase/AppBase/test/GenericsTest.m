//
//  GenericsTest.m
//  AppBase
//
//  Created by nfl on 2022/11/2.
//

#import "GenericsTest.h"
#import <objc/runtime.h>

@implementation GenericsTest

- (void)printGenericsType{
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
    
    unsigned int propertyCount;
    objc_property_t *properties = class_copyPropertyList([self class], &propertyCount);
    
    NSMutableArray *propertyArray = [NSMutableArray arrayWithCapacity:propertyCount];
    for (int i = 0; i < propertyCount; i++) {
        // 得到的 propertyName 为 C 语言的字符串
        const char *propertyName = property_getName(properties[i]);
        const char *propertyAttributes = property_getAttributes(properties[i]);
        [propertyArray addObject:[NSString stringWithUTF8String:propertyName]];
        NSLog(@"propertyName:%@,attributes:%@",[NSString stringWithUTF8String:propertyName], [NSString stringWithUTF8String:propertyAttributes]);
    }
    free(properties);
}

@end
