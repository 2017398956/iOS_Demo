//
//  NSObject+Helper.m
//  IVCS
//
//  Created by nfl on 2021/12/13.
//  Copyright © 2021 zealcomm user. All rights reserved.
//

#import "NSObject+Helper.h"
#import <objc/runtime.h>

@implementation NSObject (Helper)
// 扩展performSelector方法，支持多参数（系统最多只支持2个参数）
- (id)performSelector:(SEL)aSel withObjects:(NSArray*)objects {
    id res = nil;

    // 1 根据sel实例化NSMethodSignature
    NSMethodSignature *signature = [[self class] instanceMethodSignatureForSelector:aSel];
    if (!signature) {
        // 没找到，抛出异常
        @throw [NSException exceptionWithName:@"抛异常错误" reason:@"没有这个方法，或这个方法名字错误" userInfo:nil];
        return res;
    }
    // 2 创建invocation对象
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    // 3 设置调用者
    [invocation setTarget:self];
    // 4 设置selector
    [invocation setSelector:aSel];
    // 5 设置参数
    NSUInteger argsCount = signature.numberOfArguments - 2; // 去掉默认的2个参数：self和_cmd(调用者target和selector)
    NSUInteger arrCount = objects.count;
    // 不能简单的通过遍历参数数组来设置参数，因为外界传进来的参数个数是不可控的，而是取上述两者之间最小值
    NSUInteger resultCount = MIN(argsCount, arrCount);
    for (int i=0; i<resultCount; i++) {
        id obj = objects[i];
        if ([obj isKindOfClass:[NSNull class]]) {
            obj = nil;
        }
        if ([obj isKindOfClass:[NSNumber class]]) {
            [invocation setArgument:&obj atIndex:i+2];
        }else{
            [invocation setArgument:&obj atIndex:i+2];
        }
    }
    // 6 调用
    [invocation invoke];

    // 7 判断当前调用方法是否有返回值
    if (signature.methodReturnLength != 0) {
        [invocation getReturnValue:&res];
    }
    return res;
}

 //获取对象的所有属性
+ (NSArray *)getAllProperties{
    u_int count = 0;
    //传递count的地址
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    NSMutableArray *propertyArray = [NSMutableArray arrayWithCapacity:count];
    for (int i = 0; i < count; i++) {
        //得到的propertyName为C语言的字符串
        const char *propertyName = property_getName(properties[i]);
        [propertyArray addObject:[NSString stringWithUTF8String:propertyName]];
    }
    free(properties);
    return propertyArray;
}

@end
