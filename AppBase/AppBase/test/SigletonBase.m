//
//  SigletonBase.m
//  AppBase
//
//  Created by nfl on 2022/10/24.
//

#import "SigletonBase.h"

#define relizeSingleInstanceWithBlock2(name , block) \
static id _instance;\
+ (instancetype)allocWithZone:(struct _NSZone *)zone{\
    static dispatch_once_t onceToken;\
    dispatch_once(&onceToken\
                  , ^{\
        _instance = [super allocWithZone:zone];\
    });\
    return _instance;\
}\
\
- (instancetype)init{\
    static dispatch_once_t onceToken;\
    dispatch_once(&onceToken\
                  , ^{\
        _instance = [super init];\
        block();\
    });\
    return _instance;\
}\
+ (instancetype)shared##name{\
    static dispatch_once_t onceToken;\
    dispatch_once(&onceToken, ^{\
        _instance = [[self alloc] init];\
    });\
    return _instance;\
}
#define relizeSingleInstance2(name) relizeSingleInstanceWithBlock2(name, ^{})

@implementation SigletonBase

relizeSingleInstance2();

- (void)sayHello{
    NSLog(@"Hello !");
}

@end
